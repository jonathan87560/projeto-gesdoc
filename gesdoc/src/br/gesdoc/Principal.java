package br.gesdoc;

import br.gesdoc.banco.dao.DepartamentoDao;
import br.gesdoc.banco.modelo.Departamento;

public class Principal {

	public static void main(String[] args) {

		//inserir
		Departamento departamento = new Departamento(0, 1, "FISCAL");
		
		DepartamentoDao dao = new DepartamentoDao();
		dao.inserir(departamento);
		
		//alterar
		departamento.setId( dao.obterIdPorCodigoDescricao(departamento) );		
		departamento.setCodigo(2);
		departamento.setDescricao("COMPRAS");
		dao.alterar(departamento);
		
		//excluir
		dao.excluir(departamento);		
	}
}
