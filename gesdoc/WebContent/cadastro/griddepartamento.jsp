<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Departamento</h3>
<div id="grid">
	<table border="1">
		<caption>Pesquisa</caption>
		<thead>			
			<tr>
				<td>Código</td>
				<td>Descrição</td>
			</tr>
		</thead>		
		<tbody>
			<tr>
			<td>{codigo}</td>
			<td>{descricao}</td>
			</tr>	
		</tbody>
	</table>
	<p><a href="./updatedepartamento.jsp"> <input type="button" value="Novo" /></a></p>
</div>
</body>
</html>