unit Config;

{$MODE OBJFPC}{$H+}

interface

uses IniFiles, SysUtils;

type

  // App
  TAppConfig = record
    Name: string;
    Env: string;
    end;
  
  // Database
  TDatabaseConfig = record
    Host: string;
    Port: Integer;
    Name: string;
    User: string;
    Password: string;
  end;

var
  App: TAppConfig;
  Database: TDatabaseConfig;

procedure Load();

implementation

procedure Load();
var
  Ini: TIniFile;
begin
  if not FileExists('config.ini') then 
    raise Exception.Create('Missing config.ini');

  Ini := TIniFile.Create('config.ini');
  try

    // Map [App] Config
    App.Name := Ini.ReadString('App', 'APP_NAME', 'PBOS');
    App.Env := Ini.ReadString('App', 'APP_ENV', 'development');

    // Map [Database] Config
    Database.Host     := Ini.ReadString('Database', 'DB_HOST', '127.0.0.1');
    Database.Port     := Ini.ReadInteger('Database', 'DB_PORT', 3306);
    Database.Name     := Ini.ReadString('Database', 'DB_NAME', 'friendbank');
    Database.User     := Ini.ReadString('Database', 'DB_USER', 'friendbank');
    Database.Password := Ini.ReadString('Database', 'DB_PASSWORD', 'change-me');
    
  finally
    Ini.Free;
  end;
end;

end.
