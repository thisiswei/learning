import Control.Mond
module Main where
main = do 
  putStrLn "I am gonna fucking do it no matter what, you know why?"
  answer <- getLine
  putStrLn (if answer == "confident"
            then "You the best"
            else "Motherfucker, You can do it")


shit = do
  putStrLn " you the best ?"
  ans <- getLine
  if ans /= "y" then do
    putStrLn "not quitting"
    shit
  else return ()


another = do
  putStrLn "keep your heads up!"
  ans <- getLine
  when (ans /= "yessir") $ do
    putStrLn "I said keep your heads up!!"
    another


sequence [getLine, getLine]


cal = interact countChars
countChars :: String -> String
countChars str = 
    let allLines = lines str
        lengths = map (show.length) allLines
    in unlines lengths
