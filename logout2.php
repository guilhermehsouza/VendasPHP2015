<?php
session_start();
$_SESSION = array();
session_regenerate_id(true); 
session_destroy();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css/links.css" rel="stylesheet" type="text/css" />
</head>

<body>
<h1>&nbsp;</h1>
<div id="pagina">
  <h1>Obrigado, volte sempre !</h1>
  <p>&nbsp;</p>
  <p><a href="index.php" target="_parent">Clique para voltar a visualização dos produtos</a></p>
</div>
<p>&nbsp;</p>
</body>
</html>