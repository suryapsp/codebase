fun is_older(x : int*int*int, y: int*int*int) =
    if (#1 x) <> (#1 y)
    then (#1 x) < (#1 y)
    else if (#2 x) <> (#2 y)
    then (#2 x) < (#2 y)
    else (#3 x) < (#3 y)

fun number_in_month(dates : (int * int * int) list, month : int) =
    if null dates
    then 0
    else
        let
            val m = (#2 (hd dates)) 
        in
            if m = month 
            then 1 + number_in_month((tl dates), month)
            else number_in_month((tl dates), month)
        end

fun number_in_months(dates : (int * int * int) list, months : int list) =
    if null months
    then 0
    else number_in_month(dates, (hd months)) + number_in_months(dates, (tl months))

fun dates_in_month(dates : (int * int * int) list, month : int) =
    if null dates
    then []
    else if (#2 (hd dates)) = month
    then (hd dates) :: dates_in_month((tl dates), month)
    else dates_in_month((tl dates), month)
