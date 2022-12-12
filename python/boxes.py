#!/usr/bin/python3
import os
import sys

class Box:
    def __init__(self, l, w, h):
        self.length = l
        self.width = w
        self.hight = h
    def get_volume(self):
        return self.width * self.length * self.hight
    def __str__(self):
        str = f"A box with length {self.length}, width {self.width} and hight {self.hight}"
        return(str)

class ColouredBox(Box):
    def __init__(self, l, w, h, c):
        Box.__init__(self,l,w,h)
        self.colour = c
    def set_colour(self, c):
        self.colour = c
    def get_colour(self):
        return self.colour
    def __str__(self):
        str = f"A {self.colour} box with length {self.length}, width {self.width} and hight {self.hight}"
        return(str)

def main():
    box1 = Box(2,3,4)
    print(box1)
    print("My box has a volume ", box1.get_volume())

    box2 = ColouredBox(3,4,5,"Blue")
    print(box2)
    print("My ", box2.get_colour(), " box has a volume ", box2.get_volume())

if __name__ == "__main__":
     main()
