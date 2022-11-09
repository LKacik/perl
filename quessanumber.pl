use strict;
use warnings;
use v5.34;


sub quess_a_number {
    say "Guess a Number between 0 and 100:";
    my $human_number;
    my $cpu_lucky_number = int(rand 101);
    my $mistakes = 1;
    $human_number = <STDIN>;
    while ($cpu_lucky_number !=  $human_number) {
        print "Mistakes: $mistakes\n";
    
        if ($human_number > $cpu_lucky_number && $mistakes < 5) {
            say "Your number is greater, try again:";
            $mistakes++;
        }
        elsif ($human_number < $cpu_lucky_number && $mistakes < 5) {
            say "Your number is less, try again:";
            $mistakes++;
        }
        elsif ($mistakes == 5){
            say "Lose, too many mistakes";
            sleep(1);
            playground();
        }
        $human_number = <STDIN>;

    }
    say "Hurra, You Win! CPU number is $cpu_lucky_number!";
    sleep(1);
}

1;#The file must return true as the last statement- require



