require 'sinatra'
require './arquivo.rb'
require './pessoa.rb'

get '/' do
	erb :index
end

post '/result' do
	nome = params["nome"]
	email = params["email"]
	sexo = params["sexo"]
	telefone = params["telefone"]

	pessoa = Pessoa.new(nome, email, sexo, telefone)

	pessoa.salvar

	base = pessoa.imprimir

	erb :result, locals: { nome: nome, email: email, sexo: sexo, telefone: telefone, base: base }
end

get '/lista' do
	
 	arquivo = File.open("cadastro.csv", "r")

 	erb :lista, locals: { arquivo: arquivo }

end

