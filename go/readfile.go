package main

import (
    "fmt"
    "io/ioutil"
    "flag"
)

func main() {
    fnPtr := flag.String("file", "test.txt", "The file name")
    flag.Parse();
    fmt.Println("File name:", *fnPtr)
    data, err := ioutil.ReadFile(*fnPtr)
    if err != nil {
        fmt.Println("File reading error", err)
        return
    }
    fmt.Println("Contents of file:", string(data))
}
