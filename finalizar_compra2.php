<?php 
	session_start();	
	if (isset($_SESSION["CodUsuario"]))		
	{
		$sessao = session_id();	
	}
	else
	{
		$msg = "Não há usuario logado";
		header("Location:carrinho_problemas.php");
	}
	
	include ("conexao.php");
	$codusuario = $_SESSION["CodUsuario"];
	$codFormaPagamento = $_POST["formaPagamento"];
	$nome = $_SESSION["NomeUsuario"];	
	$data = date("Y-m-d");
	$total = $_SESSION["Total"];
	
	$sql1 = "insert into vendas values(null, $codusuario, $codFormaPagamento , '$data', $total)";
	$result1 = mysql_query($sql1, $conexao) or die(mysql_error());
	$codvenda = mysql_insert_id();
	echo "<br>Cadastrado a venda nº $codvenda";
	
	$sql2 = "select * from carrinho where codsessao = '$sessao'";
	$result2 = mysql_query($sql2, $conexao) or die(mysql_error());
	
	while ($linha2 = mysql_fetch_array($result2) )
	{
		$codvenda   = $codvenda;
		$codproduto = $linha2["CodProduto"];
		$qtde       = $linha2["Quantidade"];
		$preco      = $linha2["Preco"];
		$total      = $linha2["Total"];
		
		$sql3 = "insert into vendasprodutos values (null, $codvenda, $codproduto, $qtde, $preco, $total)";
		$result3 = mysql_query($sql3, $conexao) or die(mysql_error());
		echo "<br>Produto adicionado na venda";
	}
	
	$sql3 = "delete from carrinho where codsessao = '$sessao'";
	$result3 = mysql_query($sql3, $conexao) or die(mysql_error());
	
	
	$msg = "Olá $nome, a venda nº $codvenda foi realizada com sucesso, aguarde o pedido chegar no seu endereço de cadastro !";
		
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Finalização da Compra</title>
</head>

<body>
<h1>Finalização da Compra</h1>
<p><?php echo $msg ?>&nbsp;</p>
</body>
</html>