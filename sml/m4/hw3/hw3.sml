(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals(s) =
	List.filter(fn x => Char.isUpper(String.sub (x, 0))) s

fun longest_string1(s) =
	List.foldl(fn (x, y) => if String.size(x) > String.size(y) then x else y) "" s

fun longest_string2(s) =
	List.foldl(fn (x, y) => if String.size(x) >= String.size(y) then x else y) "" s

fun longest_string_helper f =
	fn s => List.foldl(fn (x, y) => if f(String.size(x), String.size(y)) then x else y) "" s

fun longest_string3 s = longest_string_helper (fn (a, b) => a > b) s

fun longest_string4 s = longest_string_helper (fn (a, b) => a>=b ) s 

fun longest_capitalized s = (longest_string3 o only_capitals) s

fun rev_string s = (String.implode o List.rev o String.explode) s

fun first_answer f =
	fn xs => case xs of
				[] => raise NoAnswer
			  |	x::xs' => case (f x) of
			  					SOME x => x
							  |	NONE => first_answer f xs'

fun all_answers f =
	fn xs => 
	let
	  fun helper(acc, ys) =
		case ys of
			[] => SOME []
		  |	y::ys' => case (f y) of
		  				NONE => NONE
					  |	SOME y => helper([y]@acc, ys')
	in
	  helper([], xs)
	end

fun count_wildcards p =
	g (fn () => 1) (fn x => 0) p 

fun count_wild_and_variable_lengths p =
	g (fn () => 1) String.size p 

fun count_some_var (s, p) =
	g (fn () => 0) (fn a => if a = s then 1 else 0) p 
