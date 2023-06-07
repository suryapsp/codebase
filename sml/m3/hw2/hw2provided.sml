(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(*A*)
fun all_except_option(s1 : string, s2 : string list) =
    case s2 of
        [] => NONE
    |   s::s2' => if same_string(s, s1)
                   then SOME s2'
                   else case all_except_option(s1, s2') of
                        NONE => NONE
                    |   SOME tail => SOME (s::tail)

(*B*)
fun get_substitutions1(lst, s) =
    case lst of
        [] => []
    |   l::lst' => case all_except_option(s, l) of
                    NONE => []
                  | SOME valid_list => valid_list @ get_substitutions1(lst', s)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)