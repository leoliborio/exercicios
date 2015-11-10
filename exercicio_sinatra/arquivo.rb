class Arquivo
  def initialize
    @nome_arquivo = "cadastro.csv"
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

  def imprimir
    arquivo = File.open(@nome_arquivo, "r")
     
    linhas = [] 

    arquivo.each do |linha|
      
      linhas << linha.strip

    end

    arquivo.close
    linhas

  end

  
  def deletar
    File.delete(@nome_arquivo)
  end
end



