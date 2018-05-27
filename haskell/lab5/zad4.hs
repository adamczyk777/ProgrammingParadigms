{-
Zaimplementuj drzewo binarne umożliwiające przechowywanie dowolnych typów, tak aby dało sie stworzyć je w następujący sposób:

    myTree :: Tree Int
    myTree = Node 1 (Node 2 Empty (Node 3 Empty Empty)) (Node 4 Empty Empty)
leaves ( zwracającą listę liści )
nnodes (podającą ilość węzłów)
-}

data Tree a = Empty | Node a (Tree a) (Tree a) deriving Show

myTree :: Tree Int
myTree = Node 1 (Node 2 Empty (Node 3 Empty Empty)) (Node 4 Empty Empty)

--empty (sprawdzanie czy drzewo jest puste)
empty :: (Ord a) => Tree a -> Bool
empty Empty = True
empty  _  = False

--insert (wstawienie elementu)
insert :: (Ord a) => Tree a -> a -> Tree a
insert Empty x = Node x Empty Empty
insert (Node v t1 t2) x 
        | v == x = Node v t1 t2
        | v  < x = Node v t1 (insert t2 x)
        | v  > x = Node v (insert t1 x) t2

--search (sprawdzanie czy element jest w drzewie) 
search :: (Ord a) => (Tree a) -> a -> Bool
search Empty _ = False
search (Node v t1 t2) x 
        | x == v = True
        | x  < v = search t1 x 
        | x  > v = search t2 x
        
-- przejście drzewa inorder i zwrocenie tablicy wartosci w takiej kolejnosci
inorder :: (Ord a) => Tree a -> [a]
inorder Empty = []
inorder (Node v t1 t2) = inorder t1 ++ [v] ++ inorder t2