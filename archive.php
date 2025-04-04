<?php
session_start();
include 'db.php';

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    header("Location: Login.php");
    exit();
}

// Fetch archived bills
$sqlArchived = "SELECT * FROM archive_bills";
$resultArchived = $conn->query($sqlArchived);


// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve bill details from POST request
    $billId = $_POST['bill_id'];
    $billName = $_POST['bill_name'];
    $involved = $_POST['involved'];
    $date = $_POST['date'];
    $code = $_POST['code'];

    // Prepare SQL statement to insert into archive_bills
    $sqlArchive = "INSERT INTO archive_bills (bill_id, bill_name, involved, date, code) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sqlArchive);
    $stmt->bind_param("sssss", $billId, $billName, $involved, $date, $code);

    // Execute the statement
    if ($stmt->execute()) {
        // Redirect to archive page after successful archiving
        header("Location: archive.php");
        exit();
    } else {
        echo "Error archiving bill: " . $conn->error;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="dashboard.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div class="wrapper">

    <div class="sidebar">
        <h2>Fair <span>Share</span></h2>
        <ul>
          <li><a href="dashboard.php"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
          <li><a href="bill.php"><i class="fas fa-file-invoice"></i> Bills</a></li>
          <li><a href="archive.php"><i class="fas fa-archive"></i> Archive Bills</a></li>
          <li><a href="createTickets.php"><i class="fas fa-money-bill-wave"></i> Expenses</a></li>    
        </ul>
    </div>
    
    <div class="container">
       <div class="upper">
          <h1><i class="material-icons">dashboard</i> Dashboard</h1>
        </div>  

        <section id="Firstt">
        <div class="borrow">
            <h2>Archive Bills</h2>
            <table>
        <thead>
            <tr>
                <th>Bill ID</th>
                <th>Bill Name</th>
                <th>Involved</th>
                <th>Date</th>
                <th>Code</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($resultArchived && $resultArchived->num_rows > 0) {
                while ($row = $resultArchived->fetch_assoc()) {
                    echo "<tr>
                            <td>{$row['bill_id']}</td>
                            <td>{$row['bill_name']}</td>
                            <td>{$row['involved']}</td>
                            <td>{$row['date']}</td>
                            <td>{$row['code']}</td>
                          </tr>";
                }
            } else {
                echo "<tr><td colspan='5'>No archived bills found.</td></tr>";
            }
            ?>
        </tbody>
            </table>
            </div>
        

        </section>
        
        

 </div>
</body>
</html>



