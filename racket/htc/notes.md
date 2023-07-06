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

# Constant Definitons
```
to form a constant definiton:
    (define <name> <expression>)

    example = (define WIDTH 400)
              (define HEIGHT 600)
```

# Function Definition

defining a function definition:
```
(define (<name-of-function> <name-of-argument>...)
   <expression>)

(define (bulb c)
  (circle 20 "solid" c))
```

# If Expression
to form an if expression:
```
(if <expression1>
    <expression2>
    <expression3>)
```
expression1 = question(must produce boolean)

expression2 = true answer

expression3 = false answer
