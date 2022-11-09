use strict;
use warnings;
use v5.34;
require "./quessanumber.pl";
require "./rockpaperscissors.pl";
require "./hangman.pl";


sub playground{
    while (1){ # 1-true, Infinite while loop
        say "Welcome to playground, select game: \n1. Guess a number \n2. Hangman \n3. Rock \n4. Exit";
        chomp(my $choice = <STDIN>);
        die "That's not an integer!" unless defined $choice && $choice =~ /^[0-9]+\z/; #exceptions
        last if $choice == 4;
        if ($choice == 1){
            quess_a_number()
        }
        elsif ($choice == 2){
            hangman()
        }
        elsif ($choice == 3){
            rock_paper_scissors()
        }
    else{
        print "Error, only numbers 1-4 please.";        
        }
    }
}

playground()