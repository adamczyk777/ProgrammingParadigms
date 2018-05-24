mojeLiczby = [f x | x <- lista, p x]
             where f = \a -> 2 * a          -- f mnoży liczbę razy 2
                   lista = [1..10]          -- lista początkowa
                   p = \b -> b `mod` 2 == 0 -- p wybiera liczby parzyste
 
mojeLiczby' = map f $ filter p lista
             where f = \a -> 2 * a
                   lista = [1..10]
                   p = \b -> b `mod` 2 == 0