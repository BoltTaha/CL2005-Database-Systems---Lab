<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "student_db");

// Handle search, filter, and sorting
$search = isset($_GET['search']) ? $_GET['search'] : '';
$filter = isset($_GET['department']) ? $_GET['department'] : '';
$sort = isset($_GET['sort']) ? $_GET['sort'] : 'id';

// Build query
$query = "SELECT * FROM students WHERE 1";

if ($search) {
    $query .= " AND (name LIKE '%$search%' OR email LIKE '%$search%' OR department LIKE '%$search%')";
}

if ($filter) {
    $query .= " AND department = '$filter'";
}

$query .= " ORDER BY $sort";
$result = mysqli_query($conn, $query);

// Fetch all departments for filter dropdown
$dept_result = mysqli_query($conn, "SELECT DISTINCT department FROM students");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students List</title>
</head>
<body>

    <h2>Students List</h2>

    <!-- Search and Filter Form -->
    <form method="GET">
        <label for="search">Search:</label>
        <input type="text" id="search" name="search" placeholder="Enter Name, Email, or Department" value="<?= htmlspecialchars($search) ?>">

        <label for="department">Filter by Department:</label>
        <select id="department" name="department">
            <option value="">All Departments</option>
            <?php while ($dept = mysqli_fetch_assoc($dept_result)) { ?>
                <option value="<?= htmlspecialchars($dept['department']) ?>" <?= $filter == $dept['department'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($dept['department']) ?>
                </option>
            <?php } ?>
        </select>
        <button type="submit">Search</button>
    </form>

    <!-- Sorting Links -->
    <p>Sort by: 
        <a href="?sort=name">Name</a> | 
        <a href="?sort=cgpa">CGPA</a> | 
        <a href="?sort=enrollment_date">Enrollment Date</a>
    </p>

    <!-- Student Table -->
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Department</th>
            <th>CGPA</th>
            <th>Enrollment Date</th>
            <th>Actions</th>
        </tr>

        <?php while ($row = mysqli_fetch_assoc($result)) { ?>
            <tr>
                <td><?= htmlspecialchars($row['id']) ?></td>
                <td><a href="student_details.php?id=<?= htmlspecialchars($row['id']) ?>"><?= htmlspecialchars($row['name']) ?></a></td>
                <td><?= htmlspecialchars($row['email']) ?></td>
                <td><?= htmlspecialchars($row['phone']) ?></td>
                <td><?= htmlspecialchars($row['dob']) ?></td>
                <td><?= htmlspecialchars($row['gender']) ?></td>
                <td><?= htmlspecialchars($row['address']) ?></td>
                <td><?= htmlspecialchars($row['department']) ?></td>
                <td><?= htmlspecialchars($row['cgpa']) ?></td>
                <td><?= htmlspecialchars($row['enrollment_date']) ?></td>
                <td>
                    <a href="edit_student.php?id=<?= htmlspecialchars($row['id']) ?>">Edit</a> | 
                    <a href="delete_student.php?id=<?= htmlspecialchars($row['id']) ?>" 
                       onclick="return confirm('Are you sure you want to delete <?= htmlspecialchars($row['name']) ?>?')">Delete</a>
                </td>
            </tr>
        <?php } ?>
    </table>

    <p><a href="add_student.php">Add New Student</a></p>

</body>
</html>
