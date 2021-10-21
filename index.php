<?
require_once 'config.php';// Подключение к БД
require_once  'Classes/PHPExcel.php';
require_once $_SERVER['DOCUMENT_ROOT']."/Classes/PHPExcel/IOFactory.php";// подключаем класс для доступа к файлу
?>
<!--Создаем форму для загрузки файла*/-->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TEST</title>
</head>
<body>
<table>
    <form  method="post" enctype="multipart/form-data">
        <input type="file" name="filename"><br>
        <input type="submit" value="Выгрузить в БД">
    </form>
</table>
</body>
</html>
<!--================================================================================-->


<?php

move_uploaded_file($_FILES['filename']["tmp_name"], 'upload/'.$_FILES['filename']['name']);//Обработка формы отправки загружаемого файла в папку uploads
$objPHPExcel = PHPExcel_IOFactory::load($_SERVER['DOCUMENT_ROOT']."/upload/".$_FILES['filename']['name']);//Загружаем файл


    foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) // Просматриваем все страницы
{
    $highestRow = $worksheet->getHighestRow(); // получаем количество строк
    $highestColumn = $worksheet->getHighestColumn(); // получаем колличество колонок

    for ($row = 4; $row <= $highestRow; $row++)//Перебираем все строки
    {

        $cell1 = $worksheet->getCellByColumnAndRow(1, $row);//Адрес производства
        $cell2 = $worksheet->getCellByColumnAndRow(2, $row);//Вид работ
        $cell3 = $worksheet->getCellByColumnAndRow(3, $row);//Начало производства работ
        $cell4 = $worksheet->getCellByColumnAndRow(4, $row);//Окончание производства работ
        $cell5 = $worksheet->getCellByColumnAndRow(5, $row);//Альтернатиивное водоснабжение



        $Adresses = "INSERT INTO `addresses`(`ADDRESS_WORKS`) VALUES ($cell1)";// Запрос заполняет таблицу addresses
        echo "$Adresses";
        $IDAddr = "SELECT `ID` FROM `addresses`";// Сохраняем в переменную ID адреса
        $sql = "INSERT INTO `works`(`ADR_ID`, `DATE_START`, `DATE_END`, `TYPE_WORKS`, `ALTER_WATER`) VALUES ($IDAddr, $cell3, $cell4, $cell2, $cell5)";//Заполняем таблицу полученными данными
        $query = mysqli_query($connection, $sql) or die(mysqli_error($connection));// Выполняем запрос или выдаем ошибку
        if ($query)// Проверка на выполнение запроса
        {

            $sqlHtml = mysqli_query($connection, "SELECT * FROM `works` INNER JOIN `addresses` ON `works.ADR_ID` = `addresses.ID`");// Запрос на получение всех значений из таблицы works, совмещенной по адресам из таблицы addresses
            echo //Вывод таблицы на страницу HTML
            "
            <table align='center'>
            <thead>
                <tr><th>№ п/п</th><th>Адрес производства работ</th><th>Вид работ</th><th colspan='2'> Период производства работ</th><th></th></tr>
                <tr><th></th><th></th><th></th><th>Начало производства работ</th><th>Окончание производства работ</th><th>Альтернативное водоснабжение</th></tr>
            </thead>
            <tbody>";
            if ($sqlHtml){
                while ($str = mysqli_fetch_assoc($sqlHtml)){
                    echo "<tr><td class='table'>" . $str["ID"] .
                        "</td><td class='table'>" . $str["ADDRESS_WORKS"] .
                        "</td><td class='table'>" . $str["DATE_START"] .
                        "</td><td class='table'>" . $str["DATE_END"] .
                        "</td><td class='table'>" . $str["TYPE_WORKS"] .
                        "</td><td class='table'>" . $str["ALTER_WATER"] .
                        "</td></tr>";
                }
            } else{
                echo "Записи не найдены!";
            }

        }
    }


}























