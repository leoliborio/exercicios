class Restaurante < Arquivo
  def initialize(nome, nota)
	super()
	@nome = nome
	@nota = nota
  end
 
  def descricao
    "#{@nome};#{@nota}"
  end

end