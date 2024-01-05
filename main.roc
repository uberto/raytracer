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

tuple = \x,y,z,w -> {x,y,z,w}

expect a.x == 4.3
expect a.y == -4.2
expect a.z == 3.1
expect isVector a == Bool.false
expect isPoint a == Bool.true

#A tuple with w=0 is a vector
b = {x:4.3, y: -4.2, z: 3.1, w: 0.0}

expect isVector b == Bool.true
expect isPoint b == Bool.false

point = \x,y,z -> {x, y, z, w:1}
vector = \x,y,z -> {x, y, z, w:0}

#point() creates tuples with w=1
p = point 4 -4 3

expect p == {x:4, y:-4, z:3, w:1}

#vector() creates tuples with w=0
v = vector 4 -4 3

expect v == {x:4, y:-4, z:3, w:0}


add = \x1, x2 -> {x:x1.x+x2.x, y:x1.y+x2.y, z:x1.z+x2.z, w:x1.w+x2.w}
sub = \x1, x2 -> {x:x1.x-x2.x, y:x1.y-x2.y, z:x1.z-x2.z, w:x1.w-x2.w}
neg = \x1 -> {x: -x1.x, y:-x1.y, z:-x1.z, w:-x1.w}


#Adding two tuples
a1 = point 3 -2 5
a2 = vector -2 3 1
expect add a1 a2 == point 1 1 6

#Subtracting two points
p1 = point 3 2 1
p2 = point 5 6 7
expect sub p1 p2 == vector -2 -4 -6


#Subtracting a vector from a point
expect sub p v == point 0 0 0

#Negating a tuple
expect neg p1 == {x:-3, y:-2, z:-1, w:-1}

mul = \t1, x -> {x:t1.x * x, y:t1.y * x, z:t1.z * x, w:t1.w * x}
div = \t1, x -> {x:t1.x / x, y:t1.y / x, z:t1.z / x, w:t1.w / x}

# Multiplying a tuple by a scalar
expect mul  {x:1, y:-2, z:3, w:-4} 3.5 == {x:3.5, y:-7, z:10.5, w:-14}

# Multiplying a tuple by a fraction
expect mul (tuple 1 -2 3 -4) 0.5  == (tuple 0.5 -1 1.5 -2)

# Dividing a tuple by a scalar
expect div (tuple 1 -2 3 -4) 2 == (tuple 0.5 -1 1.5 -2)

magnitude = \t1 ->  t1.x * t1.x + t1.y * t1.y + t1.z * t1.z # should be sqrt!!!

# Computing the magnitude of vector(1, 0, 0)
expect magnitude (vector 1 0 0) == 1

# Computing the magnitude of (vector 0, 1, 0)
expect magnitude (vector 0 1 0) == 1

# Computing the magnitude of (vector 0, 0, 1)
expect magnitude (vector 0 0 1) == 1

# Computing the magnitude of (vector 2, 3, 6)
expect magnitude (vector 2 3 6) == 49 #!!! 7

# gotcha so far:
# why not? isVector = .w == 0.0
# why local vars go into scope of above fun definitions? just avoiding name confusion?
# expectation failed doesn't show the diff
# no infix, right? no operators? no Haskell $, right?
# can I expand Num (for complex?)
# is opaque type same as data classes with all private?
