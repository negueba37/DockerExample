program Docker;

{$APPTYPE CONSOLE}

{$R *.res}

uses Horse, System.SysUtils;

begin
  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('Gabriel');
    end);
  THorse.Get('/env',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(
      Format('DB Host: %s DB Port: %s',
      [
       GetEnvironmentVariable('DB_HOST'),
       GetEnvironmentVariable('DB_PORT')
      ]));
    end);
  THorse.Get('/teste',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(
      Format('DB Host: %s DB Port: %s',
      [
       GetEnvironmentVariable('DB_HOST'),
       GetEnvironmentVariable('DB_HOST')
      ]));
    end);
  THorse.Listen(9000);
end.
