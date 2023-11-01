<?php
	include("conexao.php");
		
	if (isset($_GET["CodCategoria"]))
	{
		$codigo = $_GET["CodCategoria"];
		$sql="select * from produtos where CodCategoria = $codigo";
	}
	else
	{
		$sql="select * from produtos";
	}

	$result= mysql_query($sql, $conexao) or die (mysql_error());
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Listagem de Produtos</title>
<link href="css/links.css" rel="stylesheet" type="text/css" />
</head>

<body>
<?php 
while( $linha = mysql_fetch_array($result))
{
?>
<table width="200" border="0" >
  <tr>
    <td height="200" align="center"> <img src="..<?php echo $linha["Foto"] ?>" alt="Sem imagem" /></td>
  </tr>
  
  <tr>
    <td align="center"><?php echo ($linha["Nome"]) ?></td>
  </tr>
  
  <tr>
    <td align="center"><?php echo $linha["PrecoVenda"] ?></td>
  </tr>
  
  <tr>
  <td align="center"><a href="carrinho.php?id=<?php echo $linha["CodProduto"] ?>">Clique p/Comprar</a></td>
  </tr>
</table>
<?php 
}
?>

</body>
</html>