with temp as(
select h.name, s.hacker_id, s.challenge_id,s.score, row_number() over (partition by s.hacker_id,s.challenge_id order by s.score desc) row_num
from submissions s join hackers h
on s.hacker_id= h.hacker_id
--order by s.hacker_id
)

,te as (
select temp.name, temp.hacker_id ,  sum(temp.score) as total_score
from temp
where temp.row_num=1 
group by temp.name, temp.hacker_id
--order by total_score, temp.hacker_id
    )
    
select  te.hacker_id, te.name,te.total_score
from te
where te.total_score>0
order by te.total_score desc, te.hacker_id  