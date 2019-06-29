class Hangman
  BODYPARTS =  ["pierna derecha", "pierna izquierda", "brazo derecho", "brazo izquierdo", "tronco", "cabeza"]
  @@counter = 0

  def start_game()
    puts "Ingrese una palabra para adivinar: "
    gets.chomp
  end

  def convert_word(string)
    string2 = ""
    string.each_char { |char| string2 += "_"}
    string2
  end

  def print_hidden_word(string)
    string.each_char { |char| print " "+ char }
  end

  def ask_letter(hidden_string)
    puts "\nIngrese una letra"
    letter = gets.chomp
    if !isLetter(letter)
      puts "El caracter que ingresaste no es una letra. Intenta de nuevo."
      ask_letter(hidden_string)
    end
    if hidden_string.include? letter
      puts "Ya ingresaste esta letra. Intenta de nuevo."
      ask_letter(hidden_string)
    end
    letter
  end

  def guess_letter(word, string, letter)
    word.each_char.with_index do |char, index|
       string[index] = letter if char == letter
    end
    string
  end

  def evaluate(word, string, previous)
  	if string == previous
      puts "\nPerdiste " + BODYPARTS[@@counter]
      @@counter += 1
  	elsif  string == word
  	  puts "\nGanaste el juego!"
      exit
  	end
  end

  def check_still_live()
    if @@counter == BODYPARTS.length
      puts "Perdiste el juego"
      exit
    end
  end

  private
  def isLetter(letter)
    letter =~ /[A-Za-z]/
  end

end

puts "-----A H O R C A D O-----"
game = Hangman.new
word = game.start_game()
hidden_string = game.convert_word(word)
game.print_hidden_word(hidden_string)
loop do
  letter = game.ask_letter(hidden_string)
  previous = hidden_string.dup
  hidden_string = game.guess_letter(word, hidden_string, letter)
  game.print_hidden_word(hidden_string)
  game.evaluate(word,hidden_string,previous)
  game.check_still_live()
end