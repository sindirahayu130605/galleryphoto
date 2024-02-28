<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Landing</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            color: #333;
        }

        h1 {
            margin: 0;
            padding: 10px;
            background-color: green;
            color: white;
            text-align: center;
        }

        nav {
            overflow: hidden;
            background-color: green;
        }

        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        nav a:hover {
            background-color: white;
            color: green;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: green;
            color: white;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        .action-links a {
            text-decoration: none;
            padding: 5px 10px;
            margin: 2px;
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <?php
        session_start();
        if(!isset($_SESSION['userid'])){
    ?>
            <nav>
                <a href="register.php">Register</a>
                <a href="login.php">Login</a>
            </nav>
    <?php
        }else{
    ?>   
        <h1>Selamat datang sindi rahayu <b><?=$_SESSION['namalengkap']?></b></h1>
        <nav>
            <a class="link" href="index.php">Home</a>
            <a class="link" href="album.php">Album</a>
            <a class="link" href="foto.php">Foto</a>
            <a class="link" href="logout.php">Logout</a>
        </nav>
    <?php
        }
    ?>
    
    <table>
        <tr>
            <th>Judul</th>
            <th>Deskripsi</th>
            <th>Foto</th>
            <th>Uploader</th>
            <th>Jumlah Like</th>
            <th>Lihat Komentar</th>
            <th>Aksi</th>
        </tr>
        <?php
            include "koneksi.php";
            $sql = mysqli_query($conn, "SELECT * FROM foto INNER JOIN user ON foto.userid=user.userid ORDER BY foto.fotoid DESC");
            while($data=mysqli_fetch_array($sql)){
        ?>
            <tr>
                <td><?=$data['judulfoto']?></td>
                <td><?=$data['deskripsifoto']?></td>
                <td>
                    <img src="gambar/<?=$data['lokasifile']?>" width="200px">
                </td>
                <td><?=$data['namalengkap']?></td>
                <td>
                    <?php
                        $fotoid=$data['fotoid'];
                        $sql2=mysqli_query($conn,"SELECT COUNT(*) AS jumlah_like FROM likefoto WHERE fotoid='$fotoid'");
                        $like_data = mysqli_fetch_assoc($sql2);
                        echo $like_data['jumlah_like'];
                    ?>
                </td>
                <td>
                    <a href="lihatkomentar.php?fotoid=<?=$data['fotoid']?>">Lihat Komentar</a>
                </td>
                <td class="action-links">
                    <a href="like.php?fotoid=<?=$data['fotoid']?>">Like</a>
                    <a href="like.php?fotoid=<?=$data['fotoid']?>">Unlike</a>
                    <a href="komentar.php?fotoid=<?=$data['fotoid']?>">Komentar</a>
                </td>
            </tr>
        <?php
            }
        ?>
    </table>
    
</body>
</html>
