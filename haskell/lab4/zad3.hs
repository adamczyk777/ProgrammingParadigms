reverse' :: String -> String

reverse' = \input -> foldl (\acc el -> el:acc) "" input