structure MyMathLib =
struct
  fun fact x =
    if x = 0
    then 1
    else x * fact (x-1)

val half_pi = Math.pi / 2.0

fun doubler y = y * 2

end

val pi = MyMathLib.half_pi + MyMathLib.half_pi

val twenty_eight = MyMathLib.doubler 14

