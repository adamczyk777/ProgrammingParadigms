{-# LANGUAGE ParallelListComp #-}

-- ZIP implementation in haskell
newzip :: [a] -> [b] -> [(a, b)]
newzip [] _ = []
newzip _ [] = []
newzip (a:atail) (b:btail) = (a,b) : zip atail btail

zipcomprehension :: [a] -> [b] -> [(a,b)]
zipcomprehension l1 l2 = [(x, y) | x <- l1 | y <- l2]