fun only_capitals s =
    List.filter (fn x => Char.isUpper(String.sub (x, 0))) s

fun longest_string1 xs =
    foldl (fn (x,y) => if String.size x >= String.size y then x else y) "" xs

fun longest_string2 xs =
    foldl (fn (x,y) => if String.size x > String.size y then x else y) "" xs

val longest_capitalized = longest_string2 o only_capitals 

val rev_string = implode o rev o explode


exception NoAnswer
fun first_answer a [] = raise NoAnswer
  | first_answer a (x::xs) = case (a x) of
                                  SOME v => v
                                | _ => first_answer a xs

fun all_answers a [] = SOME []
  | all_answers a (x::xs) = let fun helper a (x::xs) = 
                                    case (a x) of 
                                       NONE => raise NoAnswer 
                                     | SOME lst => lst @ (helper a xs)
                            in
                                SOME(helper a (x::xs)) handle NoAnswer => NONE
                            end

    
