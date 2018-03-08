% fibonacci printing code
fibonacci(0,0).
fibonacci(1,1).
fibonacci(2,1).
fibonacci(Number, Result) :- 
        Number > 2,
        NewNumber is Number - 1,
        fibonacci(NewNumber, NewResult),
        Result is Result + NewResult.
