/*	Name: Andrew Marcelo and Geoffrey Sollenberger 
	Expert Sytem: Board Games
*/										

/* Board game Suggestion Expert System */

/* the start predicate runs the code and asks the user questions 
   regarding what preferences they want in a game so the expert system 
   could suggest what game to the user based on preferences
*/

/* stores the user inputs in global variables in order for the 
   game predicate to use that information to determine what 
   game to suggest
*/

start :- write('Welcome to the Board Game Suggestion System'),
	nl,
	write('How many players are there? '),
    nl,
    read(Players),
	nb_setval(players,Players),

	write('How long do you want to play for? '),
	write('in minutes '),
	nl,
  	read(Length),
	nb_setval(length,Length),

	write('How complex do you want to the game to be?'),
	nl,
	write('[easy, medium, hard, very_hard] '),
	nl,
    read(RequestedComplex),
	nb_setval(complex,RequestedComplex ),

	write('What genre do you want to play? '),
    nl,
	write('[board_game, party_game, cards]'), 
	nl, 
    read(RequestedGenre),
	nb_setval(genre, RequestedGenre ),

	write('What skill do you want to be involved? '),
    nl,
	write('[examples: luck, bluffing, social_skills, deduction, drawing, 
			creative, humor]'), 
	nl, 
    read(RequestedSkills),
	nb_setval(skills, RequestedSkills ),
    write('I suggest: '),
	
	guessGame(GameName),
	write(GameName), !, 
	nb_delete(players),
	nb_delete(length),
	nb_delete(complex),
	nb_delete(genre),
	nb_delete(skills).

/* games */
guessGame('Secret Hitler') :- secret_hitler.
guessGame('Pictionary') :- pictionary.
guessGame('One Night Ultimate Warewolf') :- one_night_ultimate_warewolf.
guessGame('Chess') :- chess.
guessGame('Level Seven: Omega Protocol') :- level_seven_omega_protocol.
guessGame('Uno') :- uno.
guessGame('Yu-gi-oh') :- yu_gi_oh. 
guessGame('Monopoly') :- monopoly. 
guessGame('Cards Against Humanity') :- cards_against_humanity. 
guessGame('Telestrations After Dark') :- telestrations_after_dark. 
guessGame('unknown').

/* each game predicate has information regarding to that specific game
	and checks the user inputs to see if the user preferences match the 
	game information 
*/

uno :-	
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(2,10,Players), !,
		between(30,90,Length), !,
		member(RequestedComplex,['easy']), !,
		member(RequestedGenre,['cards']), !,
		member(RequestedSkills,['luck','counting']).

secret_hitler :-
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(5,10,Players),
		between(15,75,Length),
		member(RequestedComplex,['medium']),
		member(RequestedGenre,['cards','party_game']),
		member(RequestedSkills,['deduction','bluffing']).

pictionary :-
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(3,10,Players), !,
		between(5,30,Length), !,
		member(RequestedComplex,['easy']), !,
		member(RequestedGenre,['party_game']), !,
		member(RequestedSkills,['drawing','image_recognition', 'creative']).

one_night_ultimate_warewolf :-
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(3,10,Players), !,
		between(5,20,Length), !,
		member(RequestedComplex,['medium']), !,
		member(RequestedGenre,['cards','party_game']), !,
		member(RequestedSkills,['deduction','bluffing', 'social_skills', 'role_play', 'negotiation', 'partnership']).

chess :-
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(1,2,Players), !,
		between(5,30,Length), !,
		member(RequestedComplex,['easy','medium']), !,
		member(RequestedGenre,['board_game']), !,
		member(RequestedSkills,['strategy','problem_solving', 'patience', 'calmness']).

level_seven_omega_protocol :-
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(2,6,Players), !,
		between(60,120,Length), !,
		member(RequestedComplex,['hard','very_hard']), !,
		member(RequestedGenre,['board_game']), !,
		member(RequestedSkills,['strategy','role_play', 'cooperation', 'resource_management']).

yu_gi_oh :-	
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(2,2,Players), !,
		between(30,90,Length), !,
		member(RequestedComplex,['easy']), !,
		member(RequestedGenre,['cards']), !,
		member(RequestedSkills,['strategy','patience']).

monopoly :-	
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(2,6,Players), !,
		between(60,90,Length), !,
		member(RequestedComplex,['easy', 'medium']), !,
		member(RequestedGenre,['board_game']), !,
		member(RequestedSkills,['strategy','patience', 'investment']).

 telestrations_after_dark :- 
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(2,15,Players), !,
		between(15,30,Length), !,
		member(RequestedComplex,['easy']), !,
		member(RequestedGenre,['party_game']), !,
		member(RequestedSkills,['drawing','creative', 'humor']).

cards_against_humanity :- 
		nb_getval(players,Players),
		nb_getval(length,Length),
		nb_getval(complex,RequestedComplex),
		nb_getval(genre,RequestedGenre),
		nb_getval(skills,RequestedSkills),
		between(2,16,Players), !,
		between(20,40,Length), !,
		member(RequestedComplex,['easy']), !,
		member(RequestedGenre,['board_game']), !,
		member(RequestedSkills,['humor','social_skills', 'creative']).
		