(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_exception (_, []) = []
  | all_exception (s, x::xs') = if same_string(s, x) then xs' else
      let val rest = all_exception(s, xs')
      in 
          case rest of
               [] => []
             | _ => x::rest
      end

fun all_exception_option p =
    case (all_exception p) of
         [] => NONE
       | lst => SOME lst



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
