<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "student_db");

if (isset($_POST['submit'])) {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $phone = trim($_POST['phone']);
    $dob = $_POST['dob'];
    $gender = $_POST['gender'];
    $address = trim($_POST['address']);
    $department = trim($_POST['department']);
    $cgpa = $_POST['cgpa'];
    $enrollment_date = $_POST['enrollment_date'];

    $errors = [];

    // Validate required fields
    if (empty($name) || empty($email) || empty($phone) || empty($dob) || empty($gender) ||
        empty($address) || empty($department) || empty($cgpa) || empty($enrollment_date)) {
        $errors[] = "All fields are required!";
    }

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format!";
    }

    // Validate CGPA range (0.00 - 4.00)
    if (!is_numeric($cgpa) || $cgpa < 0.00 || $cgpa > 4.00) {
        $errors[] = "CGPA must be between 0.00 and 4.00!";
    }

    // If no errors, proceed with insertion
    if (empty($errors)) {
        // Prepare SQL statement
        $sql = "INSERT INTO students (name, email, phone, dob, gender, address, department, cgpa, enrollment_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, "sssssssds", $name, $email, $phone, $dob, $gender, $address, $department, $cgpa, $enrollment_date);

        // Execute and check result
        if (mysqli_stmt_execute($stmt)) {
            echo "<p>Student added successfully!</p>";
        } else {
            echo "<p>Error: " . mysqli_error($conn) . "</p>";
        }

        mysqli_stmt_close($stmt);
    } else {
        // Display validation errors
        foreach ($errors as $error) {
            echo "<p>$error</p>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
</head>
<body>

    <h2>Add New Student</h2>

    <form method="POST">
        <table>
            <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" id="name" name="name" required></td>
            </tr>

            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="email" id="email" name="email" required></td>
            </tr>

            <tr>
                <td><label for="phone">Phone:</label></td>
                <td><input type="text" id="phone" name="phone" required></td>
            </tr>

            <tr>
                <td><label for="dob">DOB:</label></td>
                <td><input type="date" id="dob" name="dob" required></td>
            </tr>

            <tr>
                <td><label for="gender">Gender:</label></td>
                <td>
                    <input type="radio" id="male" name="gender" value="Male" required>
                    <label for="male">Male</label>
                    
                    <input type="radio" id="female" name="gender" value="Female" required>
                    <label for="female">Female</label>
                    
                    <input type="radio" id="other" name="gender" value="Other" required>
                    <label for="other">Other</label>
                </td>
            </tr>

            <tr>
                <td><label for="address">Address:</label></td>
                <td><textarea id="address" name="address" required></textarea></td>
            </tr>

            <tr>
                <td><label for="department">Department:</label></td>
                <td><input type="text" id="department" name="department" required></td>
            </tr>

            <tr>
                <td><label for="cgpa">CGPA:</label></td>
                <td><input type="number" id="cgpa" step="0.01" name="cgpa" required min="0" max="4"></td>
            </tr>

            <tr>
                <td><label for="enrollment_date">Enrollment Date:</label></td>
                <td><input type="date" id="enrollment_date" name="enrollment_date" required></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <button type="submit" name="submit">Add Student</button>
                </td>
            </tr>
        </table>
    </form>

    <p><a href="view_students.php">View Students</a></p>

</body>
</html>
