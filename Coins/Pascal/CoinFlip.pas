program CoinFlip;

uses
  SysUtils, DateUtils, Math;

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
  if ParamCount < 4 then
  begin
    Writeln('Usage: CoinFlip <ccount> <flips> <sorttype>');
    Halt;
  end;

  ccount := StrToInt(ParamStr(1));
  flips := StrToInt(ParamStr(2));
  sorttype := ParamStr(3);

  if sorttype = 'key' then
    Writeln('Sorting by key')
  else if sorttype = 'value' then
    Writeln('Sorting by value')
  else
  begin
    Writeln('Unknown Sort Type, try key or value');
    Halt;
  end;

  Randomize;
  startTime := Now;
  SetLength(hoccurs, 0);

  coins := CList.Create(ccount);

  for flip := 1 to flips do
  begin
    coins.Flip;
    hc := coins.CountHeads;
    for i := 0 to Length(hoccurs) - 1 do
    begin
      if hoccurs[i] = hc then
      begin
        Inc(hoccurs[i + 1]);
        Break;
      end;
    end;
    SetLength(hoccurs, Length(hoccurs) + 1);
    hoccurs[Length(hoccurs) - 1] := 1;
  end;

  if sorttype = 'key' then
  begin
    // Sort by keys
    for i := 0 to Length(hoccurs) - 1 do
      Writeln('Head Count ', i, ' occurs ', hoccurs[i], ' times');
  end
  else
  begin
    // Sort by values
    for i := 0 to Length(hoccurs) - 2 do
    begin
      for flip := i + 1 to Length(hoccurs) - 1 do
      begin
        if hoccurs[i] > hoccurs[flip] then
        begin
          hc := hoccurs[i];
          hoccurs[i] := hoccurs[flip];
          hoccurs[flip] := hc;
        end;
      end;
    end;
    for i := 0 to Length(hoccurs) - 1 do
      Writeln('Head Count ', i, ' occurs ', hoccurs[i], ' times');
  end;

  Writeln(FormatDateTime('nn:ss:zzz', Now - startTime));
end.