student(szymon, agh).
student(krzysiek, agh).
student(weronika, agh).
student(kasia, agh).
student(szymon, agh).
fajni_studenci :- 
    student(X,agh),
    write(X),
    fail,
    write(' nie jest fajny'),
    !.    
fajni_studenci :- 
    write('oni sa fajni'). 


% Powyższy program nie działą tak jak w założeniu. Popraw jego działanie wstawiając w odpowiednia miejsce klauzulę 'fail'