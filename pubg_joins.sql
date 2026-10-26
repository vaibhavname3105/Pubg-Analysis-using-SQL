# joins 

# Display each player's username along with their kills, assists, and placement.
select p.username,
pm.kills,
pm.assists,
pm.placement from players p 
join player_matches pm 
on p.player_id = pm.player_id;

# Display the match ID, map name, game mode, player ID, kills, and placement.
select m.match_id ,
m.map_name,
m.game_mode,
pm.player_id,
pm.kills,
pm.placement from matches m 
join player_matches pm on
m.match_id = pm.match_id;

#  Display the player name, weapon name, kills with the weapon, and damage with the weapon.# 
select p.username,
w.weapon_name,
pw.kills_with_weapon,
pw.damage_with_weapon
from player_weapons pw join players p on pw.player_id = p.player_id
join weapons w on pw.weapon_id = w.weapon_id;

#Find the top 5 players based on their total kills.
select p.username ,
sum(pm.kills) as total_kills
from players p join player_matches pm on
p.player_id = pm.player_id
group by p.player_id , p.username
order by total_kills desc
limit 5;

select p.username ,avg(pm.kills) as avg_kills 
from players p join player_matches pm on p.player_id = pm.player_id 
group by p.username,p.player_id 
order by avg_kills desc
limit 5 offset 5;

select p.username ,sum(pm.kills) as total_kills 
from players p join player_matches pm on p.player_id = pm.player_id 
group by p.username,p.player_id;