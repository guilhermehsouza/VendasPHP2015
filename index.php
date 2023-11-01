<?php
	include("conexao.php");
	session_start();
	if (isset($_SESSION["NomeUsuario"]))
	{
		$usuario = $_SESSION["NomeUsuario"];
		$msg = "Olá $usuario, clique  <a href='logout1.php' target='iframe'>aqui</a> para sair do site, ou <a href='carrinho.php' target='iframe'>aqui</a>  para ir até seu carrinho de compras.";
	}
	else
	{
		$msg = "Olá visitante, clique  <a href='login1.php' target='iframe'>aqui</a> para entrar no site ou fazer um novo cadastro";
	}
	
	$sql1="SELECT categorias.CodCategoria, categorias.Descricao, count(produtos.codproduto) as Qtde
           FROM categorias, produtos
           WHERE produtos.CodCategoria = categorias.CodCategoria
           GROUP BY categorias.descricao
           ORDER BY categorias.descricao";
	$result1= mysql_query($sql1, $conexao) or die (mysql_error());
	
	$sql2="SELECT fornecedores.CodFornecedor, fornecedores.Descricao, count(produtos.codproduto) as Qtde
           FROM fornecedores, produtos
           WHERE produtos.codfornecedor = fornecedores.codfornecedor
           GROUP BY fornecedores.descricao
           ORDER BY fornecedores.descricao";		   
	$result2= mysql_query($sql2, $conexao) or die (mysql_error());	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
body {
	background-color: #CCC;
}
#pagina {
	background-color: #FFF;
	width: 1400px;
	margin: auto;
}
#banner {
	font-size: 60px;
	padding-top: 10px;
	padding-bottom: 10px;
	text-align: center;
	background-color: #09C;
	color: #FFF;
	font-weight: bold;
}
#login  {
	background-color: #0CC;
	color: #FFF;
	text-align: center;
	padding-top: 7px;
	padding-bottom: 7px;
}
#menu {
	background-color: #09c;
	height: 770px;
	width: 195px;
	float: left;
	padding-left: 5px;
}
#menu ul{
	margin: 0px;
	list-style-type: none;
	padding: 0px;
}
.cabeca{
	color: #FFF;
	font-weight: bolder;
	font-size: 18px;
}
#menu ul li a, #menu ul li a:visited {
	display: block;
	color: #fff;
	text-decoration: none;
}
#conteudo {
	height: 770px;
	width: 1200px;
	float: right;
}
#rodape {
	background-color: #09C;	
	color: #FFF;	
	font-size: 10px;
	text-align: center;
	clear: both;
}
</style>
</head>

<body>
<div id="pagina">
	<div id="banner">
	    Site de Vendas Online
    </div>
	<div id="login"><?php echo $msg ?></div>
  <div id="menu">
    <ul>
    <li class="cabeca">Categorias</li>
    <?php 
    while ( $linha1 = mysql_fetch_array($result1) )
    {
		$cod =  $linha1["CodCategoria"];
		$nome = $linha1["Descricao"];
		$qtde = $linha1["Qtde"]
    ?>      
    <li><a href="Produtos_em_tabela.php?CodCategoria=<?php echo $cod ?>" target="iframe"><?php echo $nome?> (<?php echo $qtde?>)</a></li>
    <?php 
    }	
    ?>  
    <li>&nbsp;</li>
    </ul>	 
    
    <ul>
    <li class="cabeca">Fornecedores</li>
    <?php 
    while ( $linha2 = mysql_fetch_array($result2) )
    {
		$cod =  $linha2["CodFornecedor"];
		$nome = $linha2["Descricao"];
		$qtde = $linha2["Qtde"]
    ?>      
    <li><a href="Produtos_em_tabela.php?CodFornecedor=<?php echo $cod ?>" target="iframe"><?php echo $nome?> (<?php echo $qtde?>)</a></li>
    <?php 
    }	
    ?>  
    </ul>	    
	</div>    
	<div id="conteudo">
	  <iframe name="iframe" width="100%" height="100%" frameborder="0" src="Produtos_em_tabela.php"></iframe>
	</div>    
	<div id="rodape">
		Desenvolvido por Guilherme como Projeto das Aulas de Programação Web I - PHP
  </div>    
</div>
</body>
</html>