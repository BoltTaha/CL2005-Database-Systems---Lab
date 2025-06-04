<?php
// Include the connection file
include "Connection.php"; 

// Check if the database exists before creating it
$query = "CREATE DATABASE IF NOT EXISTS student_db";

if (mysqli_query($conn, $query)) {
    echo "Database created successfully or already exists.";
} else {
    echo "Error creating database: " . mysqli_error($conn);
}

// Close the connection
mysqli_close($conn);
?>
