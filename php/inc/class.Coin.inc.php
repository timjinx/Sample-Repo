<?php
/**
 * @author Tim Jinkerson
 */
class Coin
{
        private $side;
		
		function __construct() {
			$this->flip();
		}

        public function setValue ( $value )
        {
             if ( $value == 0 or $value == 1 )
             {
                $this->side = $value;
             }
        }
        public function getValue ()
        {
             return $this->side;
        }
		public function flip ()
		{
			$this->side = rand(0,1);
		}
		public function __toString()
		{
			$result = "Tails";
			if ( $this->getValue() == 1 ) {
				$result = "Heads";
			} 
			return $result;
		}
}

?>
