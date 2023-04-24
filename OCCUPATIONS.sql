create view occu as (
 select
    case when occupation="doctor" then name
    end as doctor,
    case when occupation="singer" then name
    end as singer,
    case when occupation="professor" then name
    end as professor,
    case when occupation="actor" then name
    end as actor,
    row_number() over(partition by occupation order by name) as row_num
    from occupations
 );
 
 select MAX(doctor),MAX(professor),MAX(singer),MAX(actor) FROM occu
GROUP BY row_num