<?php

include_once './conn.php';

try{
  $pdo = new PDO("mysql:host=localhost;dbname=".DBNAME,DBUSER,DBPASSWORD);
}catch(PDOException $e){
  echo "Deu ruim: ". $e->getMessage();
}
