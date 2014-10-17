-- | Reads all lines of input and returns a list of all lines in Strings.
-- Example Input
--    2
--    Hello
--    World!
--
-- Outputs:
--    ["2", "Hello", "World"]
getLines :: IO [String]
getLines = getContents >>= return . lines

-- | Reads all lines of input and converts them to Numbers.  Numbers are 
-- polymorphic and will be coverted to Ints, Doubles, Floats etc. based on the
-- functions you use.  No need to worry.
-- Example Input:
--		1
--		2
--		4
-- Outputs:
--		[1,2,4]
getNumbers :: (Num a, Read a) => IO [a]
getNumbers = getContents >>= return . map read . lines

-- | Reads all lines and converts them to a 2D List of numbers.  This function 
-- should be used when there are more than one number on a line.
-- Example Input:
--		1 2
-- 		3 4
-- 		5 6
-- Outputs:
-- 		[[1,2], [3,4], [5,6]]
getMultiNums :: (Num a, Read a) => FilePath -> IO [[a]]
getMultiNums file = open file >>= return . map (map read . words) . lines

printLines :: (Show a) => [a] -> IO()
printLines = mapM_ print


{-	Sample Question
		
		Given a list of Strings, reverse each String.

		Input Format
		The first line contains an integer T where T is the number of test cases.
		Each test case contains a single string

		Output
		Print each reversed String line by line.

		Contraints 1 <= T <= 100

		Sample Input
		2
		Hello
		Hi

		Sample Output
		olleH
		iH
-}
main = getLine >> getLines >>= mapM_ putStrLn . map reverse

-- imperative stye
main' = do
	uselessInput <- getLine -- Haskell usually does not need the number of test cases
	xs <- getLines          -- binds the list of inptut to xs
	mapM_ putStrLn $ map reverse xs
