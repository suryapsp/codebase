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

(*C*)
fun get_substitutions2 (lst, s) =
  let
    fun extract(opt) =
        case opt of
            NONE => []
          | SOME sublist => sublist 

    fun helper(lst, s, acc) =
        case lst of
            [] => acc
          | l::lst' => helper(lst', s, acc @ extract(all_except_option(s, l)))  
  in
    helper(lst, s, [])
  end

(*D*)
fun similar_names(lst, name) =
    let
      fun helper(lst, name) =
        case lst of
            [] => []
          | l::lst' => case name of
                            {first = a, last = b, middle = c} => [{first = l, last = b, middle = c}] @ helper(lst', name) 
    in
      case name of
        {first = a, last = b, middle = c} => let
          val first = get_substitutions2(lst, a)
        in
          name::helper(first, name)
        end
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

fun card_color(c) = (*card -> color*)
  case c of
    (Spades, _) => Black
  | (Clubs, _) => Black
  | (_, _) => Red

fun card_value(c) = (*card -> int*)
  case c of
    (_, Num i) => i
  | (_, Ace) => 11
  | (_, _) => 10

fun remove_card(cs, c, e) =
  let
    fun helper(cs, c, e, removed) =
      case cs of
        [] => if removed = true then [] else raise e 
      | cs::cs' => if cs = c andalso removed = false then helper(cs', c, e, true) else cs::helper(cs', c, e, false)
  in
    helper(cs, c, e, false)
  end

fun all_same_color(cs) = (*card -> bool*)
  case cs of
    [] => true
  | cs::[] => true
  | head::(neck::rest) => card_color(head) = card_color(neck) andalso all_same_color(neck::rest)
