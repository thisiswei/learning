
import Data.List

--elem takes a thing and a list of things and tells us if that thing is an element of the list. It's usually called as an infix function because it's easier to read that way.
-- 4 `elem` [3,4,5,6] True

--take 24 [13, 26..]--take 24 mutiples of 13
--take 12 (cycle "lol")
--take 10 (repeat 5)
--replicate 10 "i'm awesome"

length' xs = sum [1 | _ <- xs]
removeNonUppercase st = [s | s <-st, s `elem` ['A'..'Z']]
rightTriangles' = [(a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], a ^ 2 + b ^ 2 == c ^ 2, a + b + c == 24]

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"


factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

charName 'a' = "wei"
charName 'w' = "awesome"
charNmae 'b' = "bing"


first (x, _, _) = x
second (_, y, _) = y
third (_, _, z) = z


max' a b
   | a > b = a
   | otherwise = b


initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
     where (f:_) = firstname
           (l:_) = lastname


head' xs = case xs of 
             [] -> error "shit! no head"
             (x:_) -> x

describe xs = "The list is fucking" ++ case xs of [] -> "empty"
                                                  [x] -> "one "
                                                  _ -> "a longer list"

                           -- why is this not working??!!
--maximum' xs = case xs of
--                [] -> error "fucking nothing"
--                [x] -> x
--                x::xss -> max x (maximum' xss)

replicate' n xs = case n of 
                  0 -> []
                  _ -> xs : replicate' (n - 1) xs


reverse' xs = case xs of
                [] -> []
                x:xs' -> reverse' xs' ++ [x]

zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

elem' a [] = False
elem' a (x:xs) 
       | a == x = True
       | otherwise = a `elem'` xs


quicksort [] = []
quicksort (x:xs) = 
        let smaller = quicksort [ a | a <- xs, a <= x]
            bigger  = quicksort [ a | a <- xs, a > x]
        in  smaller ++ [x] ++ bigger

zipwith' _ [] _ = []
zipwith' _ _ [] = []
zipwith' f (x:xs) (y:ys) = f x y : zipwith' f xs ys

--  largestDivisible by 3829
largestDivisible = head (filter p [100000, 99999..])
      where p x = x `mod` 3829 == 0

-- sum (takeWhile (< 10000) (filter odd (map (^2) [1..])))

listOfFun = map(*) [0..]
-- (listOfFun !! 4) 5
--

sum' xs = foldl (\acc x -> acc + x) 0 xs
elem'' y ys = foldl (\acc x -> if x == y then True else acc) False ys


--Whenever you want to traverse a list to return some- thing, chances are you want a fold. 

maximum'' = foldr1 (\x acc -> if x > acc then x else acc)

reverse'' = foldl (\acc x -> x : acc) []

product' = foldl (*)

--scanl and scanr are like foldl and foldr, only they report all the intermediate accumulator states

-- How many elements does it take for the sum of the roots of all natural numbers to exceed 1000?
qes1 = length (takeWhile (<1000) (scanl(+) (map sqrt [1..]))) + 1

-- $ make it right associative
-- f (g (z x)) is equal to f $ g $ z x
-- sum $ map sqrt [1..130]
--  ghci> map ($ 3) [(4+), (10*), (^2), sqrt]
-- [7.0,30.0,9.0,1.7320508075688772]



-- f (g (z x)) is equivalent to (f . g . z) x.

-- map (\x -> negate (abs x)) 
-- map (negate . abs)
-- sum (replicate 5 (max 6.7 8.9) can be rewritten 
-- as (sum . replicate 5 . max 6.7) 8.9
-- fn = ceiling . negate . tan . cos . max 50
-- fn x = ceiling (negate (tan (cos (max 50 x))))

-- sum (takeWhile (< 1000) (filter odd (map (^2) [1..])))
-- sum . takeWhile(<1000) . filter odd . map(^2) $ [1..]


-- If we want to load up the names from several modules inside GHCI, we don't have to do :m + several times, we can just load up several modules at once.
-- ghci> :m + Data.List Data.Map Data.Set
-- import all the functions from Data.List except the nub function:
-- import Data.List hiding (nub)

-- So when we import Data.Map and then call filter, Haskell won't know which function to use. Here's how we solve this:
-- import qualified Data.Map
-- This makes it so that if we want to reference Data.Map's filter function, we have to do Data.Map.fil- ter, whereas just filter still refers to the normal filter we all know and love. But typing out Data.Map in front of every function from that module is kind of tedious. That's why we can rename the qualified import to something shorter:
--  import qualified Data.Map as M


--transpose[[1,2,3],[2,4,5],[4,6,7]] == [[1,2,4], [2, 4, 6], [3, 5, 7]]
--
--concat ["foo", "bar", "car"]
-- concatMap
--
--and $ map (>4) [5, 6..9]  --True
--and $ map (== 4) [4, 4, 2, 3] -- False
--splitAt
-- remove duplication, 
-- nub lst

-- \\ means different from two set.
  -- [1..10] \\ [2, 5, 9] ==> [1, 3, 4, 6, 7, 8]
  --

-- Doing [1..10] \\ [2,5,9] is like doing
-- delete 2 . delete 5 . delete 9 $ [1..10].
-- map digitToInt "124"
--     intToDigit

--  encode shift msg = 
--      let ords = map ord msg
--          shifted = map (+ shift) ords
--      in map chr shifted
--  


phoneBook =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]
    
findKey key xs = snd . head . filter (\(k, v) key == k) $ xs

findKey key [] = Nothing
findKey key ((k, v):xs) = if key == k
                             then Just v
                             else findKey key xs

findKey' key = foldr (\(k, v) acc -> if key == k then just v else acc) Nothing


--findKey "penny" phoneBook 
--Just "853-2492"


import qualified Data.Set as Set


text1 = "I just had an anime dream. Anime... Reality... Are they so different?" 
text2 = "The old man left his garbage can out and now his trash is all over my lawn!"

let set1 = Set.fromList text1
let set2 = Set.fromList text2
Set.difference set1 set2
Set.intersection set1 set2
Set.union set1 set2

Set.fromList [2, 3, 4] `Set.isSubsetOf` Set.fromList [1..5]

Set.map (+1) $ Set.fromList [3,4,5,6,7,2,3,4]
fromList [3,4,5,6,7,8]

data Shape = Circle Float Float Float | Rectangle Float Float Float Float
Float deriving (Show)

surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

data Person = Person String String Int Float String String deriving (Show)
guy = Person "wei" "lu" 43 180.2 "777-00046" "strong"
firstName (Person firstname _ _ _ _) = firstname
lastName (Person lastname _ _ _ _) = lastname


data Person = Person {  firstName :: String
                       , lastName :: String
                       , age :: Int
                       , height :: Float
                       , phoneNumber :: String
                       , flavor :: String
                       } deriving (Show)





























-- excerise 
--
  --1
    -- We're given a list that represents the value of a stock by date. The list is made of tuples whose first component is the stock value, the second is the year, the third is the month and the fourth is the date. We want to know when the stock value first exceeded one thousand dollars!
    -- ghci> let stock = [(994.4,2008,9,1), (995.2,2008,9,2), (999.2,2008,9,3),
    --  (1001.4,2008,9,4), (998.3,2008,9,5)]
    --  ghci> head (dropWhile (\(val,y,m,d) -> val < 1000) stock)
    --  (1001.4,2008,9,4)
-- 2
--
