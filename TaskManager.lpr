program TaskManager;

///////////////////////////////////////////////////////////////////////
// The 'uses' clause specifies the units (/libraries) required for the
// program to build and function correctly. Here, we include 'SysUtils'
// 'StrUtils' for ifthen().

uses
  SysUtils,
  StrUtils;

///////////////////////////////////////////////////////////////////////
// The 'const' section defines constants used throughout the program.

const
  MaxTasks = 100;

///////////////////////////////////////////////////////////////////////
// The 'type' section is where custom data structures are defined.

type
  TTask = record
    Title: string;
    DueDate: TDateTime;
    Completed: Boolean;
  end;

///////////////////////////////////////////////////////////////////////
// Procedures and functions are defined to perform specific actions
// in the program. This makes the code modular and reusable.

procedure AddTask(
  var Tasks: array of TTask;
  var TaskCount: Integer;
  Title: string;
  DueDate: TDateTime);
begin
  if TaskCount < MaxTasks then
  begin
    Inc(TaskCount);
    Tasks[TaskCount].Title := Title;
    Tasks[TaskCount].DueDate := DueDate;
    Tasks[TaskCount].Completed := False;
  end
  else
    WriteLn('Task list is full.');
end;

procedure DisplayTasks(
  const Tasks: array of TTask;
  TaskCount: Integer);
var
  I: Integer;
begin
  for I := 1 to TaskCount do
  begin
    WriteLn(I, ': ', Tasks[I].Title, ' (Due: ', DateToStr(Tasks[I].DueDate), ') - ',
      IfThen(Tasks[I].Completed, 'Completed', 'Incomplete'));
  end;
end;

procedure CompleteTask(
  var Tasks: array of TTask;
  TaskCount: Integer;
  TaskNumber: Integer);
begin
  if (TaskNumber >= 1) and (TaskNumber <= TaskCount) then
  begin
    Tasks[TaskNumber].Completed := True;
    WriteLn('Task "', Tasks[TaskNumber].Title, '" marked as complete.');
  end
  else
    WriteLn('Invalid task number.');
end;

///////////////////////////////////////////////////////////////////////
// The 'var' section in the main program block declares the main
// variables used in the program,
var
  Tasks: array[1..MaxTasks] of TTask;
  TaskCount: Integer;
  TaskNum: Integer;

///////////////////////////////////////////////////////////////////////
// The main part of the program starts here

begin
  TaskCount := 0;
  try
    WriteLn('Welcome to the Task Manager');
    AddTask(Tasks, TaskCount,
      'Finish article draft', EncodeDate(2024, 11, 10));
    AddTask(Tasks, TaskCount,
      'Review code examples', EncodeDate(2024, 11, 11));
    WriteLn('Current Tasks:');
    DisplayTasks(Tasks, TaskCount);

    WriteLn('Enter task number to complete: ');
    ReadLn(TaskNum);
    CompleteTask(Tasks, TaskCount, TaskNum);
    DisplayTasks(Tasks, TaskCount);
  except
    on E: EConvertError do
      WriteLn('Invalid input. Please enter a number.');
    on E: Exception do
      WriteLn('Invalid input. Please enter a number.' + E.Message);
  end;
  ReadLn;
end.

