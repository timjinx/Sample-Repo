<?php
   $filename = '';
   $name = '';
   $fromname = '';
   $nextf = 0;
   $nextn = 0;
   $nextc = 0;
   foreach ($argv as $arg) {
      if ( $nextf == 1 ) {
         $filename = $arg;
         $nextf = 0;
      }
      if ( $arg == "-f" ) {
         $nextf = 1;
      }
      if ( $nextn == 1 ) {
         $name = $arg;
         $nextn = 0;
      }
      if ( $arg == "-n" ) {
         $nextn = 1;
      }
      if ( $nextc == 1 ) {
         $fromname = $arg;
         $nextc = 0;
      }
      if ( $arg == "-c" ) {
         $nextc = 1;
      }
   }
   echo "Processing " . $filename . "\n";
   $infile = fopen($filename, "r") or die ("Unable to open input file!");
   $outfile = fopen($filename . ".out", "w") or die ("Unable to open output file!");
   while (!feof($infile)) {
      $line = fgets($infile);
      fwrite($outfile, str_replace($fromname, $name, $line));
   }
   fclose($infile);
   fclose($outfile);
?>
