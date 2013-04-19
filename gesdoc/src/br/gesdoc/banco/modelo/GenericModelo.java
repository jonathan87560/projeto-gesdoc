package br.gesdoc.banco.modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.gesdoc.banco.ConnectionFactoryOracle;

public class GenericModelo {
	
	
	private List<String> buscaCampos(String ptabela,String pEmpresa){
		
		ConnectionFactoryOracle acessoDB = new ConnectionFactoryOracle();

		
		String vSql  = "SELECT * FROM ALL_TAB_COLUMNS ";
			   vSql += " WHERE TABLE_NAME = '"+ptabela;
			   vSql += "' ORDER BY COLUMN_ID ASC";
				   
		List<String> vCampos = new ArrayList<String>();   

		ResultSet vRs 	   = null;
		String vSituacao = acessoDB.Database(true,pEmpresa);
		
		if (vSituacao.equals("OK")){
			
	    	try{
	  	  		Connection conn = acessoDB.getConnection();
	  	  		vRs = conn.createStatement().executeQuery(vSql);
	  	  		
	  	  		while (vRs.next()){
	  	  			vCampos.add(vRs.getString("COLUMN_NAME"));
	  	  		}
	  	  		acessoDB.Database(false,pEmpresa);
	  	  		return vCampos;  
	      		}catch(SQLException e) {
	  				System.out.println(vSql);
	  				e.printStackTrace();
	  			}			
			
			}
		return null;
	}
	
	private List<String> buscaValoresListResultSet(String pTabela,ResultSet pRs){

		List<String> vValores = new ArrayList<String>();
		
		try {	
			for (int i = 0; i <= pRs.getRow()-1; i++){
				try {
					vValores.add(pRs.getString(i).toString());
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vValores;
	}		
	
	public List<String> getCamposList(String pTabela,String pEmpresa){
		return buscaCampos(pTabela,pEmpresa);
	}

	public List<String> getValores(String pTabela,ResultSet pRs){
		return buscaValoresListResultSet(pTabela, pRs);
	}
	
}
