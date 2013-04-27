data MetricUnit = Meter
                | Liter 
                | KiloGram 
                  deriving (Show, Eq)

data ImperialUnit = Yard
                | Gallon
                | Pound
                  deriving (Show)

data Measurement = MetricUnit

symbol Meter = "m"
symbol Liter = "L"
symbol KiloGram = "kg"


data Point = Point { xval::Double, yval::Double }


data Tree a = Leaf a | node a deriving (Show, Eq)

add (Leaf l) = l
add (Node i right left) = i + (add right) + (add left)
