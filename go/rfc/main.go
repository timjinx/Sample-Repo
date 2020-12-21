package main

// Author Tim Jinkerson M7TJX
// Date 20th December 2020
// Accepts the values of a capacitor and an inductor
// and calculates the resonant frequency of the tuned
// circuit that that they would create

import (
	flag "flag"
	"fmt"
	"math"
	"os"
)

func stringfrequency(f float64) string {
	var punits string
	var pvalue float64
	if f > math.Pow(10, 9) {
		pvalue = f / math.Pow(10, 9)
		punits = "Ghz"
	} else if f > math.Pow(10, 6) {
		pvalue = f / math.Pow(10, 6)
		punits = "Mhz"
	} else if f > math.Pow(10, 3) {
		pvalue = f / math.Pow(10, 3)
		punits = "khz"
	} else {
		pvalue = f
		punits = "hz"
	}
	preturn := fmt.Sprintf("%f", pvalue) + " " + punits
	return preturn
}

func calculateValue(c float64, l float64) float64 {
	var freq float64 = 0
	freq = 1 / (2 * pi * (math.Sqrt(c * l)))
	return freq
}

func main() {
	const pi = 3.14159

	lPtr := flag.Int64("L", 0, "Inductance")
	cPtr := flag.Int64("C", 0, "Capacitance")
	cuPtr := flag.String("cunit", "uF", "F, mF, uF, nF or pF")
	luPtr := flag.String("lunit", "uH", "H, mH, uH, nH, pH")

	flag.Parse()

	inductance := *lPtr
	capacitance := *cPtr

	fmt.Printf("Capacitance = %d %s\n", capacitance, *cuPtr)
	fmt.Printf("Inductance = %d %s\n", inductance, *luPtr)

	var cscale float64 = 1
	var lscale float64 = 1

	switch *cuPtr {
	case "F":
		cscale = 1
	case "mF":
		cscale = float64(math.Pow(10, -3))
	case "uF":
		cscale = float64(math.Pow(10, -6))
	case "nF":
		cscale = float64(math.Pow(10, -9))
	case "pF":
		cscale = float64(math.Pow(10, -12))
	default:
		// Shouldn't get here
		fmt.Println("Invalid capacitance unit")
		os.Exit(2)
	}
	switch *luPtr {
	case "H":
		lscale = 1
	case "mH":
		lscale = float64(math.Pow(10, -3))
	case "uH":
		lscale = float64(math.Pow(10, -6))
	case "nH":
		lscale = float64(math.Pow(10, -9))
	case "pH":
		lscale = float64(math.Pow(10, -12))
	default:
		// Shouldn't get here
		fmt.Println("Invalid inductance unit")
		os.Exit(2)
	}

	if inductance <= 0 || capacitance <= 0 {
		fmt.Println("Both values must be greater than zero")
		os.Exit(2)
	}

	var f float64
	f = calculateValue(float64(capacitance)*cscale, float64(inductance)*lscale)

	fmt.Printf("The resonant frequency is %s\n", stringfrequency(f))

}
