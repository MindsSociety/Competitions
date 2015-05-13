import Data.List

getNumbers :: (Num a, Read a) => IO [a]
getNumbers = getContents >>= return . map read . lines

f :: (Enum a, Eq a, Num a) => [a] -> a
f [] = 0
f (x:y:xs)
  | y == succ x = f (y:xs)
  | otherwise = succ x

main = getLine >> getNumbers >>= print . f . sort
