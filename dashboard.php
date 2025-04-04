<?php
session_start();
include 'db.php';

// Check if the database connection is established
if ($conn) {
    // Check if the form is submitted
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Get the bill details from the form
        $bill_id = $_POST['bill_id'];
        $bill_name = $_POST['bill_name'];
        $involved = $_POST['involved'];
        $date = $_POST['date'];
        $code = $_POST['code'];

        // Prepare the SQL statements
        $sqlDelete = "DELETE FROM bills WHERE bill_id = ?";
        $sqlInsert = "INSERT INTO archive_bills (bills_id, bills_name, involved, date, code) VALUES (?, ?, ?, ?, ?)";

        // Start a transaction
        $conn->begin_transaction();

        try {
            // Delete the bill from the bills table
            $stmtDelete = $conn->prepare($sqlDelete);
            $stmtDelete->bind_param("i", $bill_id);
            $stmtDelete->execute();

            // Insert the bill into the archive_bills table
            $stmtInsert = $conn->prepare($sqlInsert);
            $stmtInsert->bind_param("issss", $bill_id, $bill_name, $involved, $date, $code);
            $stmtInsert->execute();

            // Commit the transaction
            $conn->commit();
            echo "Bill archived successfully.";
        } catch (Exception $e) {
            // Rollback the transaction in case of error
            $conn->rollback();
            echo "Error archiving bill: " . $e->getMessage();
        }
    }

    // Fetch the bills to display
    $sqlBorrowed = "SELECT bill_id, bill_name, involved, date, code FROM bills"; 
    $resultBorrowed = $conn->query($sqlBorrowed); 
} else {
    echo "Database connection failed.";
    exit();
}

// Check if user is logged in
if (!isset($_SESSION['username'])) {
    header("Location: Login.php");
    exit();
}

// Retrieve user information from session
$userId = $_SESSION['userId'];
$firstName = $_SESSION['firstName'];
$lastName = $_SESSION['lastName'];
$nickname = $_SESSION['nickname'];
$email = $_SESSION['email'];
$userType = $_SESSION['userType'];
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

        <section id="First">
            <div class="box">
                <h2>Profile Information</h2>
                <div class="row">
                    <p><strong>User ID:</strong> <?php echo htmlspecialchars($userId); ?></p>
                    <p><strong>Nickname:</strong> <?php echo htmlspecialchars($nickname); ?></p>
                    <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
                </div>
                <div class="row">
                    <p><strong>First Name:</strong> <?php echo htmlspecialchars($firstName); ?></p>
                    <p><strong>Last Name:</strong> <?php echo htmlspecialchars($lastName); ?></p>
                    <p><strong>Account Type:</strong> <?php echo htmlspecialchars($userType); ?></p>
                </div>
            </div>

            <div class="box-upgrade">
                <h3>Upgrade To Pro</h3>
                <p>Get access to additional<br> features and contact </p>
                <button class="upgrade-button">Upgrade</button> <!-- Upgrade button -->
            </div>
        </section>
        
        <section id="Second">
            <div class="borrow">
                <h2>Created Bills</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Bill Code</th>
                            <th>Bill ID</th>
                            <th>Bill Name</th>
                            <th>Person Involved</th>
                            <th>Bill Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php 
                        if ($resultBorrowed && $resultBorrowed->num_rows > 0) { 
                            while ($row = $resultBorrowed->fetch_assoc()) { 
                                echo "<tr>
                                        <td>{$row['code']}</td> 
                                        <td>{$row['bill_id']}</td> 
                                        <td>{$row['bill_name']}</td>  
                                        <td>{$row['involved']}</td>  
                                        <td>{$row['date']}</td>
                                        <td>
                                            <button class='view-btn'><i class='fas fa-eye'></i> View</button>
                                            <form action='archive.php' method='POST' style='display:inline;'>
                                                <input type='hidden' name='bill_id' value='{$row['bill_id']}'>
                                                <input type='hidden' name='bill_name' value='{$row['bill_name']}'>
                                                <input type='hidden' name='involved' value='{$row['involved']}'>
                                                <input type='hidden' name='date' value='{$row['date']}'>
                                                <input type='hidden' name='code' value='{$row['code']}'>
                                                <button type='submit' class='archive-btn'><i class='fas fa-archive'></i> Archive</button>
                                        </form>
                                        <button class='archive-btn'><i class='fas fa-trash'></i> Delete</button>
                                    </td>
                                  </tr>"; 
                        } 
                    } else { 
                        echo "<tr><td colspan='5'>No bills found.</td></tr>"; 
                    } 
                    ?>
                </tbody>
            </table>
            <a href="createBill.php" class="add-btn"><i class="fas fa-plus-circle"></i> Add</a>
            <a href="registerAssets.php" class="edit-btn"><i class="fas fa-edit"></i> Edit</a>
            </div>
        </section>
      


 </div>
</body>
</html>