package br.gesdoc.banco.modelo;

public class Departamento {

	private int id; 
	private int codigo;
	private String descricao;
	
	public Departamento(int id, int codigo, String descricao)
	{
		super();
		this.id = id;
		this.codigo = codigo;
		this.descricao = descricao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
