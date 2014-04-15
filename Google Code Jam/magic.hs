import Control.Monad
solve [a,b] = ("Volunteer cheated!":head l:repeat "Bad magician!") !! length l
  where l = let g (r,b) = (b !! (r-1)) in filter (`elem` g b) (g a)
parse = replicateM 2 . liftM2 (,) readLn . replicateM 4 $ fmap words getLine
display i = fmap ((("Case #" ++ show i ++ ": ") ++) . solve) parse
main = fmap (enumFromTo 1) readLn >>= mapM display >>= mapM_ putStrLn
