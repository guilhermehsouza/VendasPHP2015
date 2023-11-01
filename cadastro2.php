<?php 
	include ("conexao.php");
	
	$nome = $_POST["nome"];
	$login = $_POST["login"];
	$senha = md5($_POST["senha"]);
	
	$sql = "insert into clientes(Nome, Login, Senha, CodEstado) values ('$nome', '$login', '$senha', 25)";
	
	$result = mysql_query($sql, $conexao) or die(mysql_error());
	$codcliente = mysql_insert_id();
	
	if ($result)
	{
		$msg = "Ola $nome, seu cadastro foi efetuado com sucesso !";
		session_start();
		$_SESSION = array();
		session_regenerate_id(true); 
		
		$_SESSION["CodUsuario"] = "$codcliente";
		$_SESSION["NomeUsuario"] = "$nome";		

	}
	else
	{
		$msg = "Ocorreu o erro ao cadastrar: $result";
	}
		
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css/links.css" rel="stylesheet" type="text/css" />
</head>

<body>
<h1>Cadastro para um Novo Cliente</h1>
<p class="detaque_em_vermelho"><?php echo $msg ?>&nbsp;</p>
<p><a href="index.php" target="_parent">Clique para recarregar a pagina com o seu login</a></p>
</body>
</html>