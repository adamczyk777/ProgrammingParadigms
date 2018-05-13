sumOfDigits :: Int -> Int
sumOfDigits 0 = 0
sumOfDigits x = (x `mod` 10) + sumOfDigits (x `div` 10)

supernumber :: Int -> Int
supernumber x   | x >= 0 && x < 10 = x
                | x >= 10 = supernumber (sumOfDigits x)
                | x < 0 = -1