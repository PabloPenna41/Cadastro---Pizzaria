<?php

include_once './pdo.php';

$pdo->query('DELETE FROM funcionario WHERE cod_funcionario = '. $_GET['id']);
header('location: index.php');