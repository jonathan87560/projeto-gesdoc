<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html ng-app>
	<head>
		<title>GesDoc - Sistema de Gestão Documental</title>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="javascript/1.0.1/locastyle.css">
        <script type="text/javascript" src="javascript/1.0.1/locastyle.js"></script>	
	</head>
	<body>
	    <div class="marginAuto">
	    	<br>
	    	<br>
			<form class="fCenter">
        	<div class="control-group" align="center">
            	<label><center><h2>Controle de Usuário</h2></center></label>
            	<br>
            	<input type="text" placeholder="Buscar pelo nome">
            	<input type="submit" value="Buscar" class="btn">
        	</div>
        	</form>
        
        	<div class="boxActions">
    	 		<input class="btn btn-primary" name="commit" type="submit" value="Atualizar Conta">
    	 		<a href="#" class="btn" data-dismiss="modal">Cancelar</a>
			</div>
   		</div>
	</body>
</html>
