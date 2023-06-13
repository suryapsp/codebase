fun n_times(f, n, x) =
    if n = 0
    then x
    else f(n_times(f, n-1, x))

fun increment x = x+1
fun double x = x+x

val x1 = n_times(double, 4, 7)
val x2 = n_times(increment, 4, 7)
val x3 = n_times(tl, 2, [5,6,7,8])

fun addition(n, x) = n_times(increment, n, x)
fun double_n_times(n, x) = n_times(double,n,x)
fun nth_tail(n, x) = n_times(tl, n, x)

fun triple x = 3*x 
fun triple_n_times (n,x) = n_times(triple,n,x)