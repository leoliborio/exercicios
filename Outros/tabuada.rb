
puts "Escolha um número inteiro:"
number = gets.strip.to_i

for i in 0..10
	puts "Lá vai!"
	puts "#{number} * #{i} = " + (number * i).to_s
end