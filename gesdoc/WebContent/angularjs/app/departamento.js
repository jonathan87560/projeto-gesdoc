function DepartamentosController($scope) {
    $scope.departamentos = [
        {id:1, descricao: 'Fiscal', selecionado: false},
        {id:2, descricao: 'Compras', selecionado: false},
        {id:3, descricao: 'Recursos Humanos', selecionado: false}
    ];

    $scope.adicionarDepartamento = function () {
        $scope.departamentos.push({id: $scope.departamento.id,
			   					   descricao: $scope.departamento.descricao,                           
                                   selecionado: false});

        $scope.departamento.id = $scope.departamento.descricao = '';
    };

    $scope.excluirDepartamento = function (index) {
	$scope.departamentos.splice( index,1);
    };
}
