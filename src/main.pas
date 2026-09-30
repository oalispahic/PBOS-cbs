program cbs;

{$MODE OBJFPC}{$H+}

uses
  SysUtils,
  Config;

begin
  try
    Config.load();
    writeln('---', Config.App.Name, '---');
    writeln('Environment: ', Config.App.Env);
  except
    on E: Exception do
      writeln('Error: ', E.Message);
  end;
end.
