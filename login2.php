<?php
	include ("conexao.php");
	
	$login = $_POST["login"];
	$senha = md5($_POST["senha"]);
	
	$sql = "select * from clientes where Login = '$login' and Senha = '$senha'";
	$result = mysql_query($sql, $conexao) or die(mysql_error());	
	
	if (mysql_num_rows($result) == 1)
	{
		$linha = mysql_fetch_array($result);
		$codcliente = $linha["CodCliente"];
		$nome = $linha["Nome"];	
		
		$msg = "Ola $nome, seu cadastro foi efetuado com sucesso !";
		session_start();
		$_SESSION = array();
		session_regenerate_id(true); 
		
		$_SESSION["CodUsuario"] = "$codcliente";
		$_SESSION["NomeUsuario"] = "$nome";		
		
		$msg = "Ola <b>$nome</b>, seja bem vindo ao nosso site";
		
	}
	else
	{
		$msg = "Este usuario/senha NÃO estão correto!";
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
<h1>Login Efetuado com Sucesso !
</h1>
<p><?php echo $msg ?></p>
<p><a href="index.php" target="_parent">Clique para recarregar a pagina com o seu login</a></p>
</body>
</html>