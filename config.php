<?php
$host = 'localhost';
$database = 'test_bd';
$user = 'root';
$password = '';

$connection = mysqli_connect($host, $user, $password, $database)
or die("Ошибка " . mysqli_error($connection));


mysqli_close($connection);

