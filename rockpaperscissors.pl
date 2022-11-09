use strict;
use v5.34;


my @beat = (1, 2, 0);
my @names = qw( Rock Paper Scissors );
my ($user_win,$cpu_win,$tied) = (0, 0, 0);

sub rock_paper_scissors{
  while (1) { #1-true,  Infinite while loop

    my $cpu;
    $cpu = int rand(3);

    print "Rock (1), Paper (2), Scissors (3), QUIT (0):  ";
    chomp(my $user = <STDIN> - 1);
    last if $user == -1; # break condition  
    print "$names[$user] vs. $names[$cpu] => ";
    if ($cpu == $user){
      $tied++; print "tied\n"
      }
    elsif ($cpu == $beat[$user]){
      $cpu_win++; print "AI wins\n"
      }
    else{
      $user_win++; print "You win\n"
      }   
  }
  print "You won: $user_win\n";
  print "AI won:  $cpu_win\n";
  print "Ties:    $tied\n\n";
  sleep(1);
}

1;#The file must return true as the last statement- require

