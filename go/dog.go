package main

import "fmt"

type dog struct {
	name, breed string
	age         int
}

// We pass dog by value because we are NOT updating dog
func (d dog) toString() string {
	return d.name + " the " + fmt.Sprintf("%d", d.age) + " year old " + d.breed
}

// We pass dog by reference because we ARE updating dog
func (d *dog) birthday() {
	d.age++
}

func main() {
	d1 := dog{name: "Happy", breed: "Beagle", age: 6}
	fmt.Println(d1.toString())
	d1.birthday()
	fmt.Println(d1.toString())
}
