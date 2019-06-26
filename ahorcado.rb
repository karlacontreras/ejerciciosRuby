puts "-----A H O R C A D O-----"
puts "Ingrese una palabra para adivinar:  "
palabra = gets.chomp

puts "\nComienza el juego!"
palabra2 = ""
palabra.each_char { |char| palabra2 += " _" }
puts "\"" + palabra2 + " \""

my_arr = ["pierna derecha", "pierna izquierda", "brazo derecho", "brazo izquierdo", "tronco", "cabeza"]

contador = 0
while contador < my_arr.length

	puts "\nIngrese una letra: "
	letra = gets.chomp
	anterior = palabra2.dup
	for i in (0..palabra.length)
		if palabra[i]==letra
			palabra2[i*2+1] = letra
		end
	end	

	puts "\n\" " + palabra2 + " \""

	if anterior == palabra2
		puts "\nPerdiste " + my_arr[contador]
		contador += 1
	elsif  palabra2.gsub(/\s+/, "")== palabra
		puts "\nGanaste el juego!"
		break
	end
		
	if contador == 6
		puts "\nPerdiste el juego"
		break
	end

end