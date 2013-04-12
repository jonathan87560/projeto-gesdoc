package br.gesdoc.banco.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.gesdoc.banco.ConnectionFactoryPostgreSQL;
import br.gesdoc.banco.modelo.Departamento;

public class DepartamentoDao {
	
	private Connection conexao;
	
	public DepartamentoDao(){
		this.conexao = new ConnectionFactoryPostgreSQL().ObterConexao();
	}
	
	public void inserir(Departamento departamento){
		String sql = "INSERT INTO \"GST0001\".departamento (codigo, descricao) values (?,?)";
		
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
	
	public void alterar(Departamento departamento){
		String sql = "update \"GST0001\".departamento set codigo = ?, descricao = ? where id = ?";
		
		try {
			PreparedStatement stm = this.conexao.prepareStatement(sql);
			
			stm.setInt(1, departamento.getCodigo());
			stm.setString(2, departamento.getDescricao());
			stm.setInt(3, departamento.getId());
			
			stm.execute();

			stm.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}	
	}

	public void excluir(Departamento departamento){
		String sql = "delete from \"GST0001\".departamento where id = ?";
		
		try {
			PreparedStatement stm = this.conexao.prepareStatement(sql);
			
			stm.setInt(1, departamento.getId());
			
			stm.execute();

			stm.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}	
	}
	
	public int obterIdPorCodigoDescricao(Departamento departamento){
		String sql = "select id from \"GST0001\".departamento where codigo = ? and descricao = ?";
		int id = 0;
		
		try {
			PreparedStatement stm = this.conexao.prepareStatement(sql);
			
			stm.setInt(1, departamento.getCodigo());
			stm.setString(2, departamento.getDescricao());
			
			ResultSet rs = stm.executeQuery();

			if (rs.next()){
				id = rs.getInt(1);				
			}
			
			rs.close();
			stm.close();
			
			return id;
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
}
