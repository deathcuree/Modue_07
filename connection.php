<?php
// Create variable names for easy use.
$host = 'localhost';
$dbname = 'ucbr_db';
$user = 'root';
$pass = '';

try {
    // Create a PDO connection. This is the default syntax.
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);

    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check the connection status is ok
    if ($pdo) {
        return "Connected successfully";
    } else {
        return ["database" => "Failed to insert data into the database."];
    }
} catch (PDOException $e) {
    // Log database error
    error_log("Database error: " . $e->getMessage());

    // Return error message
    return ["database" => "Database error: " . $e->getMessage()];
}
