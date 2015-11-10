class Pessoa < Arquivo

	attr_accessor :nome, :email, :sexo, :telefone

	def initialize(nome, email, sexo, telefone)
		super()
		@nome = nome
		@email = email
		@sexo = sexo
		@telefone = telefone
	end

	def descricao

		"#{@nome};#{@email};#{@sexo};#{@telefone}"

	end

	def self.find(nome)
		db = SQLite3::Database.new('banco.db')
		db.results_as_hash = true

		query = db.execute(" SELECT * FROM cadastro WHERE nome = '#{nome}' ").first

		usuario = false
		if query
			usuario = new(query["nome"], query["email"], query["sexo"], query["telefone"])
		end

		usuario
	end

end