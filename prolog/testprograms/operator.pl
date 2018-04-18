% Napisać operator o priorytecie 80, który będzie robił tak, że będzie działało sokrates jest czlowiek zamiast jest(czlowiek,sokrates) , jest to ten operator.
:- op(80,xfx,jest).

:- op(90,xfy,ma).

kuba ma batona.
batona ma czekolade.