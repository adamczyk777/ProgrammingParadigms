usunDuplikaty :: Eq a => [a] -> [a]
usunDuplikaty [] = []
usunDuplikaty (x:xs) = x: (usunDuplikaty (remove x xs))
    where
        remove :: Int -> [Int] -> [Int]
        remove x [] = []
        remove x (y:ys)
            | x == y = remove x ys
            | otherwise = y:(remove x ys)

