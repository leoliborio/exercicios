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

	def descricao_frase

		"Nome: #{@nome}, Email: #{@email}, Sexo: #{@sexo}, Telefone: #{@telefone}"
	end

end