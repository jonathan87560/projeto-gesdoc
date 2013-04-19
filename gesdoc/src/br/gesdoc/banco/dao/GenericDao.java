package br.gesdoc.banco.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import br.gesdoc.banco.ConnectionFactoryOracle;

public class GenericDao {
	
	ConnectionFactoryOracle vAcessDB;
	String					vTabela;
	
	private boolean insertMulti(String pTabela,String pCampos,
	        String pValores,String pEmpresa){

		vAcessDB = new ConnectionFactoryOracle();

		if (vAcessDB.Database(true,pEmpresa) == "OK"){

			Connection conn = vAcessDB.getConnection();

			String vSql =  "insert into "+pTabela; 
			vSql += "("+pCampos+")";
			vSql += " values ";
			vSql += "("+pValores+")";
			
			try{  
				PreparedStatement pst = conn.prepareStatement(vSql);
				pst.execute(vSql);
				conn.close();
				return true; 
			} catch (Exception e) {
				System.out.println(vSql);
				e.printStackTrace();
				return false;
			}    
		}
		return false;
	}

	private boolean insert(String pTabela,String pCampos,
			String pValores,String pEmpresa){

		vAcessDB = new ConnectionFactoryOracle();

		if (vAcessDB.Database(true,pEmpresa) == "OK"){

			Connection conn = vAcessDB.getConnection();
			String vSql =  "insert into "+pTabela; 
			vSql += "("+pCampos+")";
			vSql += " values ";
			vSql += "("+pValores+")";
			
			try{  
				PreparedStatement pst = conn.prepareStatement(vSql);
				pst.execute(vSql);
				return true; 
			} catch (Exception e) {
				System.out.println(vSql);
				e.printStackTrace();
				return false;
			}    
		}
		return false;
	}	
	
	private boolean insert(String pTabela,List<String> pCampos,
			   List<String> pValores,String pEmpresa){

		String vCampos = null;
		String vValores = null;
		vAcessDB = new ConnectionFactoryOracle();

		for (int i = 0; i <= pCampos.size()-1; i++){

			if (vCampos == null){
				vCampos = pCampos.get(i).toString();
			}else{
				vCampos += ","+pCampos.get(i).toString();
			}

		}

		for (int i = 0; i <= pValores.size()-1; i++){

			if (vValores == null){
				vValores = "'"+pValores.get(i).toString()+"'";
			}else{
				vValores += ",'"+pValores.get(i).toString()+"'";
			}		

		}
	
		if (vAcessDB.Database(true,pEmpresa) == "OK"){

			Connection conn = vAcessDB.getConnection();
			String vSql =  "insert into "+pTabela; 
			vSql += "("+vCampos+")";
			vSql += " values ";
			vSql += "("+vValores+")";
			
			try{  
				PreparedStatement pst = conn.prepareStatement(vSql);
				pst.execute(vSql);
				return true; 
			} catch (Exception e) {
				System.out.println(vSql);
				e.printStackTrace();
				return false;
			}    
		}
		return false;
	}	

	private boolean update(String pTabela,List<String> pCampos,
			   			   List<String> pValores,String pCondicao,
			               String pEmpresa){

		String vAlteracao = null;
		vAcessDB = new ConnectionFactoryOracle();

		for (int i = 0; i <= pCampos.size()-1; i++){
			try{
			
				if (vAlteracao== null){
					String vValor = null;
					if (pValores.get(i).toString() == null){
						vValor = null;
					}else{
						vValor = pValores.get(i).toString();
					} 
		
					vAlteracao  = pCampos.get(i).toString()+" = ";
					vAlteracao += "'"+vValor+"'";
	
				}else{
					vAlteracao += ","+pCampos.get(i).toString()+" = ";
					vAlteracao += "'"+pValores.get(i).toString()+"'";
				}
			
			} catch (Exception e) {
				System.out.println(vAlteracao);
				e.printStackTrace();
			}	
		}  

		if (vAcessDB.Database(true,pEmpresa) == "OK"){
			
			Connection conn = vAcessDB.getConnection();
			String vSql  = "UPDATE "+pTabela+" SET ";
			vSql += vAlteracao;	  

			if (pCondicao != null){
				vSql += " "+pCondicao;
			} 	  	   

			try {   
				conn.createStatement().execute(vSql);
				return true;
			} catch (SQLException e) {
				System.out.println(vSql);
				e.printStackTrace();
			} 
		}
		return false;
	}

	private boolean update(String pTabela,String pClausula,
			   String pCondicao,
			   String pEmpresa){

		String vAlteracao = null;
		vAcessDB = new ConnectionFactoryOracle();
		vAlteracao = pClausula;

		if (vAcessDB.Database(true,pEmpresa) == "OK"){
			
			Connection conn = vAcessDB.getConnection();
			String vSql  = "UPDATE "+pTabela+" SET ";
			vSql += vAlteracao;	  

			if (pCondicao != null){
				vSql += " "+pCondicao;
			} 	  	   

			try {   
				conn.createStatement().execute(vSql);
				return true;
			} catch (SQLException e) {
				System.out.println(vSql);
				e.printStackTrace();
			} 
		}
		return false;
	}
	
    private boolean delete(String pTabela,String pCondicao,String pEmpresa){
		  
    	  vAcessDB = new ConnectionFactoryOracle();	    	  
    	  String     vSql;

		  vSql  = "DELETE FROM "+pTabela;
		  if (pCondicao != null){
			  vSql += " where "+pCondicao;
		  }		  
		  
		  if (vAcessDB.Database(true,pEmpresa) == "OK"){
			  try {   
				  Connection conn = vAcessDB.getConnection();
				  conn.createStatement().execute(vSql);
				  return true;
			  } catch (SQLException e) {
				  System.out.println(vSql);
				  e.printStackTrace();
			  } 
			  return false;
		  }
		  return false;
    }
	
    private boolean procedure(String pProcedure, List<String> pValores,String pEmpresa){
		  
	  	  vAcessDB = new ConnectionFactoryOracle();	    	  
		  String vSql = null;
	  	  String vParametros = null;
		  int    vConta = 0;
	  	  
		  vSql  = "execute procedure "+pProcedure;
		  
		  for(int i = 0; i <= pValores.size()-1; i++){
			  
			  if (vParametros != null){
				  vParametros += ",'"+pValores.get(i)+"'";
			  }else{
				  vParametros = "'"+pValores.get(i)+"'";
			  }
			  
			  vConta++;
		  }
		  
		  if (vConta > 0){
			  vSql += "("+vParametros+")";
		  }
		  
		  	  
		  if (vAcessDB.Database(true,pEmpresa) == "OK"){
			  try {   
				  Connection conn = vAcessDB.getConnection();
				  conn.createStatement().execute(vSql);
				  return true;
			  } catch (SQLException e) {
				  System.out.println(vSql);
				  e.printStackTrace();
			  } 
			  return false;
		  }
		  return false;
    }        
    
    private ResultSet select(String pTabela, List<String> pCampos, 
		     String pCondicao, String pEmpresa,String pOrderBy){

    	ResultSet  vRs 	     = null;
    	String     vSql      = null;
    	String 	   vCampos   = null;
    	String 	   vCondicao = null;

    	vAcessDB = new ConnectionFactoryOracle();
    	
    	for (int i = 0; i <= pCampos.size()-1; i++){

    		if (vCampos == null){
    			vCampos = pCampos.get(i).toString().trim();
    		}else{
    			vCampos += ","+pCampos.get(i).toString().trim();
    		}
    	}


    	vSql = "SELECT "+vCampos+" FROM "+pTabela;

    	if(pCondicao != null){
    		vCondicao =  pCondicao.toUpperCase();
    		vSql += " WHERE "+vCondicao;
    	}

    	if (pOrderBy != null){
    		vSql += " ORDER BY "+pOrderBy+" ASC";
    	}


    	try{
    		if(vAcessDB.Database(true,pEmpresa) == "OK"){
    			Connection conn = vAcessDB.getConnection();		
    			vRs = conn.createStatement().executeQuery(vSql);
    			return vRs;    
    		}
    	}catch(SQLException e) {
    		System.out.println(vSql);
    		e.printStackTrace();
    	}
    	return vRs;
    }
    
    private ResultSet select(String pTabela, String pCampos, 
		     String pCondicao, String pEmpresa,String pOrderBy){

    	ResultSet  vRs 	     = null;
    	String     vSql      = null;	
    	String 	   vCampos   = null;
    	String     vCondicao = null;

    	vAcessDB = new ConnectionFactoryOracle();
    	vCampos  = pCampos;

    	vSql = "SELECT "+vCampos+" FROM "+pTabela;

    	if(pCondicao != null){
    		vCondicao = pCondicao.toUpperCase();
    		vSql += " WHERE "+vCondicao;
    	}

    	if (pOrderBy != null){
    		vSql += " ORDER BY "+pOrderBy+" ASC";
    	}
   	
    	try{
    		if(vAcessDB.Database(true,pEmpresa) == "OK"){
    			Connection conn = vAcessDB.getConnection();		
    			vRs = conn.createStatement().executeQuery(vSql);
    			return vRs;    
    		}
    	}catch(SQLException e) {
    		System.out.println(vSql);
    		e.printStackTrace();
    	}
    	return vRs;
    }
    
	public void setTabela(String pTabela){
		this.vTabela = pTabela;
	}    
    
	public boolean realizaOperacao(String pOperacao,List<String> pCampos,
			   					   List<String> pValores,String pCondicao,
			   					   String pEmpresa){

		vAcessDB = new ConnectionFactoryOracle();
		
		if (pOperacao.equals("I")){

			String vSituacao = vAcessDB.Database(true,pEmpresa);

			if (vSituacao.equals("OK")){
				boolean vRealizado = insert(this.vTabela,pCampos,pValores,pEmpresa); 
				vSituacao = vAcessDB.Database(false,pEmpresa);
				if (vSituacao.equals("OK")){
					return vRealizado;
				}else{
					return false;
				}
			}
			
			if (vSituacao.equals("FAIL")){
				return false;
			}
		}

		if (pOperacao.equals("A")){
			String vSituacao = vAcessDB.Database(true,pEmpresa);

			if (vSituacao.equals("OK")){
				boolean vRealizado = update(this.vTabela,pCampos,pValores,pCondicao,pEmpresa); 
				vSituacao = vAcessDB.Database(false,pEmpresa);
				if (vSituacao.equals("OK")){
					return vRealizado;
				}else{
					return false;
				}
			}
			
			if (vSituacao.equals("FAIL")){
				return false;
			}
		}	

		if (pOperacao.equals("D")){
			String vSituacao = vAcessDB.Database(true,pEmpresa);

			if (vSituacao.equals("OK")){
				boolean vRealizado = delete(this.vTabela,pCondicao,pEmpresa); 
				vSituacao = vAcessDB.Database(false,pEmpresa);
				if (vSituacao.equals("OK")){
					return vRealizado;
				}else{
					return false;
				}
			}
			if (vSituacao.equals("FAIL")){
				return false;
			}
		}

		if (pOperacao.equals("P")){
			String vSituacao = vAcessDB.Database(true,pEmpresa);

			if (vSituacao.equals("OK")){
				boolean vRealizado = procedure(vTabela,pValores,pEmpresa); 
				vSituacao = vAcessDB.Database(false,pEmpresa);
				if (vSituacao.equals("OK")){
					return vRealizado;
				}else{
					return false;
				}
			}
			
			if (vSituacao.equals("FAIL")){
				return false;
			}
		}		

		return false;
	}
	
	public boolean realizaOperacaoString(String pOperacao,String pCampos,
				 String pValores,String pCondicao,
				 String pEmprsa){

		vAcessDB = new ConnectionFactoryOracle();
		
		if (pOperacao.equals("I")){

			String vSituacao = vAcessDB.Database(true,pEmprsa);

			if (vSituacao.equals("OK")){
				boolean vRealizado = insert(this.vTabela,pCampos,pValores,pEmprsa); 
				vSituacao = vAcessDB.Database(false,pEmprsa);
				
				if (vSituacao.equals("OK")){
					return vRealizado;
				}else{
					return false;
				}
			}

			if (vSituacao.equals("FAIL")){
				return false;
			}
		}

		if (pOperacao.equals("MI")){

			String vSituacao = vAcessDB.Database(true,pEmprsa);

			if (vSituacao.equals("OK")){
				boolean vRealizado = insertMulti(this.vTabela,pCampos,pValores,pEmprsa); 
				vSituacao = vAcessDB.Database(false,pEmprsa);
				
				if (vSituacao.equals("OK")){
					return vRealizado;
				}else{
					return false;
				}
			}

			if (vSituacao.equals("FAIL")){
				return false;
			}
		}

		if (pOperacao.equals("A")){
			String vSituacao = vAcessDB.Database(true,pEmprsa);

			if (vSituacao.equals("OK")){
				boolean vRealizado = update(this.vTabela,pCampos,pCondicao,pEmprsa); 
				vSituacao = vAcessDB.Database(false,pEmprsa);
				
				if (vSituacao.equals("OK")){
					return vRealizado;
				}else{
					return false;
				}
			}
			if (vSituacao.equals("FAIL")){
				return false;
			}
		}			

		return false;
	}
	
	public ResultSet realizaConsulta(List<String> pCampos,
				 String pCondicao,String pOrderBy,String pEmpresa){

		vAcessDB = new ConnectionFactoryOracle();
		ResultSet vRS = null;
		String vSituacao = vAcessDB.Database(true,pEmpresa);

		if (vSituacao.equals("OK")){
			vRS = select(this.vTabela,pCampos,pCondicao,pEmpresa,pOrderBy); 
			if (vSituacao.equals("OK")){
				return vRS;
			}else{
				return vRS;
			}
		}
		if (vSituacao.equals("FAIL")){
			return vRS;
		}
		return vRS;			
	}
	
	public ResultSet realizaConsulta(String pCampos,
			                         String pCondicao,String pEmpresa,
			                         String pOrderBy){

		vAcessDB = new ConnectionFactoryOracle();
		ResultSet vRS = null;
		String vSituacao = vAcessDB.Database(true,pEmpresa);

		if (vSituacao.equals("OK")){
			vRS = select(this.vTabela,pCampos,pCondicao,pEmpresa,pOrderBy); 
			if (vSituacao.equals("OK")){
				return vRS;
			}else{
				return vRS;
			}
		}
		if (vSituacao.equals("FAIL")){
			return vRS;
		}
		return vRS;				
	}	
}
