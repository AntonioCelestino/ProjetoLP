<!DOCTYPE HTML>
<html>
	<head>
		<title>IF Sudeste MG</title>
		<meta name="author" content="Antonio & Nathan" />
		<meta name="keywords" content="bolsa, IF Sudeste" />
		<meta charset="UTF-8" />
	</head>
	<body>
		<form name="input" action="formulario.asp" method="post">
				<h2>Sistema de Assistência Estudantil</h2>
				<h3>- - - Relatório de Bolsistas - - -</h3>
				<p>
				Modalidade bolsa&nbsp;
				<select name="bolsa">
					<option value="selecionar">--selecionar--</option>
					<option value="Alimentacao">Alimentação</option>
					<option value="Manutencao">Manutenção</option>
					<option value="Moradia">Moradia</option>
					<option value="Transporte">Transporte</option>
				</select>
				</p>
				<p><label><input type="radio" name="vigencia" value="vigente" />Vigentes</label><label><input type="radio" name="vigencia" value="vigente" />Todas</label></p>
				<p>Data início relatório&nbsp;<input name="data" type="text" size="7"></p>
				<p>Data fim relatório&nbsp;<input name="data" type="text" size="7"></p>
				<p><input name="relatorio" type="submit" value="Gerar" /></p>
				<p><input name="voltar" type="submit" value="Voltar"/></p>
		</form>
	</body>
</html>