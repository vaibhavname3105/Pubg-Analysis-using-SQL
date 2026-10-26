#case and subqueries

# Classify players as High, Average, or Low performers based on their total kills.
select p.username ,
sum(kills) as total_kills ,
case when sum(pm.kills)>=15 then 'high performer'
when sum(pm.kills)>=8 then 'average performer'
else 'low performer'
end as 'performance_category'
from players p join player_matches pm on
p.player_id = pm.player_id
group by p.player_id , p.username 
order by total_kills desc;

#  Find players whose level is higher than the average player level.
select username,
level
from players 
where level > (
select avg(level) 
from players )
order by level desc;

#Find the weapon with the highest total damage
select w.weapon_name,
sum(pw.damage_with_weapon) as total_damage 
from weapons w join player_weapons pw
on w.weapon_id = pw.weapon_id 
group by w.weapon_id , w.weapon_name 
order by total_damage desc
limit 1;
