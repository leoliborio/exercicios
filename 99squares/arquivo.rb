class Arquivo
  def initialize
    @nome_arquivo = self.class.to_s.downcase + ".csv"
  end

  def salvar
    arquivo = File.open(@nome_arquivo, "a")
    arquivo.puts(descricao)
    arquivo.close
  end

  def procurar(query)
    arquivo = File.open(@nome_arquivo, "r")
    linhas_encontradas = [] 

    arquivo.each do |linha|
	if (linha.downcase.include? query)
          linhas_encontradas << linha
	end
    end

    arquivo.close
    linhas_encontradas
  end


  def deletar
    File.delete(@nome_arquivo)
  end
end



