function ListaComprasController($scope) {
    $scope.itens = [
	{id:1, descricao: 'Fiscal', selecionado: false},
        {id:2, descricao: 'Compras', selecionado: false},
        {id:3, descricao: 'Recursos Humanos', selecionado: false}
    ];

    $scope.adicionarItem = function () {
        $scope.itens.push({id: $scope.item.id,
			   descricao: $scope.item.descricao,                           
                           selecionado: false});

        $scope.item.id = $scope.item.descricao = '';
    };

    $scope.excluirItem = function (index) {
	$scope.itens.splice( index,1);
    };
}
