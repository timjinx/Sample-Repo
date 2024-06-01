program CoinFlip;

uses
  SysUtils, DateUtils;

type
  Coin = class
  private
    side: Integer;
  public
    constructor Create;
    procedure Flip;
    procedure SetValue(value: Integer);
    function GetValue: Integer;
    function ToString: string;
  end;

  CList = class
  private
    size: Integer;
    coins: array of Coin;
  public
    constructor Create(sz: Integer);
    procedure Flip;
    function CountHeads: Integer;
  end;

constructor Coin.Create;
begin
  side := 0;
  Flip;
end;

procedure Coin.Flip;
begin
  side := Random(2);
end;

procedure Coin.SetValue(value: Integer);
begin
  if value in [0, 1] then
    side := value;
end;

function Coin.GetValue: Integer;
begin
  Result := side;
end;

function Coin.ToString: string;
begin
  if side = 1 then
    Result := 'Head'
  else
    Result := 'Tail';
end;

constructor CList.Create(sz: Integer);
var
  i: Integer;
begin
  size := sz;
  SetLength(coins, size);
  for i := 0 to size - 1 do
    coins[i] := Coin.Create;
end;

procedure CList.Flip;
var
  i: Integer;
begin
  for i := 0 to size - 1 do
    coins[i].Flip;
end;

function CList.CountHeads: Integer;
var
  i, heads: Integer;
begin
  heads := 0;
  for i := 0 to size - 1 do
    heads := heads + coins[i].GetValue;
  Result := heads;
end;

var
  ccount, flips: Integer;
  sorttype: string;
  startTime: TDateTime;
  hoccurs: array of Integer;
  coins: CList;
  i, flip, hc: Integer;

begin
  if ParamCount < 2 then
  begin
    Writeln('Usage: CoinFlip <ccount> <flips>');
    Halt;
  end;

  ccount := StrToInt(ParamStr(1));
  flips := StrToInt(ParamStr(2));
  sorttype := ParamStr(3);

  Randomize;
  startTime := Now;
  SetLength(hoccurs, 0);

  coins := CList.Create(ccount);

  for flip := 1 to flips do
  begin
    coins.Flip;
    hc := coins.CountHeads;
    if hc <= Length(hoccurs) then
      Inc(hoccurs[hc])
    else
    begin
      SetLength(hoccurs, hc + 1);
      hoccurs[hc] := 1;
    end;
  end;

  for i := 0 to Length(hoccurs) - 1 do
    Writeln('Head Count ', i, ' occurs ', hoccurs[i], ' times');

  Writeln(FormatDateTime('nn:ss:zzz', Now - startTime));
end.
