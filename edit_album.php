<?php
session_start();
if (!isset($_SESSION['userid'])) {
    header("location:login.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Edit Album</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            color: white;
            background-color: #45a049
        }

        p {
            color: #555;
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
            background-color: #111;
        }

        form {
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <h1>Halaman Edit Album</h1>

    <ul>
        <li><a href="index.php">Home</a></li>
        <li><a href="album.php">Album</a></li>
        <li><a href="foto.php">Foto</a></li>
        <li>Selamat datang <b><?php echo $_SESSION['namalengkap']; ?></b></li>
        <li><a href="logout.php">Logout</a></li>
    </ul>

    <form action="update_album.php" method="post">
        <?php
        include "koneksi.php";
        $albumid = $_GET['albumid'];
        $sql = mysqli_query($conn, "select * from album where albumid='$albumid'");
        while ($data = mysqli_fetch_array($sql)) {
        ?>
            <input type="text" name="albumid" value="<?php echo $data['albumid']; ?>" hidden>
            <table>
                <tr>
                    <td>Nama Album</td>
                    <td><input type="text" name="namaalbum" value="<?php echo $data['namaalbum']; ?>"></td>
                </tr>
                <tr>
                    <td>Deskripsi</td>
                    <td><input type="text" name="deskripsi" value="<?php echo $data['deskripsi']; ?>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Ubah"></td>
                </tr>
            </table>
            <script>
                document.addEventListener('DOMContentLoaded', () => {
                    const form = document.querySelector('form');
                    form.addEventListener('submit', (e) => {
                        if (!confirm('Apakah Anda Ingin Mengubah Data?')) {
                            e.preventDefault();
                        }
                    });
                });
            </script>
        <?php
        }
        ?>
    </form>
</body>

</html>

