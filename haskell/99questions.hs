myLast [x] = x
myLast (_:xs) = myLast xs

myLast' = head . reverse
-- x !! (length x - 1)


myButLast = head . tail. reverse 
myButLast' x = reverse x !! 1
myButLast'' :: [a] -> a
myButLast'' = last . init


elementAt lst index = lst !! index - 1
elementAt' (x:_) 1 = x
elementAt' (x:xs) n = elementAt' xs (n - 1)

myLength [] = 0
myLength (_:xs) = 1 + myLength xs
myLength' lst = myLengthAcc lst 0
  where 
        myLengthAcc [] n = n
        myLengthAcc (_:xs) n = myLengthAcc xs (n+1)
myLength'' = sum . map (\ _ -> 1)


myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

reverse list = reverse' list []
   where 
     reverse' [] reversed = reversed
     reverse' (x:xs) reversed = reverse' xs (x:reversed)

-- 6
isPalindrome x = x == (reverse x)

data NestedList a = Elem a | List [NestedList a]
my-flatten (Elem a) = [a]
my-flatten (List x) = concatMap flatten x

-- 7
compress = map head . group
