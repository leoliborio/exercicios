require 'sqlite3'

class Arquivo
  def initialize
    @nome_arquivo = "banco.db"
  end

  def salvar
    arquivo = SQLite3::Database.new(@nome_arquivo)
    arquivo.execute("INSERT INTO cadastro(nome, email, sexo, telefone) VALUES ('#{nome}','#{email}','#{sexo}', '#{telefone}')")
  end

end



