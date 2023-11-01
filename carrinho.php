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
	
	//se é é enviado um ID pela URL, o produto deverá ser incluido no carrinho
	if (isset($_GET["id"]))
	{	
		$CodProduto = $_GET["id"];
		
		$sql = "select * from Produtos where CodProduto = $CodProduto";
		$result = mysql_query($sql, $conexao) or die(mysql_error());;
		
		if ( $linha = mysql_fetch_array($result) )
		{
			$Descricao = $linha["Nome"];
			$Preco = $linha["PrecoVenda"];
			
			$Qtde = 1;
			$Total = $Qtde * $Preco;
			
			$sql = "insert into Carrinho
				    values(null, '$sessao', $CodProduto, '$Descricao', $Qtde, $Preco, $Total)";
			$result = mysql_query($sql, $conexao) or die(mysql_error());
		}
	}
	
	if (isset($_POST["atualizar"]))	
	{
		$quantidades = $_POST['qtde'];
		// Se for diferente de vazio verificamos se é numérico
		if (is_array($quantidades))
		{
			// Aqui percorremos o nosso array
			foreach($quantidades as $CodCarrinho => $qtdeDigitada)
			{
				// Verificamos se os valores são do tipo numeric
				if(is_numeric($CodCarrinho) && is_numeric($qtdeDigitada))
				{
					$sql = "update Carrinho 
							set Quantidade = $qtdeDigitada, Total = $qtdeDigitada * Preco
							where CodCarrinho = $CodCarrinho";
					$result = mysql_query($sql, $conexao) or die(mysql_error());
				}
			}
		}
	}

	if (isset($_GET["excluir"]))	
	{
		$excluir = $_GET['excluir'];

		$sql = "delete from Carrinho 
				where CodCarrinho = $excluir";
		$result = mysql_query($sql, $conexao) or die(mysql_error());
	}

	
	$sql1    = "select * from carrinho where codsessao = '$sessao'";
	$result1 = mysql_query($sql1, $conexao) or die(mysql_error());
	
	$sql2    = "select sum(Total) as Total from carrinho where codsessao = '$sessao'";
	$result2 = mysql_query($sql2, $conexao) or die(mysql_error());	
	$linha2  = mysql_fetch_array($result2);
	$total   = number_format($linha2["Total"],2,",",".");
	$_SESSION["Total"] = $linha2["Total"];
	
	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css/links.css" rel="stylesheet" type="text/css" />
</head>

<body>

<h1>Carrinho de Compras</h1>
<form id="form1" name="form1" method="post" action="carrinho.php">
  <table border="1" cellspacing="0" cellpadding="5">
    <tr>
      <th scope="col">Produto</th>
      <th scope="col">Quantidade</th>
      <th align="right" scope="col">Preço</th>
      <th align="right" scope="col">Total</th>
    </tr>
    <?php while ($linha = mysql_fetch_array($result1)) {?>
    <tr>
      <td><?php echo $linha["Descricao"] ?> (<a href="carrinho.php?excluir=<?php echo $linha["CodCarrinho"] ?>">excluir</a>)</td>
      <td align="center"><input id="qtde" type="text" name="qtde[<?php echo $linha["CodCarrinho"] ?>]" value="<?php echo $linha["Quantidade"] ?>" size="10" /></td>
      <td align="right"><?php echo number_format($linha["Preco"],2,",",".") ?></td>
      <td align="right"><?php echo number_format($linha["Total"],2,",",".") ?></td>
    </tr>
    <?php } ?>
    <tr>
      <td colspan="4" align="right" class="detaque_em_vermelho">Valor Total: R$ <?php echo $total ?></td>
    </tr>
    
  </table>
  <p>
    <input type="submit" name="atualizar" id="atualizar" value="Atualizar Valores" />
  <a href="finalizar_compra1.php">Finalizar a Compra</a></p>
</form>
<?php 
if ($linha2["Total"] == 0)
	{
		echo"<script language=javascript>
				alert('O carrinho de compras está vazio, estamos redirecionando voce para escolher um produto !');
				location.href = 'produtos_em_tabela.php';				
				//history.go(-1);
			</script>";
	}
?>
</body>
</html>
