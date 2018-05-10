fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

sign :: Double -> Double
sign x | x > 0  = 1
       | x == 0 = 0
       | x < 0 = -1

sum2a :: (Int, Int) -> Int
sum2a (m, n) = m + n

sum2b :: [Int] -> Int
sum2b (m:n:_) = m + n

sum2c :: Int -> Int -> Int
sum2c m n = m + n