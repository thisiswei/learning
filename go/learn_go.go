package main
import "fmt"

type Person struct {
  Age, Height int
}

var m map[string]Person

func main() {
  m = make(map[string]Person)
  m["wei"] = Person{
    20, 180,
  }
  fmt.Println(m["wei"])
}

var c = map[string]Person{
    "Wei": Person{
      20, 170,
    },
    "Google": Person{
      30, 160,
    },
}

// 39 mutating maps
package main
import (
   "fmt"
   "math"
)
func main() {
  m := make(map[string]int)
  m["wei"] = 19
  fmt.Println("The value: ", m["wei"])
  detele(m, "wei")
  v, ok := m["wei"]
  fmt.Println("v is 0")
}

// 41 function is value too
func main() {
  hypot := func(x, y float64) float64 {
    return math.Sqrt(x*x + y*y)
  }
  fmt.Println(hypot(3, 4))
}

// 42 function closures
func adder() func(int) int {
  sum := 0
  return func(x int) int {
    sum += x
    return sum
  }
}
func main() {
  pos, neg := adder(), adder()
  for i := 0; i < 10; i++ {
    fmt.Println(
        pos(i),
        neg(-2 * i),
    )
  }
}
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

func main() {
  fmt.Print("go runs on ")
  switch os := runtime.GOOS; os{
    case "darwin":
        fmt.Println("OS X.")
    case "linux":
        fmt.Println("Linux.")
    default:
        fmt.Printf("%s.", os)
  }
}

// 45 switch evaluation order

import (
"fmt"
"time"
)
func main() {
  today := time.Now().Weekday()
  switch time.Saturday {
    case today + 0:
        fmt.Println("Today.")
    case today + 1:
        fmt.Println("Tommorow.")
    case today + 2:
        fmt.Println("In two days.")
    default:
        fmt.Println("Too far away.")
  }
}

// 46 switch with on condition

func main() {
  t := time.Now()
  switch {
  case t.Hour() < 12:
      fmt.Println("Good morning")
  case t.Hour() < 17:
      fmt.Println("Good afternoon")
  default:
      fmt.Println("wtf, what time it is")
  }
}

// 47 complex cube roots

func Cbrt(x complex128) complex128 {
}

func main() {
      fmt.Println(Cbrt(2))
}

// 49 Methods
type Veitex struct {
  X, Y float64
}
func (v *Veitex) Abs() float64 {
  return math.Sqrt(v.X * v.X + v.Y * v.Y)
}

func main() {
  v := &Vertex{3, 4}
  fmt.Println(v.Abs())
}

type MyFloat float64

func (f MyFloat) Abs() float64 {
  if f < 0 {
    return float64(-f)
  }
  return float64(f)
}















































































