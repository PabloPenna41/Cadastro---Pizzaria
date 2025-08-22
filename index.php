<?php

include_once 'pdo.php';

if(!empty($_POST)){
  $nome_funcionario = $_POST['nome_funcionario'];
  $telefone_funcionario = $_POST['telefone_funcionario'];
  $endereco_funcionario = $_POST['endereco_funcionario'];
  $query = "INSERT INTO funcionario (nome_funcionario,telefone_funcionario,endereco_funcionario)
    VALUES ('$nome_funcionario','$telefone_funcionario','$endereco_funcionario')";
  $pdo->query($query);
}
  
  $select = $pdo->query("SELECT * FROM funcionario");
  $result = $select->fetchAll(PDO::FETCH_ASSOC);

?>
  <?php include_once 'header.php'; ?>
  <?php include_once 'form.php'; ?>
  
  <ul class="list-group">
    <li class="list-group-item"><strong>FUNCIONARIO:</strong></li>
    <?php foreach($result as $valor): ?>
      <li id="li" class="list-group-item">
        <div>
          <span><strong>Nome:</strong> <?= $valor['nome_funcionario']?> <br> </span>
          <span><strong>Telefone:</strong> <?= $valor['telefone_funcionario']?> <br> </span>
          <span><strong>Endereço:</strong> <?= $valor['endereco_funcionario']?></span>
        </div>
        <div>
          <a class="btn btn-warning" href="edita.php?id=<?=$valor['cod_funcionario']?>">Editar</a>
          <a class="btn btn-danger" href="apaga.php?id=<?=$valor['cod_funcionario']?>">apagar</a>
        </div>
      </li>
      
    <?php endforeach ?>
  </ul>

  <?php include_once 'footer.php'; ?>
