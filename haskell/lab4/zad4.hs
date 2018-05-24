policzISumuj :: (Int -> Int) -> Int -> Int -> Int

policzISumuj = \fun start end -> foldl (+) 0 $ map fun [start..end]