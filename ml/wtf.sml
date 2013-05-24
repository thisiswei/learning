
fun pow (x : int, y : int) = 
    if y = 0
    then x
    else x * pow(x, y-1)

fun cube (x : int) =
    pow(x, 3)

fun swap (pr : int*bool) = 
    (#2 pr, #1 pr)

fun sum_two_pr (pr1: int*int, pr2: int*int) = 
    (#1 pr1) + (#2 pr2) + (#2 pr2) + (#2 pr2)

fun div_mod (x : int, y : int) = 
    (x div y, x mod y)

fun sorted_pr (pr1: int * int) = 
    if (#1 pr1) > (#2 pr1)
    then (#2 pr1, #1 pr1)
    else pr1

fun sum_list (xs : int list) = 
    if null xs
    then 0
    else hd xs + sum_list(tl xs)

fun product_of_list (xs : int list) = 
    if null xs
    then 1
    else hd xs * product_of_list (tl xs)

fun countdown (x : int) =
    if x = 0
    then []
    else x :: countdown(x-1)

fun append (xs : int list, ys : int list) = 
    if null xs
    then ys
    else (hd xs) :: append(tl xs, ys)

fun sum_pr_lst (xs : (int * int) list) = 
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pr_lst(tl xs)

fun firsts (xs : (int * int) list) = 
    if null xs
    then []
    else (#1 (hd xs)) :: firsts(tl xs)


fun silly1 (z : int) = 
    let val x = if z > 0 then z else 34
        val y = x + z + 9
    in
        if x > y then x * 2 else y * y
    end

fun silly2 () = 
    let
        val x = 1
    in 
        (let val x = 2 in x + 1 end) + (let val y = x + 2 in y+2 end)
    end


fun count_from_1 (x : int) =
    let 
        fun count (from : int) =
            if from = x
            then x :: []
            else from :: count(from+1)
    in 
        count 1
    end

fun good_max (xs : int list) = 
    if null xs
    then 0
    else 
        let 
            val ans = good_max(tl xs)
        in
            if (hd xs) > ans
            then hd xs
            else ans
        end

fun best_max (xs : int list) = 
    if null xs
    then None
    else let
            fun max_none_empty (xs : int list) =
                if null (tl xs) 
                then hd xs
                else let val ans = max_none_empty(tl xs)
                     in
                         if (hd xs) > ans
                         then hd xs
                         else ans
                     end
         in
             SOME (max_none_empty xs)
         end


