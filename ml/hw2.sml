(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_exception (_, []) = []
  | all_exception (s, x::xs') = if s = x then xs' else
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

fun get_substitutions1 (lsts, s) =
    case lsts of 
         [] => []
       | hd::rest => case all_exception(s, hd) of
                         [] => get_substitutions1(rest, s)
                       | lst => lst @ get_substitutions1(rest, s)

fun get_substitutions2 (lsts, s) =
    let fun helper (ls, acc) =
            case ls of 
                 [] => acc
               | hd::rest => helper(rest, acc @ all_exception(s, hd))
    in
        helper (lsts, [])
    end

fun similar_names (lsts, names) =
    let val {first=f, last=l, middle=m} = names
    in
        let fun helper (lst) =
                case lst of 
                     [] => [names]
                   | hd::rest => helper rest @ [{first=hd, last=l, middle=m}]
        in helper(get_substitutions2(lsts, f)) end
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color c =
    case c of
         (Spades, _) => Black
       | (Clubs, _) => Black
       | _ => Red

fun card_value c =
    case c of
         (_, Num i) => i
       | (_, Ace) => 11
       | _ => 10

fun remove_card (cs, c, e) =
    case all_exception (c, cs) of
         [] => raise e
       | lst => lst 

fun all_same_color c =
    case c of
         (c'::c2::rest) => card_color c' = card_color c2 andalso all_same_color (c2::rest)
       | _ => true

fun sum_cards cs = 
    let fun helper (c, acc) =
            case c of 
                 [] => acc
               | c1::rest => helper (rest, card_value c1 + acc)
    in helper(cs, 0) end

fun score (cs, goal) = 
    let val s = sum_cards cs
        val ps = if s > goal then 3 * (s - goal) else goal - s
    in
        case all_same_color cs of
             true => ps div 2
           | _    => ps
    end

fun officiate (cs, moves, goal) =
    let fun helper (held, moves, cs, s) =
            case (moves, cs, sum_cards held > goal) of
                 ([], _, _) => s
               | (_, _, true) => s
               | (Draw::m', [], false) => s
               | (Draw::m', c1::c2, _) => helper(c1::held, m', c2, score(c1::held, goal))
               | (Discard c :: m', cs, false) =>
                       let val left_cards = remove_card(held, c, IllegalMove)
                       in
                           helper(left_cards, m', cs, score(left_cards, goal))
                       end
    in 
        helper([], moves, cs, 0)
    end



                                       
