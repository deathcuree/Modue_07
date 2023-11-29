<?php
// Check if the session started, if not start it.
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Include your database connection file or create a PDO connection here
include('connection.php');
// do not remove this because this will let you connect to the database 
$pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);

// Create a class for Registration of a user and its functions
class UserRegistration
{
    // property
    private $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    // Checks if the full name is valid
    private function validateFullName($fullname)
    {
        $registrationErrors = [];

        if (empty($fullname)) {
            $registrationErrors['fullname'] = "Full name is required.";
        } else {
            if (strlen($fullname) > 100) {
                $registrationErrors['fullname'] = "Full name is too long.";
            }

            // Check for a dictionary of common words and reject if the name is found
            $commonWords = ['test', 'example', 'gibberish', 'random']; // Add more words
            $nameWords = array_map('strtolower', preg_split("/[\s-]+/", strtolower($fullname)));

            foreach ($nameWords as $word) {
                if (in_array($word, $commonWords)) {
                    $registrationErrors['fullname'] = "Please provide a valid full name.";
                    break;
                }
            }

            // Contextual validation: Example checks for common name structure (adjust to your specific needs)
            $nameParts = explode(' ', $fullname);
            if (count($nameParts) < 2) {
                $registrationErrors['fullname'] = "Please provide both first and last names.";
            }
        }

        return $registrationErrors;
    }

    private function fullNameExists($fullname)
    {
        $query = "SELECT COUNT(*) as count FROM user_tbl WHERE fullname = ?";
        $statement = $this->pdo->prepare($query);
        $statement->execute([$fullname]);

        $result = $statement->fetch(PDO::FETCH_ASSOC);
        return $result['count'] > 0; // If count > 0, full name exists
    }

    // Check if the email exists in the database
    private function emailExists($email)
    {
        $query = "SELECT COUNT(*) as count FROM user_tbl WHERE email = ?";
        $statement = $this->pdo->prepare($query);
        $statement->execute([$email]);

        $result = $statement->fetch(PDO::FETCH_ASSOC);
        return $result['count'] > 0; // If count > 0, email exists
    }

    private function validatePassword($password, $repeatPassword)
    {
        $registrationErrors = [];

        if (empty($password)) {
            $registrationErrors['password'] = "Password is required.";
        } else {
            // Check password length
            if (strlen($password) < 12) {
                $registrationErrors['password'] = "Password must be at least 12 characters long.";
            }

            // / Check for combination of uppercase, lowercase letters, and numbers
            if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/', $password)) {
                $registrationErrors['password'] = "Password should contain at least one uppercase letter, one lowercase letter, and one number.";
            }
        }

        return $registrationErrors;
    }

    private function validateRepeatPassword($password, $repeatPassword)
    {
        $registrationErrors = [];

        if ($password !== $repeatPassword) {
            $registrationErrors['repeat_password'] = "Passwords do not match.";
        }

        return $registrationErrors;
    }

    // Register user using the variables that were used in checking if there is a form submitted
    public function registerUser($fullname, $email, $password, $repeatPassword)
    {
        $registrationErrors = [];

        // Validate full name
        $fullnameErrors = $this->validateFullName($fullname);
        if (!empty($fullnameErrors)) {
            return array_merge($registrationErrors, $fullnameErrors);
        }

        // Check if the fullname already exists
        if ($this->fullNameExists($fullname)) {
            return ["fullname" => "This full name is already registered."];
        }

        // Check if the email already exists
        if ($this->emailExists($email)) {
            return ["email" => "This email is already registered."];
        }

        // Check if the password is valid
        $passwordErrors = $this->validatePassword($password, $repeatPassword);
        if (!empty($passwordErrors)) {
            return $passwordErrors;
        }

        // Check if the repeat password is valid
        $passwordRepeatErrors = $this->validateRepeatPassword($password, $repeatPassword);
        if (!empty($passwordRepeatErrors)) {
            return $passwordRepeatErrors;
        }

        try {
            // Hash the password before storing it in the database
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

            // Insert user data into the database
            // prepared statements in pdo
            $stmt = $this->pdo->prepare("INSERT INTO user_tbl (fullname, email, password) VALUES (?, ?, ?)");
            $success = $stmt->execute([$fullname, $email, $hashedPassword]);

            if ($success) {
                // Set session variable for success
                $_SESSION['registration_success'] = true;
                // Return success for AJAX response
                return ["success" => "Registration successful! You can now log in."];
            } else {
                // Display database error
                return ["database" => "Failed to insert data into the database."];
            }
        } catch (PDOException $e) {
            // Display database error
            return ["database" => "Database error: " . $e->getMessage()];
        }
    }
}

// Server for registering a user. 
// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Create an instance of the UserRegistration class
    $userRegistration = new UserRegistration($pdo);

    // Get form data
    $fullname = isset($_POST['fullname']) ? $_POST['fullname'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';
    $repeatPassword = isset($_POST['repeat_password']) ? $_POST['repeat_password'] : '';

    // Register the user
    $registrationErrors = $userRegistration->registerUser($fullname, $email, $password, $repeatPassword);

    // For success message
    header('Content-Type: application/json');
    echo json_encode($registrationErrors);
    exit();
} else {
    // Handle invalid request method
    header('HTTP/1.1 400 Bad Request');
    exit('Invalid request method');
}
