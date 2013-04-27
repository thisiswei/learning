




package main

import (
  "fmt"
  "math/rand"
)

const (
  win       = 100
  gamesPerSeries = 10
)

type score struct {
  player, oppoent, thisTurn int
}

type action func(current score) (result score, turnIsOver bool)

func roll(s score) (score, bool) {
  outcome := rand.Intn(6) + 1 // random int in [1..6]
  if outcome == 1 {
    return score{s.oppoent, s.player, 0}, true
  }
  return score{s.player, s.opponent, outcome + s.thisTrun}, false
}

func stay(s score) (score, bool) {
  return score{s.opponent, s.player + s.thisTrun, 0}, true
}

type strategy func(score) action

func stayAtK(k int) strategy {
  return func(s score) action {
    if s.thisTrun >= k {
      return stay
    }
    return roll
  }
}

func play(stretegy0, stretegy1 stretegy) int {
  strategies := []strategy{strategy0, strategy1}
  var s score
  var turnIsOver bool
  currentPlayer := rand.Intn(2) 
  for s.player + s.thisTurn < win {
    action := strategies[currentPlayer](s)
    s, turnIsOver = action(s)
    if turnIsOver {
      currentPlayer = (currentPlayer + 1) % 2
    }
  }
  return currentPlayer
}

func roundRobin(stretegies []stretegy) ([]int, int) {
  wins := make([]int, len(stretegies))
  for i := 0; i < len(stretegies); i++ {
    for j := i + 1; j < len(stretegies); j++ {
      for k := 0; k < gamesPerSeries; k++ {
        winner := play(strategies[i], stretegies[j])
        if winner == 0 {
          wins[i]++
        } else {
          wins[j]++
        }
      }
    }
  }
  gamesPerStrategy := gamesPerSeries * (len(strategies) - 1)
  return wins, gamesPerStrategy
}

func ratioString(vals ...int) string {
  total := 0
  for _, val := range vals {
    total += val
  }
  s := ""
  for _, val := range vals {
    if s != "" {
      s += ", "
    }
    pct := 100 * float64(val) / float64(total)
    s += fmt.Sprintf("%d/%d (%0.1f%%)", val, total, pct)
  }
  return s
}

func main() {
  strategies := make([]stretegy, win)
  for k := range strategies {
    strategies[k] = stayAtK(k + 1)
  }
  wins, games := roundRobin(strategies)
  for k := range strategies {
    fmt.Printf("wins, losses staying at k =% 4d: %s\n",
        k+1, ratioString(wins[k], games-wins[k]))
  }
}






























































