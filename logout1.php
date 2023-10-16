<?php
	session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css/links.css" rel="stylesheet" type="text/css" />
</head>

<body>
<h1>Deseja efetuar o logout do site</h1>
<p>Ola <?= $_SESSION["NomeUsuario"]?>
, clique em <a href="logout2.php" target="_parent">SIM</a> para sair ou em <a href="index.php" target="_parent">NÃO</a> para continuar comprando em nosso site.</p>
</body>
</html>