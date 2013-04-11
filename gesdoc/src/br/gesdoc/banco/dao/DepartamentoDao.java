package br.gesdoc.banco.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.gesdoc.banco.ConnectionFactoryPostgreSQL;
import br.gesdoc.banco.modelo.Departamento;

public class DepartamentoDao {
	
	private Connection conexao;
	
	public DepartamentoDao(){
		this.conexao = new ConnectionFactoryPostgreSQL().ObterConexao();
	}
	
	public void inserirDepartamento(Departamento departamento){
		String sql = "INSERT INTO \"GST0001\".\"DEPARTAMENTO\" VALUES (?,?)";
		
		try {
			PreparedStatement stm = this.conexao.prepareStatement(sql);
			
			stm.setInt(1, departamento.getCodigo());
			stm.setString(2, departamento.getDescricao());
			
			stm.execute();

			stm.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}	
	}
}
