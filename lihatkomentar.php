<?php
  session_start();
    if (!isset($_SESSION['userid'])) {
        header("location: login.php");
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Komentar</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #333;
 }

 h1 {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    color: white;
    background-color: green;
 }
 p {
    list-style-type: none;
    margin: 0;
    overflow: hidden;
    color: white;
    background-color: green;
 }

 ul {
    list-style-type: none;
    padding: 0;
    margin: 20px 0;
    background-color: green;
    overflow: hidden;
 }

 li {
    float: left;
 }

 li a { 
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
 }
 li a:hover {
    background-color: #555
 }

 form {
    margin: 20px;
 }

 table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
 }
th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solip #ddd;
}

th {
    background-color: green;
    color: white;
}

tr:hover {
    background-color: #f5f5f5;
}
input[type="text"], input[type="summit"] {
    padding: 8px;
    margin-bottom: 10px;
}

input[type="submit"] {
    background-color: green;
    color: white;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #555;
}
img {
    max-width: 100%;
    height: auto;
}

    </style>
</head>

<body>
    <h1>Selamat datang <b><?=$_SESSION['namalengkap']?></b></h1>

    <ul>
        <li><a href="index.php">Home</a></li>
        <li><a href="album.php">Album</a></li>
        <li><a href="foto.php">Foto</a></li>
        <li><a href="logout.php">Logout</a></li>
    </ul>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama</th>
                <th>Komentar</th>
                <th>Tanggal</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include "koneksi.php";
            $userid = $_SESSION['userid'];
            $sql = mysqli_query($conn, "SELECT * FROM komentarfoto INNER JOIN user ON komentarfoto.userid = user.userid");
            while ($data = mysqli_fetch_array($sql)) {
                ?>
                <tr>
                    <td><?= $data['komentarid'] ?></td>
                    <td><?= $data['namalengkap'] ?></td>
                    <td><?= $data['isikomentar'] ?></td>
                    <td><?= $data['tanggalkomentar'] ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
</body>

</html>

