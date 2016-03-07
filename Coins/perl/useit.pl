use Coin;
$mycoin = Coin->new(10);
print "My coin's denomination is ",$mycoin->denomination(),"\n";
print "My coin's face is ",$mycoin->print_face(),"\n";
$mycoin->flip();
print "My coin's face is ",$mycoin->print_face(),"\n";


$mycoin2 = Coin->new(5);
print "My coin's denomination is ",$mycoin2->denomination(),"\n";
print "My coin's face is ",$mycoin2->print_face(),"\n";
$mycoin2->flip();
print "My coin's face is ",$mycoin2->print_face(),"\n";

print "Setting to tails\n";
$mycoin2->setValue(0);
print "My coin's face is ",$mycoin2->print_face(),"\n";

print "Setting to heads\n";
$mycoin2->setValue(1);
print "My coin's face is ",$mycoin2->print_face(),"\n";

print "Flipping it\n";
$mycoin2->flip();
print "My coin's face is ",$mycoin2->print_face(),"\n";
