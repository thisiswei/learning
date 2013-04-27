guess 42 = "correct"
guess _ = "bullshits"
isPal "" = True
isPal (x:xs) = (x == last xs) && isPal (init xs)
head (x:_) = x
head [] = error "WTF"

guessMyAge x
         | x > 27   = "too hight!"
         | x < 27   = "too low!"
         | True     = "bingo!"


head' xs
     | null xs = error "bitch!"
     | otherwise = xs !! 0

slope (x1, y1) (x2, y2) = let dy = y2 - y1
                              dx = x2 - x1
                          in dy / dx


slope2 (x1, y1) (x2, y2) = dy / dx
                           where dy = y2 - y1
                                 dx = x2 - x1

convert n unit 
        | n "m" = (n*1.09361, "yd")
        | n "L" = (n/0.264172, "gal")
        | n "kg" = (n*2.20462, "lb")
