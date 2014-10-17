=begin
As a user I want to:
  set number of players
  start the game -- player n
  pick a flashcard
  guess an answer - 2 chances
  want game to end at 5 points
  see the score
  exit the game
=ende

=begin

Pseudo

CREATE class Controller
  DEFINE initialize
    INSTANCE OF DECK, an array (flashcard objects) = set_deck ()
    INSTANCE OF PLAYERS, an array (player objects) = set_players (#player)
  END



  DEFINE set_deck (takes 1 argument: csv)
    input: csv
    do: #get_file
        #reads_file
        #creates_flashcard_objects,
        #places_them_into_an_array
    output: array of [Flash card objects]
  END

  DEFINE get_file()
    INPUT : Asks user for file name of DECK
    DO :
    OUTPUT: returns the file name

  DEFINE reads_file(takes 1 argument)
    input : file string, file to read
    DO :    parse file
            calls function #creates_flashcard_objects
    OUTPUT : parsed txt file
  END

  DEFINE creates_flashcard_objects
    input:   parsed txt file
    do:      create flashcard objects
    output:
  END

  DEFINE set_players
    promopt player for players
    input: number of players
    do: ask for number of players and make that many player objects (talk to class Player)
    output: populated @players array
  END

  DEFINE start_game

=end
