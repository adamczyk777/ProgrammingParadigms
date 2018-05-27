
data Osoba = Osoba {
    imie:: String, 
    nazwisko:: String, 
    pesel:: String
    } deriving (Show)
    
instance Eq Osoba where
    a == b = pesel a == pesel b

instance Ord Osoba where
    compare a b = compare (pesel a) (pesel b)
