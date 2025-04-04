<?php

session_start(); // Start session for login management
include 'db.php';

// Initialize variables as empty
$billname = $with = "";
$date = $code = ""; 

$billnameErr = "";
$hasError = false;
$successMessage = "";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $billname = trim($_POST['bill_name']);
    $with = trim($_POST['with']);
    $date = trim($_POST['date_created']);
    $code = trim($_POST['code']);

    // Validate account name
    if (!preg_match("/^[a-zA-Z\s-]+$/", $billname)) {
        $billnameErr = "Bill Name should not contain numbers.";
        $hasError = true;
    }

    // Insert into database if no errors
    if (!$hasError) {
        $sql = "INSERT INTO bills (bill_name, involved, date, code)
                VALUES (?, ?, ?, ?)";

        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            die("Prepare failed: " . $conn->error);
        }

        // Bind parameters correctly
        $stmt->bind_param("ssss", $billname, $with, $date, $code);

        if ($stmt->execute()) {
            // Show alert and then redirect using JavaScript
            echo "<script type='text/javascript'>
                    alert('Bill has been Added successfully.');
                    window.location.href = 'dashboard.php'; // Redirect to dashboard.php
                  </script>";
        } else {
            die("Execution failed: " . $stmt->error);
        }
        
        $stmt->close();
    }

}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Bill</title>
    <link rel="stylesheet" href="createBill.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="generateCode.js" defer></script>
</head>
<body>
     <div class="wrapper">

       <div class="container">

        <h1>Bill Details</h1>

        <form method="POST" action="" class="form">

            <div class="form-row">
                <label for="code">Code:</label>
                <div class="input-wrapper">
                    <input type="text" id="code" name="code" placeholder="Generated Code" readonly>
                    <button type="button" id="generate-code" onclick="generateCode()">Generate Code</button>
                </div>
            </div>

            <div class="form-row">
                <label for="event_name">Bill Name:</label>
                <input type="text" id="bill_name" name="bill_name" placeholder="Bill Name" required>
            </div>

            <div class="form-row">
                <label for="with">Person Involved:</label>
                <textarea id="with" name="with" placeholder="Involved Persons" required></textarea>
            </div>

            <div class="form-row">
                <label for="date_created">Date Created:</label>
                <input type="date" id="date_created" name="date_created" placeholder="Date" required>
            </div>

            <button type="submit">Add</button>
        </form>
     </div>
</body>
</html>