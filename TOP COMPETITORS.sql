select s.hacker_id, h.name
from submissions s
join hackers h
on s.hacker_id = h.hacker_id
join challenges c 
on c.challenge_id = s.challenge_id  
join difficulty d
on d.difficulty_level=c.difficulty_level and s.score= d.score
group by s.hacker_id, h.name
having count(s.hacker_id)>1
order by count(s.hacker_id) desc, s.hacker_id