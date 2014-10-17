=begin
As a user I want to:
  set number of players
  start the game -- player n
  pick a flashcard
  guess an answer - 2 chances
  want game to end at 5 points
  see the score
  exit the game
=end



Pseudod

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
    DO :    read the file
            push each line as string element into array
            slice_each by 3, delete blank element
            [[]]
            iterate through each create flashcard object
    OUTPUT : parsed txt file
  END


  DEFINE set_players

    input: number of players
    do: promopt user for players
        make that many player objects (talk to class Player)
    output: populated @players array
  END

  DEFINE start_game
   input :
   do:  select player
        player picks card from @DECK
        player gets the question
        player enter the answer
          True : increment player score by 1(check if winner exists), go to next player
          False : Allow one more guess
            True : do line 63
            False : No point, go to next player

    output

  DEFINE winner?
    Input. Player objects
    DO : Check score == 5 return True
    Output : Return tru if score ==5

  DEFINE exit()
    INPUT
    DO
    OUPUT  Break out of start_game


