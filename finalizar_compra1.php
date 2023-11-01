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
	$nome = $_SESSION["NomeUsuario"];	
	$data = date("d/m/Y");
	$total = number_format($_SESSION["Total"],2,",",".");
	
	$sql1 = "select * from formasdepagamentos";
	$result1 = mysql_query($sql1, $conexao) or die(mysql_error());
	
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Finalização da Compra</title>
<link href="css/links.css" rel="stylesheet" type="text/css" />
</head>

<body>
<h1>Finalização da Compra</h1>
<form id="form1" name="form1" method="post" action="finalizar_compra2.php">
  <table border="1" cellpadding="5" cellspacing="0">
    <tr>
      <td>Nome do Cliente:</td>
      <td class="detaque_em_azul_Bload"><?php echo $nome ?></td>
    </tr>
    <tr>
      <td>Data da Venda</td>
      <td class="detaque_em_vermelho_Bload"><?php echo $data ?></td>
    </tr>
    <tr>
      <td>Valor da Compra</td>
      <td class="detaque_em_vermelho_Bload">R$ <?php echo $total ?> </td>
    </tr>
    <tr>
      <td>Escolha a Forma de Pagamento</td>
      <td>
      <?php while ($linha1 = mysql_fetch_array($result1) ) {?>
      <input type="radio" name="formaPagamento" value="<?php echo $linha1["CodFormadePagamento"] ?>" /><?php echo $linha1["Descricao"] ?><br>
      <?php } ?>
      </td>
    </tr>
  </table>
  <p>
    <input type="submit" name="button" id="button" value="Clique para Finalizar a Compra" />
  </p>
</form>
<p>&nbsp;</p>
</body>
</html>