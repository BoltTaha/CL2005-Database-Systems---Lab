<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "student_db");

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $result = mysqli_query($conn, "SELECT * FROM students WHERE id=$id");
    $row = mysqli_fetch_assoc($result);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
</head>
<body>

    <h2>Student Details</h2>

    <?php if ($row): ?>
        <table border="1">
            <?php foreach ($row as $key => $value): ?>
                <tr>
                    <td><strong><?= ucfirst(str_replace("_", " ", $key)) ?>:</strong></td>
                    <td><?= $value ?></td>
                </tr>
            <?php endforeach; ?>
        </table>
    <?php else: ?>
        <p>Student not found!</p>
    <?php endif; ?>

    <p><a href="view_students.php">Back</a></p>

</body>
</html>
