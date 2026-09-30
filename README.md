
PBOS (Friend bank) backend repo

## Environment
Environment file  `config.ini` must reside in the root directory before running. Ensure config.ini.example correctly represents all environment variables used in the app.

Configuration variables are grouped into concerns (e.g., `Database`, `Server`). When the system initializes, the `Config.load()` procedure reads the keys from `config.ini` and populates global configurations:

```pascal
type
  // Logical grouping for Database configurations
  TDatabaseConfig = record
    Host: string;
    Port: Integer;
    Name: string;
    User: string;
    Password: string;
  end;

// Variables are populated safely using fallback defaults if a key is missing:
Database.Host := Ini.ReadString('Database', 'DB_HOST', '127.0.0.1');
Database.Port := Ini.ReadInteger('Database', 'DB_PORT', 3306);
Server.Port   := Ini.ReadInteger('Server', 'PORT', 8080);

