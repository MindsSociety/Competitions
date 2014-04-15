(diff, rep) = (\[a,b] -> filter (`elem` b) a, \i -> flip mapM [1..i] . const)
ans x = ("Volunteer cheated!":head x:repeat "Bad magician!") !! length x
parse = readLn >>= (\r -> fmap (!!pred r) $ rep 4 (fmap words getLine))
out i = fmap ((("Case #" ++ show i ++ ": ") ++) . ans . diff) (rep 2 parse)
main = fmap (enumFromTo 1) readLn >>= mapM out >>= mapM_ putStrLn
