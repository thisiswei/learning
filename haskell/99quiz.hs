import Data.List
-- 1. find the last elem in the list

myLast [x] = x
myLast (_:xs) = myLast xs

-- head . reverse

-- 2. last but one elem 
    
myButLast = last . init
--myButLast (x:y:[]) = x
--myButLast (x:y:ys) = myButLast (y:ys)
-- myButLast x = x !! (length x - 2)

-- 3. Find the K'th elem of a list., the first elem is number 1

elemAt (x:_) 1 = x
elemAt (_:xs) n = elemAt xs (n-1)

-- 4. find number of elems of a list

myLength [] = 0
myLength (_:xs) = 1 + myLength xs

-- 5. reverse a list

myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]

-- 6. is palindrome

isPalindrome x = reverse x == x

-- 7. flatten a nested list structure



-- 8. elimite consecutive duplicates of list elements.

compress [] = []
compress [x] = [x]
compress (x:y:ys) = if x == y then compress (y:ys) else x : compress (y:ys)

-- 9. pack consecutive duplicates of list elem into sublists.

--pack [] = []
--pack [x] = [[x]]
--pack (x:y:ys) = if x == y then [(x:y)] ++ pack ys else [[x]] ++ pack (y::ys)

pack [] = []
pack (x:xs) = let (first, rest) = span (==x) xs
              in  (x:first) : pack rest

-- 10. add length to pack

encode :: Eq a => [a] -> [(Int, a)]
encode = map (\x -> (length x, head x)) . group


-- 11.

-- encodeModified = map (\(x,y) -> if x == 1 then y else (x, y)) . encode 


-- 14. duplicate the elems of a list

dupli []= []
dupli [x]= [x, x]
dupli (x:xs) = x:x : dupli xs

-- 15. duplicate n times

repli xs n = concatMap (replicate n) xs

-- 16. drop every N'th elems from a list

dropEvery xs n = helper xs n 
    where helper [] _ = []
          helper (_:xs) 1 = helper xs n
          helper (x:xs) n = x : helper xs (n-1)

-- 17. split the list into two parts, the length of the first part is given.

split (x:xs) n | n > 0 = let (f, l) = split xs (n-1) in (x : f, l)
split xs _ = ([], xs)

-- 18. extract a slice form a list

--slice [] _ _ = []
--slice xs a b = helper xs a b []
--    where helper xs a b res = if a >= b then res else 

slice xs a b | a>0 = take (b-a+1) $ drop (a-1) xs

-- 19. rotate a list N places to the left

rotate xs 0 = xs
rotate xs n | n>0         = drop n xs ++ take n xs
            | otherwise   = let l = ((length xs) + n) in 
                            drop l xs ++ take l xs

-- 20. remove the K'th elem from a list

removeAt 1 (x:xs) = (x, xs)
removeAt n (x:xs) = (l, x:r)
         where (l, r) = removeAt (n-1) xs




