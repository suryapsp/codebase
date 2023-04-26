# Expressions

to form an expression

    (<primitive> <expression>...)
    (+ 2 4)


# Evaluation

`(+ 2 (* 3 4) (- (+ 1 2) 3))`

here + is a primitive call

`+` = operator

2 | (*3 4) | (- (+ 1 2) 3) = operands

to evaluate a primitive call:

    1. first reduce operands to values
    2. then apply primitve to the values
