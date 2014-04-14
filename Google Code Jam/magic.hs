import Control.Monad
solve [a, b] = ["Volunteer cheated!", show $ head xs+0, "Bad magician!"] !! i
  where xs = let g (r, b) = (b !! (r-1)) in filter (`elem` g b) (g a)
        i = (\n -> if n > 2 then 2 else n) $ length xs 
parse = replicateM 2 . liftM2 (,) readLn
      . replicateM 4 $ fmap (map read . words) getLine
display i = fmap ((("Case #" ++ show i ++ ": ") ++) . solve) parse
main = fmap (enumFromTo 1) readLn >>= mapM display >>= mapM_ putStrLn
