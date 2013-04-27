map even [1..10]
filter even [1..10]
map (\s -> s ++ "fuck") ["I", "huh", "bitch"]

data Gender = Male | Female deriving (Show, Eq)

let people = [(Male, "Mal"),  (Female, "Zoe"),
             [(Male, "Wahs"),  (Female, "Zzsoe"),
             [(Male, "Jayne"),  (Female, "Zfhoe"),
             [(Male, "haal"),  (Female, "Zodde")]

filter(\(a, b) -> a == Female) people

map snd it

foldl (+) 0 [1, 2, 3]  --6

foldl (\acc n -> if n `elem` "aeiou"
                 then acc + 1
                 else acc) 0 "hello"

scanl (+) 0 [1, 2, 3]  -- [0, 1, 3, 6] intermediate values of a fold

not (even 2) 
not $ even 4
(not.even) 4
(length.last.words) "last man standing"


import Data.List

any (==0) [1,2,0] -- True
concat ["under", "stand", "able"]
sort "hello" -- "ehllo"


import Data.Char

toUpper 'a'
map ord ['a'..'f']
isNumber 'a'

import Data.map

let m = fromList[("I", "can do it myself"),
                 ("this", "sucker dont know me"),
                 ("Confident", "if you dont believe in yourself, who then?")]

keys m -- ["I", "this", "Confident"]
Data.Map.lookup "this" m
-- Just "sucker dont know me"

import Data.Set

let a = fromList [1..58]
let b = fromList [53..100]

intersection a b

findMax $ union a b



strong letters = length letters > 14 
               && any isUpper letters 
               && any isNumber letters 
               && any isLower letters
