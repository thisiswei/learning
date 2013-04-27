rev xs = last xs : rev (init xs)
rev2 xs = rev (tail xs) ++ [head xs]
rev3 (x:xs) = reverse xs ++ [x]
let a = ["bitch", "fatAss", "I can do it myself"]
["fuck" ++ x | x <- ["bitch", "fatAss", "I can do it myself"] ]
[ x | x <- a, length x > 10]
[ x | x <- [2..10], 10 `mod` x == 0]
[team ++ " " ++ player | team <- ["red", "green"], player <- ["wei", "lu", "bing"]]

[ (n, even n) | n <- [1..4] ]
[ (a, b, c) | c<-[1..10], b<-[1..c], a<-[1..b], a^2 + b^2 == c^2]

facA n = if n == 0 then 1 else n * facA (n - 1)
facB n = product [1..n]
