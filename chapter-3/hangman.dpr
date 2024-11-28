program hangman;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  MaxIncorrectGuesses = 8;

{
returns a random word in a list for the player to guess
}
function FindWordToGuess: string;
var
  Words: array[1..10] of string;
  WordIdx: integer;
begin
  Words[1] := 'cat';
  Words[2] := 'apple';
  Words[3] := 'program';
  Words[4] := 'sun';
  Words[5] := 'puzzle';
  Words[6] := 'hangman';
  Words[7] := 'flower';
  Words[8] := 'game';
  Words[9] := 'pascal';
  Words[10] := 'keyboard';

  Randomize;
  WordIdx := Random(10) + 1;
  Result := UpperCase(Words[WordIdx]);
end;

{
searches string S for character C ...
  if C is found in S returns True;
  if C is not in S returns False;
}
function StringContains(const S: string; C: Char): boolean;
var
  I: integer;
begin
  for I := 1 to Length(S) do
    if S[I] = C then
      Exit(True);

  Result := False;
end;



procedure PlayGame;
var
  SecretWord: string;   {word to guess}
  YourWord: string;     {word based on user guesses}
  AllLetters: string;   {letters guessed by player}
  Guess: Char;          {players next guess}
  GuessesLeft: integer; {number of guesses left}
  I: integer;
  UpdateCount: integer; {number of letter replaced in word based on guess}
begin
  GuessesLeft := MaxIncorrectGuesses;

  Writeln('Welcome to Mice and Stairs Game!');
  Writeln('You have ', GuessesLeft, ' tries to guess the word before the mice escape.');
  Writeln('Each time you guess incorrectly the mice go up one stair towards an open door.');
  Writeln;

  SecretWord := FindWordToGuess;
  for I := 1 to Length(SecretWord) do
    YourWord := YourWord + '.';

  repeat
    {Display game state information}
    Write('Word: ', YourWord);
    Write(' | Guesses Left: ', GuessesLeft);
    Write(' | Letters Used: ', AllLetters);
    Writeln;

    {Ask user to guess a letter in the word...}
    Writeln('Enter a letter:');
    ReadLn(Guess);
    Guess := UpCase(Guess);

    {Validate user input...}
    if not (Guess in ['A'..'Z']) then
    begin
      WriteLn('Invalid input. Please enter a letter (A-Z).');
    end
    else if StringContains(AllLetters, Guess) then
      Writeln('Doh! You have already tried that letter.')
    else
    begin
      UpdateCount := 0;
      AllLetters := AllLetters + Guess;
      for I := 1 to Length(SecretWord) do
        if SecretWord[I] = Guess then
        begin
          YourWord[I] := Guess;
          Inc(UpdateCount);
        end;

      if UpdateCount = 0 then
      begin
        Dec(GuessesLeft);
        Writeln('Sorry! Wrong guess');
      end
    end;
  until (GuessesLeft = 0) or (YourWord = SecretWord);

  if GuessesLeft > 0 then
    WriteLn('Congratulations! You guessed the word: ', SecretWord)
  else
  begin
    WriteLn('Game Over! The word was: ', SecretWord);
    WriteLn('The mice have escaped and running around the house.');
  end;
end;

begin
  try
    PlayGame;
    ReadLn;
    { TODO -oUser -cConsole Main : Insert code here
    secret word := find word to guess
    loop:
      ask the user to guess a letter
      enter a letter
      does this letter appear in the word
      if yes then replace all occurances
      else inc. a guess counter
    until word guessed or number of tries >= max tries
    }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
