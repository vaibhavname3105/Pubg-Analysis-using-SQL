#window 

#Find the players and assign a unique row number to each player based on their level, from highest to lowest.
select username , level,
row_number() over( order by level desc) as player_rank
from players;

#Rank players based on their total kills, from highest to lowest.
select p.username ,
sum(pm.kills) as total_kills ,
rank ()over(order by sum(pm.kills) desc) as kill_rank
from players p join player_matches pm on
p.player_id = pm.player_id 
group by p.username , p.player_id 
order by total_kills desc;

# Rank players within each country based on their level.
select username , country , level ,
rank () over(partition by country order by level desc) as country_rank 
from players order by country , country_rank;

# Create a View for Player Performance
create view player_kill_summary as 
select p.username , sum(pm.kills) as total_kills 
from players p join player_matches pm 
on p.player_id = pm.player_id 
group by p.player_id , p.username;

#Display the top 5 players from the player_kill_summary view. 
select username , total_kills 
from player_kill_summary order by total_kills desc 
limit 5;

select * from player_kill_summary;