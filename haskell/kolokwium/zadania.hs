import Data.List

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

data Score = Score {
  studentId :: Int,
  course1Score :: Int,
  course2Score :: Int,
  course3Score :: Int
}

data StudentWithScores = Int String String Int Int Int deriving (Eq, Show)

-- 4. Dla przykładowych danych students i scores
students :: [Student]
students = [Student 26453 "Kristalee Copperwaite" "2000", Student 33596 "Roeberta Naden" "1997"]
scores :: [Score]
scores = [Score 26453 93 97 80, Score 40241 86 85 87, Score 33596 82 60 80]
-- zdefiniuj funkcję sortującą studentów po dacie urodzenia rosnąco.
sortByDate :: [Student] -> [Student]
sortByDate = 
-- zdefiniuj funkcję sortującą studentów po imieniu i nazwisku urodzenia malejąco.
-- zdefiniuj funkcję sortującą rekordy wyników tak, żeby rekordy były posortowane najpierw po wyniku z pierwszego kursu, a następnie (dla remisów) po id studneta
-- zdefiniuj funkcję sortującą rekordy wyników tak, żeby rekordy z większą sumaryczną ilością punktów były wcześniej od tych z mniejszą sumaryczną ilością punktów