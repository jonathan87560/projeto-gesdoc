package br.gesdoc.banco;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactoryOracle {
	
	private Connection vConexao   = null;
	private String     vServidor  = null;
	private String     vUsername  = null;
	private String     vPassword  = null;
	private String     vPorta     = null;
	private String     vSid       = null;
	
	private void gravaArquivoIni(String pServidor,String pPorta, String pSid, 
			                     String pUser, String pPass, String pEmpresa){
		
		Properties prop = new Properties();  
		  
		try {  
			
			//definir as propriedades e valores  
			prop.setProperty("server"    ,pServidor);  
		    prop.setProperty("porta"     ,pPorta);
		    prop.setProperty("sid"       ,pSid);
		    prop.setProperty("dbuser"    ,pUser);  
		    prop.setProperty("dbpassword",pPass);  
		    
		    //salvar o arquivo  
		    prop.store(new FileOutputStream(pEmpresa+".properties"), null);  
		  
		} catch (IOException ex) {  
		    ex.printStackTrace();  
		}
	}

	
	private void lerArquivoIni(String pArquivoIni){
		
		Properties prop = new Properties();  
		
		try {  
		    
		    //carrega properties  
		    prop.load(new FileInputStream(pArquivoIni+".properties"));  
		  
		    //recupera valores  
		    this.vServidor = prop.getProperty("server");  
		    this.vPorta    = prop.getProperty("porta");
		    this.vSid      = prop.getProperty("sid");
		    this.vUsername = prop.getProperty("dbuser");  
		    this.vPassword = prop.getProperty("dbpassword");  
		    
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		}  	
	
	
	private boolean conectar(String pEmpresa){
		
		boolean vSituacao = false;
		  
		lerArquivoIni(pEmpresa);
	    try {
	        // Load the JDBC driver   
	        String driverName = "oracle.jdbc.driver.OracleDriver";
	        Class.forName(driverName);   
	        
	        String url = "jdbc:oracle:thin:@"+this.vServidor+":"+this.vPorta+":"+this.vSid;   
	        
	        vConexao = DriverManager.getConnection(url, this.vUsername, this.vPassword);   
	        vSituacao = true;
	    
	    } catch (ClassNotFoundException e) {       
	        System.out.println(e);       
	    } catch (SQLException e) {       
	        System.out.println(e);       
	    }  

        return vSituacao;
	}
	
	public String Database(boolean pSituacao,String pEmpresa){
    	
    	boolean vSituacao = false;
    	String	vRetorno  = "";
    	
    	if (pSituacao == true){
    		vSituacao = conectar(pEmpresa);
    		
    		if (vSituacao == true){
    			vRetorno = "OK";
    		}else{
    			vRetorno = "FAIL";
    		}
    	}
    	
    	if (pSituacao == false){
    		vSituacao = desconecta();
    		if (vSituacao == true){
    			vRetorno = "OK";
    		}else{
    			vRetorno = "FAIL";
    		}
    	}       	
    	return vRetorno;
    }
	
	private boolean desconecta() {  

    	boolean vSituacao = false;	
        try {   
            vConexao.close();
            vSituacao = true;
            
        }catch (NullPointerException e){
        	e.printStackTrace();
        } catch (SQLException e) {
        	e.printStackTrace();
        }   
        
        return vSituacao;
    } 	
	
	public Connection getConnection(){
	 	return vConexao;
	}
	
	

}
