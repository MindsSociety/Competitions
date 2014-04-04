{- 
	Jack Higgins
	Google Code Jam
	Reverse Words example
-}

reverseWords :: String -> [String]
reverseWords = map (tail . concat . reverse . map (' ':) . words) . lines

prependCase :: [String]
prependCase = [concat ["Case #", show n, ": "] | n <- [1..]]

solution :: String -> IO ()
solution = mapM_ putStrLn . (zipWith (++) prependCase) . reverseWords

main :: IO ()
main = do
	uselessInput <- getLine	-- First line is only required in silly imperative languages
	input <- getContents
	solution input