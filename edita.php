<?php
include_once 'pdo.php';

if(!empty($_POST)){
  $nome_funcionario = $_POST['nome_funcionario'];
  $telefone_funcionario = $_POST['telefone_funcionario'];
  $endereco_funcionario = $_POST['endereco_funcionario'];
  $query = 
    "UPDATE funcionario 
    SET nome_funcionario = '$nome_funcionario', 
    telefone_funcionario = '$telefone_funcionario',
    endereco_funcionario = '$endereco_funcionario'
    WHERE cod_funcionario = " . $_POST['cod_funcionario']
  ;
  $pdo->query($query);
  header('location: index.php');
}

$query = $pdo->query('SELECT * FROM funcionario WHERE cod_funcionario = '. $_GET['id']);
$result = $query->fetch(PDO::FETCH_ASSOC);

?>
<?php include_once 'header.php'; ?>

<form action="" method="POST">
  <input type="hidden" name="cod_funcionario" value="<?=$result['cod_funcionario']?>">
  <label> Nome:
     <input 
      class="form-control" 
      type="text" 
      name="nome_funcionario"
      placeholder="<?= $result['nome_funcionario']?>"
      value="<?= $result['nome_funcionario']?>">
  </label>
    <label> Telefone:
     <input 
      class="form-control" 
      type="text" 
      name="telefone_funcionario"
      placeholder="<?= $result['telefone_funcionario']?>"
      value="<?= $result['telefone_funcionario']?>">
  </label>
    <label> Endereço:
     <input 
      class="form-control" 
      type="text" 
      name="endereco_funcionario"
      placeholder="<?= $result['endereco_funcionario']?>"
      value="<?= $result['endereco_funcionario']?>">
  </label>
  <button type="submit" class="btn btn-primary">Editar</button>
</form>
