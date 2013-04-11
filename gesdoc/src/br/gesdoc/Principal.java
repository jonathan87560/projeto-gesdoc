package br.gesdoc;

import br.gesdoc.banco.dao.DepartamentoDao;
import br.gesdoc.banco.modelo.Departamento;

public class Principal {

	public static void main(String[] args) {

		Departamento departamento = new Departamento(1, "Fiscal");
		
		DepartamentoDao dao = new DepartamentoDao();
		dao.inserirDepartamento(departamento);
	}
}
