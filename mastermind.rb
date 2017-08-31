class Mastermind
    NUMBERS = ["1", "2", "3", "4", "5"]
    attr_accessor :guess
    def initialize
        @guess = []
        @hint = []
        @code = []
    end


# This method detemines the hints from the guess array and
# fills the hints array with the following:
# The hint will be exact if the guess is the same letter as the code and in the same position
# the hint will be near if the guess is just the same letter but not in the same position as the code
# the hint will be nope if the guess letter is not in the code
    def get_results
        i = 0
        while i < @guess.length
            if @guess[i] == @code[i]
                @hint[i] = "Exact"
                NUMBERS.delete(@code[i])
        elsif @code.include?(@guess[i])
                @hint[i] = "Near"
        else
            @hint[i] = "Nope"
        end
        i += 1
        end
        return @hint
    end


# This method outputs the results of the guess to the screen
# It shows the guess and the coresponding hints below it
    def show_result
            puts "\n"
            puts "\t   Choice 1 \t Choice 2\t Choice 3\t Choice 4"
            puts "-" * 70
            puts "Guess  |\t#{@guess[0]}\t   #{@guess[1]}\t\t  #{@guess[2]}\t\t  #{@guess[3]}"
            puts "Result |\t#{@hint[0]} \t   #{@hint[1]} \t    #{@hint[2]} \t    #{@hint[3]}"
            puts "\n"
    end


# This method runs when the user chooses the code breaker mode
# It first gets the computer to generate a random code from the NUMBERS array
# it then starts a loop, each time it asks for the user to enter thier guess
# and it will output the results to the screen.
# it will stop when the user guesses the code correctly or when the iteration reaches 10
    def set_up_game
        system 'clear'
        i = 1
        @code = NUMBERS.sample(4)
        while i < 11
            puts "\n"
            puts "Numbers to choose from: #{NUMBERS}"
            puts "\n"
            print "Please enter your guess for the four number code: \n"
            @guess = enter_guess
            get_results
            puts "\n"
            puts "Guess Number: #{i}"
            show_result

            if win?
                puts "You have Won!"
                play_again?
            end

            i += 1
        end
        puts "You have lost!"
        play_again?
    end

# This method checks to see if all the elements in the hint array
# equal 'Exact' when they do, the method will return true
    def win?
        @hint.all? {|a| a == "Exact"}
    end

    def enter_guess
        print "Guess a 4 digit code "
        guess = gets.chomp.chars
        puts guess
        guess.each { |num|
            puts num
            if !NUMBERS.include?(num)
                puts "Invalid letter please choose again"
            end
        }
        return guess
    end

end
mastermind = Mastermind.new
mastermind.set_up_game
