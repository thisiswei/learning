

package main

import "code.google.com/p/go-tour/pic"



func Pic(dx, dy int) [][]uint8 {

	rv := make([][]uint8, dx)
	for x:=0; x<dx; x++{
		rv[x] = make([]uint8, dy) 
		for y:=0; y<dy; y++{
			rv[x][y] = uint8((x+y)/2);
		}
	}
	return rv;
}

func main() {
	pic.Show(Pic)
}
