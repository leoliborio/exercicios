require 'rack'

class MeuSite
	def call(env)

		req = Rack::Request.new(env)

		puts req.params

		opcao = req.params["opcao"]
		
		if opcao == "login"
			conteudo = "Voce precisa se logar!"
		else
			conteudo = "Seja bem-vindo!"

		end

		[200, {'Content-Type' => 'text/html'}, ["<p>#{conteudo}</p>"]]
	end
end

run MeuSite.new