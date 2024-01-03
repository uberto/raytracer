app "raytracer-challenge"
      packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.7.0/bkGby8jb0tmZYsy2hg1E_B2QrCgcSTxdUlHtETwm5m4.tar.br" }
      imports [pf.Stdout, pf.Task.{ Task }]
    provides [main] to pf

main : Task {} I32
main =
    Stdout.line "Let's RayTrace!"



isVector = \t -> t.w == 0.0
isPoint = \t -> t.w == 1.0

#A tuple with w=1.0 is a point
a = {x:4.3, y:-4.2, z:3.1, w:1.0}

expect a.x == 4.3
expect a.y == -4.2
expect a.z == 3.1
expect isVector a == Bool.false
expect isPoint a == Bool.true

#A tuple with w=0 is a vector
b = {x:4.3, y: -4.2, z: 3.1, w: 0.0}

expect isVector b == Bool.true
expect isPoint b == Bool.false

point = \x,y,z -> {x:x, y:y, z:z, w:1}
vector = \x,y,z -> {x:x, y:y, z:z, w:0}

#point() creates tuples with w=1
p = point 4 -4 3

expect p == {x:4, y:-4, z:3, w:1}

#vector() creates tuples with w=0
v = vector 4 -4 3

expect v == {x:4, y:-4, z:3, w:0}

