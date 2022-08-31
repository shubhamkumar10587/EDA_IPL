-- create database ipl;
-- ---------------------------------------------------

/*create table matches (id integer,
  season integer,
  city varchar(100),
  d_ate date,
  team1 varchar(100), 
  team2 varchar(100), 
  toss_winner varchar(100), 
  toss_decision varchar(100), 
  result varchar(100), 
  dl_applied integer, 
  winner varchar(100), 
  win_by_runs integer, 
  win_by_wickets integer, 
  player_of_the_match varchar(100), 
  venue varchar(100), 
  umpire1 varchar(100), 
  umpire2 varchar(100), 
  umpire3 integer
);*/

-- ----------------------------------------------------------
/*CREATE TABLE deliveries (
  matchid integer, 
  inning integer, 
  batting_team varchar(100), 
  bowling_team varchar(100), 
  o_ver integer, 
  ball integer, 
  batsman varchar(100), 
  non_striker varchar(100), 
  bowler varchar(100), 
  is_super_over integer, 
  wide_runs integer, 
  bye_runs integer, 
  legbye_runs integer, 
  noball_runs integer, 
  penalty_runs integer, 
  batsman_runs integer, 
  extra_runs integer, 
  total_runs integer, 
  player_dismissed varchar(100), 
  dismissal_kind varchar(100), 
  fielder varchar(100)
);*/

-- --------------------------------------------------------

/*
alter table matches
drop column umpire3
*/


-- -------------------------------------------------------
-- select count(*) as No_of_row from matches

-- -----------------------------------------------------

/*select count(*) as No_of_columns from information_schema.columns
 where TABLE_NAME='matches';*/
 -- -------------------------------------------------
 
 -- select count(*) as No_of_row from deliveries;
 -- -----------------------------------------------
 
 
 /*select count(*) as No_of_columns from information_schema.columns
 where TABLE_NAME='deliveries';
 */
 -- -----------------------------------------------------
 
/* Select * from deliveries
   limit 5;
*/
-- ----------------------------------------------------

/*select * from matches
limit 5;
*/
-- ----------------------------------------------------
/*select m.season,m.city,m.d_ate,m.team1,m.team2,m.winner,m.win_by_runs from 
matches m
where m.season='2017'
limit 10;
*/

-- ----------------------------------------------------

/*select distinct season  as year from matches m
order by 1
limit 15
;
*/
-- ---------------------------------------------------
/*select count(distinct player_of_match) as 'No of Matches' from matches m
order by 1;
*/
-- --------------------------------------------------------------

/*select winner ,season ,d_ate from matches 
where d_ate in (select max(d_ate) from matches 
group by season
order by max(d_ate) desc)
order by d_ate 
limit 15;
*/
-- ---------------------------------------------------------
/*select venue,max(d_ate) as date from matches 
group by venue 
order by date desc
limit 10;
*/
-- ----------------------------------------------

/*select batsman,bowler,batsman_runs,ball, 
case 
   when  batsman_runs=0 then "duck"
   when  batsman_runs=6 then "six"
   when  batsman_runs=4 then "four"
   when batsman_runs=1 then "single"
   else "runs in words"
   end batsman_runs
   from deliveries;
*/
-- -----------------------------------------------------

/*select winner,max(win_by_runs) from matches
group by winner
order by 2 ;
*/


-- ----------------------------------------------------
/*select winner,win_by_wickets,season,max(win_by_runs) from matches
where winner='Mumbai Indians'
group by season
order by 3 desc;
*/
-- ----------------------------------------------------------

/*select distinct bowler,sum(extra_runs) from deliveries
group by bowler
having sum(extra_runs)>0
order by 2 desc;
*/
-- ------------------------------------------------

/*select winner,avg(win_by_runs) from matches
group by winner
having avg(win_by_runs)>0
order by 2 desc;
*/
-- ----------------------------------------------------

/*select bowler,sum(extra_runs) from deliveries
where bowler='SK Warne'
group by bowler;

*/

-- -------------------------------------------------------

/*select m.winner, d.total_runs,count(d.total_runs) from deliveries d
inner join matches m on m.id=d.matchid
where d.total_runs in (4,6)
and m.winner='Mumbai Indians'
group by m.winner, d.total_runs;
*/
-- ----------------------------------------------------------

/*select batsman,bowler, count(ball) from deliveries
where bowler='SK Warne' and batsman='SR Tendulkar'
group by batsman,bowler;
*/
-- -----------------------------------------------------

/*select count(*) from matches
where month(d_ate)='4';
        -- or
select count(*) from matches
where extract(month from d_ate)=4;
*/

-- ---------------------------------------------------

/*select count(*) from matches
where month(d_ate) in ('3','6');*/

-- ----------------------------------------------------

/*select count(player_dismissed) as 'Wicket' from deliveries
where player_dismissed <>"";
*/

-- ---------------------------------------------------------


/*select dismissal_kind,player_dismissed, count(*) from deliveries
where player_dismissed <>""
group by dismissal_kind,player_dismissed
order by 3 desc;
*/

-- --------------------------------------------------

/* select Distinct player_of_match from matches 
   where player_of_match like '%M%';
*/
-- -------------------------------------------
/*select Distinct player_of_match from matches where player_of_match 
like 'JJ %';
*/
/*select distinct player_of_match from matches where player_of_match 
like 'K_ P%';
*/
/*SELECT distinct team1 FROM matches where lower(team1) like lower('%Royal%');
*/
-- ---------------------------------------------

/*select season,max(win_by_runs) from matches
group by season
order by 1;
*/

-- -------------------------------------------------------------
/* select batting_team,batsman,sum(batsman_runs) from deliveries
group by batting_team,batsman
*/
-- --------------------------------------------------------

/*
select DISTINCT batsman,count(total_runs) from deliveries
where total_runs in (4,6)
group by batsman 
order by 2 desc
limit 10;
*/

-- -----------------------------------------------
/* select bowler,sum(extra_runs) as 'highest extra runs' from deliveries
group by bowler
order by 2 desc
limit 10;
*/
-- -------------------------------------------------

/*select bowler,count(player_dismissed) as NoWicket_Taken,dismissal_kind from 
deliveries
where dismissal_kind <>""
group by bowler
order by NoWicket_Taken desc
limit 10;
*/

-- -------------------------------------------------------


/*select season, player_of_match, CNT from
(
select row_number() over (partition by season) as
rn,season,player_of_match,Cnt
from (
select season,player_of_match, count(player_of_match) 
as Cnt
from matches
group by season,player_of_match
order by 1 asc,3 desc
 ) rw
) Temp
where Temp.rn<3;
*/
















