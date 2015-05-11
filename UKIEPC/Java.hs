#!/usr/bin/env runhaskell

module Java where

  -- | Creates ugly Java boilerplate stuff
  boilerPlate :: String -> IO ()
  boilerPlate file = putStrLn $ "import java.util.Scanner;\n\n"
    ++ "public class " ++ file ++ " {\n"
    ++ "\tpublic static void main (String [] args) {\n"
    ++ "\t\tScanner scan = new Scanner(System.in);\n"
    ++ "\t\tint n = scan.nextInt();\n"

  -- | Closing braces for Java class
  closeClass :: IO ()
  closeClass = putStrLn "\t}\n}"

  -- | Takes a function that takes an int and returns anything
  -- It evaluates the function and returns a Java print station.
  tojava :: Show a => (Integer -> a) -> Integer -> String
  tojava f n = concat ["\t\tif (n == ", show n, ") {System.out.println(\"", show $ f n, "\");}"]

  -- | Maps toJava to a list of Integers and prints line by line.
  java :: Show a => (Integer -> a) -> [Integer] -> IO ()
  java f = mapM_ putStrLn . map (tojava f)

  -- | Example function
  -- Returns x to the power of 2
  example :: Integer -> Integer
  example x = 2^x

  main :: IO ()
  main = boilerPlate "HaskellToJavaExample" >> java example [1..25] >> closeClass

