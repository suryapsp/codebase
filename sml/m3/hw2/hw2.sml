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
                    NONE => get_substitutions1(lst', s)
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
  case cs of
    [] => raise e 
  | cs::cs' => if cs = c then cs' else cs::remove_card(cs', c, e)

fun all_same_color(cs) = (*card -> bool*)
  case cs of
    [] => true
  | cs::[] => true
  | head::(neck::rest) => card_color(head) = card_color(neck) andalso all_same_color(neck::rest)

fun sum_cards(cs) =
  let
    fun helper_sum(cs, acc) =
      case cs of
        [] => acc
      | cs::cs' => helper_sum(cs', card_value(cs)+acc)
  in
    helper_sum(cs, 0)
  end

fun score(cs, goal) =
  let
    fun preliminary_score(cs, goal) =
      let
        val sum = sum_cards(cs)
      in
        if sum > goal then 3*(sum - goal)
        else goal - sum
      end
  in
    if all_same_color(cs) then preliminary_score(cs, goal) div 2
    else preliminary_score(cs, goal)
  end

fun officiate (cards,plays,goal) =
    let 
        fun loop (current_cards,cards_left,plays_left) =
            case plays_left of
                [] => score(current_cards,goal)
              | (Discard c)::tail => 
                loop (remove_card(current_cards,c,IllegalMove),cards_left,tail)
              | Draw::tail =>
                case cards_left of
                    [] => score(current_cards,goal)
                  | c::rest => if sum_cards (c::current_cards) > goal
                               then score(c::current_cards,goal)
                               else loop (c::current_cards,rest,tail)
    in 
        loop ([],cards,plays)
    end