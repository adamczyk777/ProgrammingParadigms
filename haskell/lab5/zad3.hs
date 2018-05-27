--Zaimplementuj funkcję, która będzie wykonywać pewien predykat na elementach listy i w przypadku gdy predykat zwróci True,
--funkcja zwróci dany element listy, lub Nothing jeśli predykat nie zakończy się True na żadnym z elementów listy.. 
--Np możesz użyć predykatu porównującego osoby po peselu co umożliwi wyszukiwanie pierwszej osoby w liście o danym peselu.

find :: (a -> Bool) -> [a] -> Maybe a
find fun arr =
