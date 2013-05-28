fun filter (f, xs) =
    case xs of 
         [] => []
       | x::xs' => if f x 
                   then x::filter(f, xs')
                   else filter(f, xs')

fun greaterThan x = fn y => y > x
fun noNegatives xs = filter(greaterThan ~1, xs)
fun allGreater (xs,n) = filter(fn x => x > n, xs)


fun fold (f, [], acc) = acc
  | fold (f, x::xs', acc) = fold(f, xs', f(acc, x))

fun f1 xs = fold(fn(x, y) => x + y, xs, 0)

fun f3 (xs,lo,hi) = 
    fold((fn(x,y) => x + (if y >= lo andalso y <= hi then 1 else 0)), xs, 0)

fun f4 (xs,s) = 
    let val i = String.size s
    in
        fold((fn(x,y) => x andalso String.size y < i), xs, true)
    end

fun sqrt_of_abs i = Math.sqrt (Real.fromInt (abs i))
fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs) i



fun exists predicate xs =
    case xs of
         [] => false
       | x::xs' => predicate x andalso exists predicate xs'

fun range(i, j) = if i > j then [] else i :: range(i+1, j)
fun curry f x y = f(x, y)

(*mutations*)

val x = ref 42
val y = ref 42
val z = x
val _ = x := 43
val w = (!y) + (!z) (*85*)
