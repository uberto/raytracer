app "raytracer-challenge"
      packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.7.0/bkGby8jb0tmZYsy2hg1E_B2QrCgcSTxdUlHtETwm5m4.tar.br" }
      imports [pf.Stdout, pf.Task.{ Task }]
    provides [main] to pf

main : Task {} I32
main =
    Stdout.line "Let's RayTrace!"



isVector = \v -> v.w == 0.0
isPoint = \p -> p.w == 1.0

a = {x:4.3, y:-4.2, z:3.1, w:1.0}

expect isVector a == Bool.false

expect isPoint a == Bool.true
