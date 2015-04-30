<?php
	function __autoload($class_name)
	{
		include_once 'inc/class.' . $class_name . '.inc.php';
	}

	__autoload("Coin");
	
	function Coins( &$array, $size ) {
        if ($size <= 0) $size=1;
        for ($i=0; $i<$size; $i++) {
			$c1 = new Coin;
            array_push ($array, $c1);
		}
	}
	function Flip( &$array ) {
		foreach ( $array as $coin ) {
			$coin->flip();
		}
	}
	function CountHeads ( &$array ) {
		$hc = 0;
		foreach ( $array as $coin ) {
			if ( $coin->getValue() == 1 ) {
				$hc++;
			}
		}
		return $hc;
	}
	function PrintArray ( &$array ) {
		foreach ( $array as $coin ) {
			print $coin . "\n";
		}
	}
	
	date_default_timezone_set('America/Los_Angeles');
	$coins = array();
	$CountArray = array();
	$handle = fopen ("php://stdin","r");
	print "How many coins?\n";
	$ccount = (int) fgets($handle);
	
	$stime = new DateTime();
	
	## Initialize $CountArray
	for ($i=0; $i<=$ccount; $i++) {
		array_push ($CountArray, 0);
	}
	
	Coins($coins, $ccount);
	
	print "How many flips?\n";
	$fcount = (int) fgets($handle);
	for ( $i=0; $i<$fcount; $i++) {
		Flip($coins);
		$heads = CountHeads($coins);
		## print "We have " . $heads . " heads\n";
		$CountArray[$heads]++;
	}
	for ($i=0; $i<=$ccount; $i++) {
		if ($CountArray[$i] > 0 ) print "Head Count " . $i . "\toccurs " . $CountArray[$i] . " times\n";
	}
	$etime = new DateTime();
	print "Start time ". $stime->format('H:i:s') . "\n";
	print "End time " . $etime->format('H:i:s') . "\n";
	
?>
