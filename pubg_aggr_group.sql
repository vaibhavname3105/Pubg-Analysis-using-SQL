# Aggregate & Group Analysis

#Find the average kills, assists, and damage of players. # average 
select avg(kills) as average_kills,
avg(assists) as average_assists ,
avg(damage) as average_damage
from player_matches;

# Find the total kills achieved by each player. #sum ,group by
select player_id ,
sum(kills) as total_kills
from player_matches
group by player_id 
order by total_kills desc;

# Players with more than 10 total kills # group  by having , orderby
select player_id ,
sum(kills) as total_kills 
from player_matches
group by player_id 
having sum(kills)>10
order by total_kills desc;

#Find the average damage for each weapon # avg group by order by
select weapon_id ,
avg(damage_with_weapon) as average_damage
from player_weapons
group by weapon_id 
order by average_damage desc;

#Find weapons that have more than 10 total kills
select weapon_id ,
sum(kills_with_weapon) as total_kills 
from player_weapons
group by weapon_id 
having sum(kills_with_weapon)>10
order by total_kills desc;

# Number of players in each match #
select match_id ,
count(player_id) as players_in_match 
from player_matches 
group by match_id 
order by players_in_match;

# Find the match with the highest total kills.
select match_id ,
sum(kills) as total_kills
from player_matches 
group by match_id
order by total_kills desc
limit 1;

select player_id ,sum(kills) as total_kills from player_matches group by player_id;

