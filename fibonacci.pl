use strict;
use warnings;
use v5.34;
use Test::Simple tests => 5;

sub fibonacci{
    my $number = shift;
    if ($number < 0) {
    return "Error";
    }
    if ($number == 0){
        return 0;
    }
    elsif ($number > 0 and $number <=2){
        return 1;
    }
    else{
        return (fibonacci($number - 1) + fibonacci($number - 2))
    }
}

ok(fibonacci(0)==0);
ok(fibonacci(1)==1);
ok(fibonacci(6)==8);
ok(fibonacci(14)==377);
ok(fibonacci(19)==4181);

