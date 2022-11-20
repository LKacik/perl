sub open-file($file-name){
  my $f = open $file-name, :r;
  my $contents = $f.slurp;
  return $contents;
  $f.close;
}

sub MAIN($argv){
  my $contents = open-file($argv);
  my @tokens = lexer($contents);
  parse(@tokens);
}

my @tokens-var = ();

sub lexer($contents){
  my @tok;
  my $state = 0;
  my @string;
  my @data = $contents.comb;
  # say @data;
  for @data {
    # print $_, "\n";
    push(@tok, $_);
    # say @tok;
    if @tok eq " " {
      if $state == 0 {
        @tok = "";
      }
      else {
        @tok = " ";
      }
    }
    elsif $_ eq "\n" {
      @tok = "";
    }
    elsif @tok.join("") eq "PRINT" {
      push(@tokens-var, "PRINT");
    }
    elsif $_ eq "\""  {
      if $state == 0 {
        $state = 1;
      }
      elsif $state == 1 {
        push(@tokens-var, "S:\"@string.join("")\"");
        @string = "";
        $state = 0;
      }
    }
    elsif $state == 1 {
      push(@string, $_);
      @tok = "";
      # say "+", @string;
    }
  }
  #say @tokens-var;
  return @tokens-var;
}

sub parse(@tokens){
  my $i = 0;
  while $i < @tokens.elems { # lenght
    if @tokens[$i], " ", substr(@tokens[$i+1], 0, 1) eq "PRINT S" { # "PRINT S" equality "PRINT S"
      say substr(@tokens[$i+1], 2);
      $i += 2;

    }
  }
}
