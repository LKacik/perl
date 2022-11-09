use strict;
use warnings;
no warnings  'experimental';
use v5.34;


sub hangman {
    my @list_of_words = ('nintendo', 'sony', 'sega', 'comodore');
    my $word = $list_of_words[rand @list_of_words];
    my $word_len = length($word);
    my @result = ();
    for(my $i=0; $i<$word_len; $i++){
        push(@result, "_ ");
    }
    
    my @misses = ();
    my @char = ();
    my $k=0;
    my @array = split(//,$word);
    my $display_mistakes=0;
    while ($display_mistakes<=7) {
        my $key=0;
        my $repeat=0;
        print "Word: @result\n";
        my $temp="@result" eq "@array";
        if ($temp) {
            print "You Wins!\n";
            last;
        }
        
        print "Guess: ";
        my $n=<STDIN>;
        chop($n);
        push(@char, "$n");
        $k++;
        for(my $i=0; $i<$k-1; $i++){
            if("$n" eq "$char[$i]"){
                $repeat=1;
                last;
            }
            
        }
        if($repeat==0) {
            for(my $i=0; $i<$word_len; $i++){
            my $temp="$n" eq "$array[$i]";
            if ($temp==1) {
                $result[$i]=$array[$i];
                $key=1;
                }
            
            }
            if ($key==0) {
                push(@misses, "$n");
                $display_mistakes++;
            }
            
        }
        else{
            print "The letter Was...\n";
            $display_mistakes++;
        }
            print "Misses: @misses\n";
            given($display_mistakes){ # experimental
                when(0){
                    print "0 mistakes\n";
                }
                when(1){
                    print "1 mistakes\n";
                }
                when(2){
                    print "2 mistakes\n";
                }
                when(3){
                    print "3 mistakes\n";
                }
                when(4){
                    print "4 mistakes\n";
                }
                when(5){
                    print "5 mistakes\n";
                }
                when(6){
                    print "6 mistakes\n";
                }
                when(7){
                    print "7 mistakes\n";
                }
                when(8){
                    print "8 mistakes\n";
                    print "You lose the game!\n";
                    sleep(1);
                }
            }
    }
}

1;#The file must return true as the last statement- require