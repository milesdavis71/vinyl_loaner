<?php

//$con = new mysqli('localhost','root','','zene_uj','3306');
//$con = new mysqli('db4free.net','milesdavis','ottosmops','vinylcenter','3306');
$con = new mysqli('mysql.nethely.hu','milesdavis71','OttosMops71','milesdavis71','3306');



if ($con -> errno){
    die('Nem sikerült csatlakozi az adatbázishoz!');
}
if (!$con ->set_charset('utf8')){
    echo 'A karakterkódolás beállítása sikertelen!';
}
