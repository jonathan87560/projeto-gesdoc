package br.gesdoc.banco;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactory {
	
	public Connection ObterConexao(){
		String url = "jdbc:postgresql://portonb:5432/gesdoc";

		Properties info = new Properties();
		info.setProperty("user", "postgres");
		info.setProperty("password", "");		
		
		try {
			return DriverManager.getConnection(url, info);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}		
		
	}

}
