require 'sinatra'

# route
# get '/' do
# 	"Testando"
# end

get '/' do
	

	site = params["site"]

	

	# if site == "globo"
	# 	"A URL do site é www.globo.com"
	# else
	# 	"Não sei"
	# end

	case site
		when "globo" then "www.globo.com"
		when "uol" then "www.uol.com"
		when "terra" then "www.terra.com"
		when "google" then "www.google.com"
		when "yahoo" then "A URL é www.yahoo.com"
		else "Não sei"
	end

	

end
