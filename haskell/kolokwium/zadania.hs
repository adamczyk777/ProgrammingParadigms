import Data.List
import Data.Maybe
-------------------------------------------------------------------------------
-- 1. Mamy dane typy danych:
-- data Student = Student {id :: Int, name :: String, dateOfBirth :: String}
-- data Score = Score {studentId :: Int, course1Score :: Int,
-- course2Score :: Int, course3Score :: Int}
-- Zdefiniuj typ StudentWithScores który będzie posiadał pola takie jak w typie danych Student 
-- i takie jak w typie danych Score (bez powtórzenia id). Uwaga na konflikt nazw w module! Jak można rozwiązać problem nazw?

data Student = Student {
    id :: Int, 
    name :: String, 
    dateOfBirth :: String
}

instance Show Student where
    show (Student id name date) = "----------------------" ++ "\nName: "++ name ++ "\nYear of birth: " ++ date ++"\nID: " ++ (show id) ++ "\n----------------------"

instance Eq Student where
    a == b = Main.id a == Main.id b

data Score = Score {
    studentId :: Int,
    course1Score :: Int,
    course2Score :: Int,
    course3Score :: Int
}

instance Eq Score where
    a == b = studentId a == studentId b

instance Show Score where
    show (Score id a b c) = "----------------------" ++ "\nID: " ++ (show id) ++ "\nScore 1: " ++ (show a) ++ "\nScore 2: " ++ (show b) ++ "\nScore 3: " ++ (show c) ++ "\n----------------------"


data StudentWithScores = StudentWithScores Int String String Int Int Int deriving (Eq, Show)

-------------------------------------------------------------------------------
-- 4. Dla przykładowych danych students i scores
students :: [Student]
students = [Student 26453 "Kristalee Copperwaite" "2000", Student 33596 "Roeberta Naden" "1997", Student 35000 "Jakub Adamczyk" "1997"]
scores :: [Score]
scores = [Score 26453 93 97 80, Score 29970 93 96 80, Score 40241 86 85 87, Score 33596 82 60 80]

-- zdefiniuj funkcję sortującą studentów po dacie urodzenia rosnąco.
sortByDate :: [Student] -> [Student]
sortByDate = sortBy compareYears
    where compareYears (Student _ _ date1) (Student _ _ date2) = compare (read date1 :: Int) (read date2 :: Int)


-- zdefiniuj funkcję sortującą studentów po imieniu i nazwisku urodzenia malejąco.
sortByName :: [Student] -> [Student]
sortByName = sortBy compareNames
    where compareNames (Student _ name1 _) (Student _ name2 _) = compare name1 name2


-- zdefiniuj funkcję sortującą rekordy wyników tak, żeby rekordy były posortowane najpierw po wyniku z pierwszego kursu, 
-- a następnie (dla remisów) po id studneta
sortByScores :: [Score] -> [Score]
sortByScores = sortBy compare_
    where compare_ (Score _ scoreA1 scoreB1 _) (Score _ scoreA2 scoreB2 _)
            | scoreA1 == scoreA2 = compare scoreB1 scoreB2
            | otherwise = compare scoreA1 scoreA2


-- zdefiniuj funkcję sortującą rekordy wyników tak, żeby rekordy z większą sumaryczną ilością punktów były wcześniej od tych z mniejszą sumaryczną ilością punktów
sortByScoresSum :: [Score] -> [Score]
sortByScoresSum = sortBy compareSum
    where compareSum (Score _ a1 b1 c1) (Score _ a2 b2 c2) = compare (a1 + b1 + c1) (a2 + b2 + c2)

-------------------------------------------------------------------------------
-- 5. Zdefiniuj fukcję o sygnaturze
toStudentWithScores :: Student -> Score -> Maybe StudentWithScores
-- która zwróci połączony rekord studenta z jego wynikami, 
-- jeśli studentId jest równe id a Nothing w przeciwnym wypadku

toStudentWithScores (Student id name date) (Score studentId sc1 sc2 sc3)
    | studentId == id = Just $ StudentWithScores id name date sc1 sc2 sc3
    | otherwise = Nothing

-------------------------------------------------------------------------------
--6. Zdefinuj funkcję o sygnatrzue 
findById :: [Score] -> Int -> [Score] 
-- która ma za zadnie zwrócić wyniki dla studenta o zadanym id (drugi parametr) 
-- przy użyciu funkcji filter
findById arr targetId = filter (\x -> studentId x == targetId) arr

-------------------------------------------------------------------------------
-- 7. Jeśli zdefinujemy funkcję 
-- findBy f scrs = filter f scrs 
-- to jaką sygnaturę będzie miała ta funkcja, jeśli scrs to [Score]?
findBy :: (Score -> Bool) -> [Score] -> [Score]
findBy f scrs = filter f scrs 

-------------------------------------------------------------------------------
-- 8. Jeśli zdefinujemy funkcję 
-- mapBy f scrs = map f scrs 
-- to jaką sygnaturę będzie miała ta funkcja, jeśli scrs to [Score]?
mapBy :: (Score -> t) -> [Score] -> [t]
mapBy f scrs = map f scrs

-------------------------------------------------------------------------------
-- 9. Jeśli zdefinujemy funkcję 
-- reduceBy f scrs = foldl f [] scrs 
-- to jaką sygnaturę będzie miała ta funkcja, jeśli scrs to [Score]?
reduceBy :: ([t] -> Score -> [t]) -> [Score] -> [t]
reduceBy f scrs = foldl f [] scrs

-------------------------------------------------------------------------------
-- 10. Przy użyciu funkcji map zdefinuj funkcję o sygnaturze
mapToJoin :: Student -> [Score] -> [Maybe StudentWithScores]
-- Wykorzystaj już zdefiniwane wcześniej funkcje
mapToJoin s scores = map (toStudentWithScores s) scores 

-------------------------------------------------------------------------------
-- 11. Zdefiniuj funkcję 
joinStep1 :: [Student] -> [Score] -> [(Student, [Score])]
joinStep1 students scores = map (\student -> (student, findById scores (Main.id student))) students

-------------------------------------------------------------------------------
-- 12. Zdefiniuj funkcję 
joinStep2 :: [(Student, [Score])] -> [[Maybe StudentWithScores]]
joinStep2 studentScoresTuples = map (\el -> mapToJoin (fst el) (snd el)) studentScoresTuples

-------------------------------------------------------------------------------
-- 15. Zdefiniuj klasę Id która rozszerza klasę Ord i zawiera pojedyncza metodę toInt konwertującą daną implementację na typ Int
-- class Id

-------------------------------------------------------------------------------
-- 16. Zdefiniuj klasę HasId zawiera pojedyncza metodę getId konwertującą daną implementację na dane typu Id


-------------------------------------------------------------------------------
-- 17. Zdefiniuj klasę Repository zawierające operacje insert, delete, get, update i count. insert pobiera element implementujący 
-- HasId i implementacje repozytorium i zwraca nowe repozytorium. delete pobiera id należące do klasy Id i implementacje repozytorium
-- i zwraca nowe repozytorium get pobiera id należące do klasy Id i implementacje repozytorium i zwraca Maybe element należący do klasy HasId. 
-- update pobiera id należące do klasy Id, element implementujący HasId i implementacje repozytorium i zwraca nowe repozytorium. 
-- count pobierające implementacje repozytorium i zwraca Int

-------------------------------------------------------------------------------
-- 18. Zdefiniuj typ InMemoryRepository który posiada jedno pole typu Map key value i należy do klasy Repository
-- insert :: Ord k => k -> a -> Map k a -> Map k a
-- Data.Map.delete :: Ord k => k -> Map k a -> Map k a
-- Data.Map.alter :: Ord k => (Maybe a -> Maybe a) -> k -> Map k a -> Map k a
-- Data.Map.lookup :: Ord k => k -> Map k a -> Maybe a
-- Data.Map.size :: Map k a -> Int


-------------------------------------------------------------------------------
-- 19. Jak wygląda definicja instacji dla klasy Applicative, Functor i Monad dla typu danych Maybe

-- class Functor (f :: * -> *) where
    --  fmap :: (a -> b) -> f a -> f b
    --  (<$) :: a -> f b -> f a
    --  {-# MINIMAL fmap #-}
--    class Functor f => Applicative (f :: * -> *) where
    --  pure :: a -> f a
    --  (<*>) :: f (a -> b) -> f a -> f b
    --  (*>) :: f a -> f b -> f b
    --  (<*) :: f a -> f b -> f a
    --  {-# MINIMAL pure, (<*>) #-}
--    class Applicative m => Monad (m :: * -> *) where
    --  (>>=) :: m a -> (a -> m b) -> m b
    --  (>>) :: m a -> m b -> m b
    --  return :: a -> m a
    --  fail :: String -> m a
    --  {-# MINIMAL (>>=) #-}

-------------------------------------------------------------------------------
-- 20. napisz program typu hello world wczytujący imię ze standardowego wejścia i wypisujący na standar-
-- dowe wyjście to imie kapitalikami + hello a pozniej goodbye + to imie w odwroconej kolejnosci