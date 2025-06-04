<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "student_db");

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $result = mysqli_query($conn, "SELECT * FROM students WHERE id=$id");
    $row = mysqli_fetch_assoc($result);
}

if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];

    // Prepare update query
    $sql = "UPDATE students SET name=?, email=?, phone=? WHERE id=?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "sssi", $name, $email, $phone, $id);

    if (mysqli_stmt_execute($stmt)) {
        echo "<p>Student updated successfully!</p>";
    } else {
        echo "<p>Error: " . mysqli_error($conn) . "</p>";
    }

    mysqli_stmt_close($stmt);
    header("Location: view_students.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
</head>
<body>

    <h2>Edit Student</h2>

    <form method="POST">
        <input type="hidden" name="id" value="<?= $row['id'] ?>">

        <table>
            <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" id="name" name="name" value="<?= $row['name'] ?>" required></td>
            </tr>

            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="email" id="email" name="email" value="<?= $row['email'] ?>" required></td>
            </tr>

            <tr>
                <td><label for="phone">Phone:</label></td>
                <td><input type="text" id="phone" name="phone" value="<?= $row['phone'] ?>" required></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <button type="submit" name="update">Update</button>
                </td>
            </tr>
        </table>
    </form>

    <p><a href="view_students.php">Back</a></p>

</body>
</html>
