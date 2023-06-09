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

fun dates_in_months(dates : (int * int * int) list, months : int list) = 
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strings : string list, n : int) = 
    if n = 1
    then (hd strings)
    else get_nth(tl strings, n - 1)

fun date_to_string(date : int * int * int) =
    let
      val months_list = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
      val month = get_nth(months_list, #2 date)
      val date_string = Int.toString(#3 date)
      val year = Int.toString(#1 date)
      
    in
      month ^ " " ^ date_string ^ ", " ^ year
    end

fun number_before_reaching_sum(sum : int, nums : int list) =
    let
      fun number_before_reaching_sum_helper(nums : int list, target : int, total : int, n : int) =
        if (hd nums) + total < target
        then number_before_reaching_sum_helper((tl nums), target, total+ (hd nums), n+1)
        else n
    in
      number_before_reaching_sum_helper(nums, sum, 0, 0)
    end

fun what_month(day : int) =
    let
      val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
      number_before_reaching_sum(day, months) + 1
    end

fun month_range(day1 : int, day2 : int) =
  if day1 > day2
  then []
  else what_month(day1) :: month_range(day1+1, day2)

fun oldest(dates : (int * int * int) list) =
  if null dates
  then NONE 
  else 
  let
    fun oldest_date(dates : (int * int * int) list) =
      if null (tl dates)
      then hd dates
      else
      let
        val tl_ans = oldest_date(tl dates)
      in
        if is_older(hd dates, tl_ans)
        then hd dates
        else tl_ans
      end
  in
    SOME(oldest_date dates)
  end