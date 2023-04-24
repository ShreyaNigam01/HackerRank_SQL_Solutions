with view_a as (
select h.hacker_id, h.name, count(c.challenge_id) as chal_count
from hackers h
join challenges c
on h.hacker_id = c.hacker_id
group by h. hacker_id, h.name
--order by count(c.challenge_id)
)

, view_b as ( 
select chal_count, count(chal_count) as chal_ppl_count
from view_a
group by chal_count)

select va.hacker_id, va.name, va.chal_count
from view_a va 
join view_b vb 
on va.chal_count= vb.chal_count
where vb.chal_ppl_count<=1 or va.chal_count = (select max(chal_count) from view_a)
order by va.chal_count desc, va.hacker_id