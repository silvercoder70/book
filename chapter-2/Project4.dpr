program Project4;

{$APPTYPE CONSOLE}

{$R *.res}

{
Links:
https://docwiki.embarcadero.com/RADStudio/Athens/en/Simple_Types_(Delphi)
https://wiki.freepascal.org/simple_type

Simple Types

fundamental building blocks for storing data - represent
single, basic pieces of information, like numbers,
characters, or logical values.

1. Boolean

Boolean values are like yes or no, true or false.
They answer simple questions.
Example:
If I ask, ‘Do you like ice cream?’
and you say ‘Yes,’ that’s true!
If you say ‘No,’ that’s false.

var
  b: Boolean;
begin
  b := False; //True;
end;

2. Integers

Integers are numbers we use to count or keep track of
things—no parts, just whole numbers.
Example:
If you have 4 toy cars, that’s an integer.
If you give 1 car to a friend, you have 3 cars
left—still an integer! No broken cars allowed

var
  i: integer;
begin
  i := 1;
end;

3. Floating-Point Numbers

Floating-point numbers are like numbers that can have
little pieces or parts, not just whole things.
Example:
Imagine you have a pizza, and you eat half of it.
That’s 0.5 of a pizza! Those are floating-point numbers—
they help us talk about parts of things.

another example is pi = 3.14....

var
  d: Double;
begin
  d := 0.5;
end;

4. Characters (Char)

Characters are single letters, numbers, or symbols

var
  c: Char;
  I: integer;
begin
  c := 'Y';
end;

Storage
- on the stack


Declaring Variables

- in Delphi can be declared inline
- in Free Pascal in declaration block before code

Example:

Delphi (won't work in Free Pascal)
  procedure Foo(...);
  begin
    var Age: integer := 30;
    Writeln('Age = ', Age);
  end;

Free Pascal (and Delphi!)
  procedure Foo(...);
  var
    Age: integer;
  begin
    Age := 25;
    Writeln('Age = ', Age);
  end;

Run Demo Program

Q. Where does size matter?
A. When interfacing with other systems developed in
other languages and you have to write the interface
section yourself?!

}

uses
  System.SysUtils,
  Math;

procedure InlineVariableDemo;
var
  J: boolean;
begin
  begin
    var I: integer := 20;
    I := 10;
  end;
end;

procedure VariableDemo;
begin
  Writeln('Integers');
  Writeln('Size of integer: ', SizeOf(integer), ' Range: ', Low(integer), ' to ', High(integer));
  Writeln('Size of SmallInt: ', SizeOf(SmallInt), ' Range: ', Low(SmallInt), ' to ', High(SmallInt));
  Writeln('Size of ShortInt: ', SizeOf(ShortInt), ' Range: ', Low(ShortInt), ' to ', High(ShortInt));
  Writeln('Size of LongInt: ', SizeOf(LongInt), ' Range: ', Low(LongInt), ' to ', High(LongInt));
  Writeln('Size of Word: ', SizeOf(Word), ' Range: ', Low(Word), ' to ', High(Word));
  Writeln('Size of Cardinal: ', SizeOf(Cardinal), ' Range: ', Low(Cardinal), ' to ', High(Cardinal));
  Writeln('Size of Int64: ', SizeOf(Int64), ' Range: ', Low(Int64), ' to ', High(Int64));
  Writeln('Size of UInt64: ', SizeOf(UInt64), ' Range: ', Low(UInt64), ' to ', High(UInt64));
  Writeln('Size of Byte: ', SizeOf(Byte), ' Range: ', Low(Byte), ' to ', High(Byte));
  Writeln;

  Writeln('Floating Point Numbers');
  Writeln('Size of Real48: ', SizeOf(Real48));
  Writeln('Size of Single: ', SizeOf(Single));
  Writeln('Size of Double: ', SizeOf(Double));
  Writeln('Size of Extended: ', SizeOf(Extended));
  Writeln('Size of Comp: ', SizeOf(Comp));
  Writeln('Size of Currency: ', SizeOf(Currency));
  Writeln;

  Writeln('Char Types');
  Writeln('Size of Char: ', SizeOf(Char));
  Writeln('Size of WideChar: ', SizeOf(WideChar));
  Writeln('Size of AnsiChar: ', SizeOf(AnsiChar));
  Writeln;

  Writeln('Boolean Types');
  Writeln('Size of ByteBool: ', SizeOf(ByteBool));
  Writeln('Size of WordBool: ', SizeOf(WordBool));
  Writeln('Size of LongBool: ', SizeOf(LongBool));
  Writeln('Size of Boolean: ', SizeOf(Boolean));

  ReadLn;
end;

begin
  try
    VariableDemo;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
