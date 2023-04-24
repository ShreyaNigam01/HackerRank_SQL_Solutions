with min_coins as(
select id, code, coins_needed, power,
row_number() over (partition by code, power order by code, power, coins_needed ) as row_num
from wands
    )


select id, age,coins_needed, power
from min_coins m join wands_property wp
on m.code=wp.code 
where is_evil = 0 and m.row_num= 1
order by power desc, age desc
