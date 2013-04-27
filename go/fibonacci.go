package main
import "fmt"

func fibonacci() func() int {
  current, after := 0, 1
  return func() int{
    current, after := after, current + after
    return current
  }
}
func main() {
  f := fibonacci()
  for i := 0; i < 10; i++ {
    fmt.Println(f())
  }
}
