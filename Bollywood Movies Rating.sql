use ETL1;
select*from movies2018;
/*                                              Bollywood Movie Database and Ratings                                                           */

--  rename this table of movies_sql to movie2018
create table movies2018 as (select*from movies_sql);
select*from movies2018;
drop table movies_sql;
desc movies2018;
-- Retrieve the names of all the Bollywood movies which are of drama genre in the dataset.
select movie_name,genre from movies2018 where genre='drama';

-- Retrieve the names of all the Bollywood movies of Amir Khan in the dataset.
select movie_name,lead_star from movies2018 where lead_star='Aamir khan';

-- Retrieve the names of all the Bollywood movies which are directed by RamGopal Verma in the dataset.
select movie_name,director from movies_sql where director='Ram gopal verma';

-- Retrieve the names of all the Bollywood movies which have been released over more than 1000 number of screens in the datsets.
select movie_name,number_of_screens from movies2018 where number_of_screens>1000;

-- Retrieve the names of all the Bollywood movies which have generated Revenue(INR) more than 700000000 in the dataset.
select movie_name,revenue from movies2018 where revenue>700000000;

-- Retrieve the names of all the Bollywood movies which have budget less than 1cr in the dataset.
select movie_name,budget from movies2018 where budget<'10000000';

-- Retrieve the names of all the Bollywood movies which are flop in the dataset.
select movie_name, revenue - budget as flop from movies2018 order by flop ;

-- Retrieve the names and profit of all the Bollywood movies in the dataset.(profit=revenue – budget)
select movie_name, revenue-budget as profit from movies2018 order by profit desc;

-- Retrieve the names and loss of all the Bollywood movies in the dataset.(loss=revenue – budget)
select movie_name, revenue - budget as loss from movies2018 order by loss desc;

-- Retrieve the names of all the Bollywood movies which have been released on holidays in the dataset
select movie_name,release_period from movies2018 where release_period='holiday';

-- Retrieve the names of all the Bollywood movies which have lead star as Akshay Kumar and directed by Priyadarshan in the dataset
select movie_name,lead_star,director from movies2018 where director='Priyadarshan' and lead_star='akshay kumar';

-- Retrieve the names of all the Bollywood movies starting with ‘a’ in the dataset.
select movie_name from movies2018 where movie_name like 'a%';

-- Retrieve the names of all the Bollywood movies ending with ‘a’ in the dataset
select movie_name from movies2018 where movie_name like '%a';

-- Retrieve the names of all the Bollywood movies having ‘a’ at second place of the name in the dataset.
select movie_name from movies2018 where movie_name like '_a%';

-- Retrieve the names of all the Bollywood movies having music of amit trivedi the dataset.
select movie_name,music_director from movies2018 where music_director='Amit Trivedi';

-- Retrieve the names of all the comedy movies of Akshay Kumar in the dataset
select movie_name,genre,lead_star from movies2018 where lead_star='Akshay kumar' and genre='comedy';

-- Retrieve the names of movies and star name starring khan in the dataset. 
select movie_name,lead_star from movies2018 where lead_star like '%khan%';

-- Retrieve the names of all the thriller Bollywood movies in the dataset.
select movie_name,genre from movies2018 where genre='thriller';

-- Which actors or directors have movies with the highest average revenue?
select lead_star,Director,(select round(avg(Revenue)) from movies2018) as `Avg Highest Revenue` from movies2018 
                                                                          order by `Avg Highest Revenue` desc limit 1;

-- Retrieve the names and budget of all the Bollywood movies according to the highest budget to lowest budget in the dataset.
select movie_name,budget from movies2018 order by budget desc;

-- Retrieve the names and budget of top 5 Bollywood movies with highest budget in the dataset.
select movie_name,budget from movies2018 order by budget desc limit 0,5;

-- Retrieve the names of top 10 Bollywood movies with highest revenue generation in the dataset.
select movie_name,revenue from movies2018 order by revenue desc limit 0,10;

-- Retrieve the names of top 5 floped movies in the dataset.
select movie_name , revenue - budget as flop from movies2018 order by flop desc limit 0,5;

-- Retrieve the names of top 5 hit movies in the dataset.
select movie_name,revenue from movies2018 order by revenue desc limit 0,5; 

-- Which genres are the most popular overall?
SELECT Genre, SUM(Revenue) AS Total_Revenue FROM movies2018 GROUP BY Genre
                                                            ORDER BY Total_Revenue DESC LIMIT 3;


-- Which is the second movie released on maximum screens.
select movie_name,number_of_screens from movies2018 order by number_of_screens desc limit 1,1;

-- Which is the 10th movies with highest budget
select movie_name,budget from movies2018 order by budget desc limit 9,1;

-- Which is the 2nd movie of Amitabh Bachchan with highest budget.
select movie_name,budget,lead_star from movies2018 where lead_star='amitabh bachchan' order by budget desc limit 1,1; 

-- Which are the flopped movies of Akshay Kumar
select lead_star,movie_name,revenue - budget as flop from movies2018 where lead_star='Akshay kumar' order by flop desc;

-- With which director Shahrukh Khan have given the biggest hit movie 
select movie_name,lead_star,director,revenue from movies2018 where lead_star='Shahrukh Khan'order by revenue desc;

/* create a view that contain 500 records from movies2018 the view named as movies500 that contians the attributes(movie_name,
genre,lead_star,director,music_director,budget,revenue)*/
create view movies500 as select movie_name,genre,lead_star,director,music_director,budget,revenue from movies2018 limit 0,500;
select*from movies500;
select count(lead_star) from movies500;

-- calculate the avg revenue for each movie?
select movie_name, avg(revenue) from movies2018 group by movie_name;

-- calculate the avg revenue more than 200000000 of movies ?
select movie_name,avg(revenue) from movies2018 group by movie_name having avg(revenue>200000000);


                                                                          
