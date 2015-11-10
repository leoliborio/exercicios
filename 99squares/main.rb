require "./arquivo.rb" 
require "./restaurante.rb" 
require "./cliente.rb"

puts "Bem-vindo ao 99squares!"

opcao = "S"
while opcao == "S"

	puts "O que deseja fazer? (1) Add Restaurante (2) Add Cliente (3) Ver cadastros (4) Sair"
	answer = gets.strip.to_i

	if answer == 1
			
			puts "Qual o nome do restaurante?"
			nome_restaurante = gets.strip

			puts "Qual é a nota do restaurante?"
			nota_restaurante = gets.strip


			restaurante = Restaurante.new(nome_restaurante, nota_restaurante)
			restaurante.salvar 
			puts restaurante.procurar(nome_restaurante)

			puts "Restaurante cadastrado com sucesso!"

	elsif answer == 2

			puts "Qual o nome do cliente?"
			nome_cliente = gets.strip

			puts "Qual é a profissão do cliente?"
			profissao_cliente = gets.strip

			puts "Qual é o sexo do cliente?"
			sexo_cliente = gets.strip

			cliente = Cliente.new(nome_cliente, profissao_cliente, sexo_cliente)
			cliente.salvar
			puts cliente.procurar(nome_cliente)

			puts "Cliente cadastrado com sucesso!"
	
	elsif answer == 3

			puts "Cadastros de restaurantes:"

			arquivo = File.open("restaurante.csv", "r")
			
			linhas_imprimir = [] 

		    arquivo.each do |linha|
		          linhas_imprimir << linha
		    end

		    arquivo.close
    		
    		puts linhas_imprimir
  
			puts "Cadastros de clientes:"

			arquivo = File.open("cliente.csv", "r")

    		linhas_imprimir = [] 

		    arquivo.each do |linha|
		          linhas_imprimir << linha
		    end

		    arquivo.close
    		
    		puts linhas_imprimir
  
	elsif answer == 4

			puts "Saindo do sistema..."
	else

		puts "Por favor, digite uma opção válida!"

	end

	if answer == 4
		opcao = "N"
	else
		puts "Deseja continuar? (S ou N)"
		opcao = gets.strip.upcase
	end
end

puts "Obrigado por acessar o 99squares!"