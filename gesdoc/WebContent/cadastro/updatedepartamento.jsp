<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html ng-app>
	<head>
		<title>Teste com AngularJS</title>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="../angularjs/lib/angular-1.0.6.js"></script>
		<script src="../angularjs/app/departamento.js"></script>
		<link rel="stylesheet" href="../angularjs/css/bootstrap.css">
		<link rel="stylesheet" href="../angularjs/css/departamento.css">
	</head>
	<body>
		<div class="container" ng-controller="DepartamentosController">
			<div class="row">
				<div class="page-header">
					
				</div>
			</div>
			<div class="row">
				<table id="departamentos" class="table table-striped">
				<thead>
				<tr>
					<th>Código</th>
					<th>Descrição</th>
				</tr>
				</thead>
		          	<tbody>
	            		<tr ng-repeat="departamento in departamentos" class="selecionado-{{ item.selecionado }}">              				
              				<td><strong>{{ departamento.id }}</strong></td>
              				<td>{{ departamento.descricao }}</td>
              				<td><button class="btn btn-danger" ng-click="excluirDepartamento($index)">X</button></td>
            			</tr>
          			</tbody>
        			</table>
			</div>
      			<div class="row">
        			<form class="form-inline" name="formItem">
          				<input type="number" ng-model="departamento.id" placeholder="Código"  class="input-small"/>
	          			<input type="text" ng-model="departamento.descricao" placeholder="Descrição"/>
        	  			<button class="btn btn-primary" ng-click="adicionarDepartamento()">Salvar</button>					
        			</form>
	      		</div>
		</div>
	</body>
</html>
