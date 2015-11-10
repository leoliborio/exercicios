require "./arquivo.rb"
require "./account.rb"

puts "Olá, informe o seu nome:"
id = gets.strip.downcase

existing_account = false

arquivo = File.open("saldo.txt", "r") 

arquivo.each do |line|
	if line.include? id
		result = line.strip.split(";")
		existing_account = true
		@id = result[0] 
		@balance = result[1].to_f

 	end
end

arquivo.close

if existing_account == true
	puts "Bem-vindo de volta, #{@id}!"
	puts "Seu saldo é de #{@balance}."
end

account = Account.new(@id, @balance)

if existing_account == false
	account = Account.new(id, 0)
end

value = 0
continue = "S"

while continue =="S"

	puts "O que gostaria de fazer? (D) Depositar (S) Sacar (E) Extrato (F) Fechar o Aplicativo"
	operation = gets.strip.upcase


	if operation == "D" or operation == "S"
		puts "Qual o valor?"
		value = gets.strip.to_f
	end

	puts account.action(operation, value)

	account.salvar

	if operation == "F" 
		continue = "N"
	else	
		puts "Gostaria de continuar? (S ou N)"
		continue = gets.strip.upcase
	end

end

puts "Volte Sempre :)"