datatype mytype = TwoInts of int * int
                | Str of string
                | Pizza

datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int
datatype exp = Constant of int
             | Negate   of exp
             | Add      of exp * exp
             | Multiply of exp * exp

fun f x = 
    case x of
         Pizza => 3
       | Str s => 8
       | TwoInts(i1, i2) => i1 + i2

fun eval e =
    case e of 
         Constant i        => i
       | Negate   e2       => ~ (eval e2)
       | Add(e1, e2)       => (eval e1) + (eval e2)
       | Multiply(e1, e2)  => (eval e1) * (eval e2)

fun sum_list p = 
    case p of
         [] => 0
       | x::xs' => x + sum_list xs'

fun append (xs, ys) = 
    case xs of 
         [] => ys
       | x::xs' => x::append(xs',ys)

fun zip (lis) =
    case lis of
         ([], [], [])     => []
       | (hd1::tl1, hd2::tl2, hd3::tl3) => (hd1, hd2, hd3) :: zip(tl1, tl2, tl3)
       | _                => []


fun unzip (lis) = 
    case lis of 
         [] => ([], [], [])
       | (a, b, c) :: tl => let val (l1, l2, l3) = unzip tl
                            in
                                (a::l1, b::l2, c::l3)
                            end


fun nondecreasing xs = 
    case xs of
         [] => true
       | x::[] => true
       | head::(neck::rest) => head <= neck
                               andalso nondecreasing (neck::rest)

datatype sng = P | N | Z

fun mulsign (x1, x2) =
    let fun sign x = if x = 0 then Z else if x>0 then P else N
    in 
        case (sign x1, sign x2) of 
             (_, Z) => Z
           | (Z, _) => Z
           | (P, P) => P
           | (N, N) => P
           | _ => N
    end

fun len xs =
    case xs of 
         [] => 0
       | x::xs' => 1 + len xs'

datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Mul of exp * exp

fun eval (Constant i) = i
  | eval (Negate e2) = ~ (eval e2)
  | eval (Add(e1, e2)) = (eval e1) + (eval e2)
  | eval (Mul(e1, e2)) = (eval e1) * (eval e2)

fun append ([], ys) = ys
  | append (x::xs', ys) = x::append(xs', ys)
