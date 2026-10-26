# Basics question 

# display the username , country ,level and joindate of all players # select
select username , country ,level , join_date from players;

# Find all players who are from India. # where 
select player_id , username , country , level 
from players where country = 'India';

#Display players in descending order of their level. # order by 
select player_id , username , country ,level
from players order by level desc;

# Find all different countries represented by the players. # distinct 
select distinct country from players ;

#Find the total number of players # count
select count(*) as total_players from players;

# Find the highest number of kills achieved in a single match.
select max(kills) as highest_kills from player_matches;