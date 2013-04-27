import Data.Char
zipTogether xs ys = (head xs, head ys) : (zipTogether (tail xs) (tail ys))
zipTogether2 (x:xs) (y:ys) = (x, y) : (zipTogether2 xs ys)

cipher []_ = []
cipher (x:xs) n = (rotate x n) : (cipher xs n)

cipher2 []_ = []
cipher2 (x:xs) n = (rotate x n) : (cipher xs n)

rotate c 0 = c
rotate c n = rotate (next c) (n-1)

next c = if c == 'z' then 'a' else succ c 

rotate2 c 0 = c
rotate2 c n = chr(97 + (ord c + n - 97) `mod` 26)
-- solution 2



