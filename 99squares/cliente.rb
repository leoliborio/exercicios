class Cliente < Arquivo
  def initialize(nome, profissao, sexo)
      super()
      @nome = nome
      @profissao = profissao
      @sexo = sexo
  end

  def descricao
    "#{@nome};#{@profissao};#{@sexo}"
  end
end