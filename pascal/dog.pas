program dogProg;
uses crt;

type
   Dog = object
   private
      name : PChar;
   public 
      procedure setName(n: PChar);
      function getName(): PChar;
      function bark(): PChar;

end;

procedure Dog.setName(n: PChar);
begin
   name := n;
end;

function Dog.getName(): PChar;
begin
    getName := name;
end;

function Dog.bark(): PChar;
begin
   bark := 'Woof';
end;

var
   myDog: Dog;

begin
   myDog.setName('Hunter');
   writeln('The name of my dog is ', myDog.getName());
   writeln(myDog.getName(), ' goes ', myDog.bark());
end.
