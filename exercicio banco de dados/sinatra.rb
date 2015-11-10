require 'sinatra'
require 'sqlite3'
require './arquivo.rb'
require './pessoa.rb'


get '/' do

	db = SQLite3::Database.new( "banco.db" )
	db.results_as_hash = true

	@entries = db.execute( "SELECT * FROM cadastro" ) 
	erb :index
end

post '/result' do
	nome = params["nome"]
	email = params["email"]
	sexo = params["sexo"]
	telefone = params["telefone"]

	pessoa = Pessoa.new(nome, email, sexo, telefone)

	pessoa.salvar

	erb :result, locals: { nome: nome, email: email, sexo: sexo, telefone: telefone }
end

get '/lista' do
	
	db = SQLite3::Database.new( "banco.db" )
	db.results_as_hash = true
	@entries = db.execute( "SELECT * FROM cadastro" )

 	erb :lista

end

get '/usuario/:nome' do
	@usuario = Pessoa.find(params[:nome])

	if @usuario	
		erb :usuario
	else
		"Nenhum post encontrado"
	end
end



