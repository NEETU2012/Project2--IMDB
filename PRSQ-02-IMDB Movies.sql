## PERFORM THE PROBLEM QUERIES

## a) How do you get all the data about movies?
SELECT * FROM project_movie_database.movies;

## b) How do you get all the data about directors?
SELECT * FROM project_movie_database.directors;

## c) Check how many movies are present in IMDB
SELECT COUNT(*) AS movie_count FROM project_movie_database.movies;

## d) Find these 3 directors: James Cameron; Luc Besson; John Woo
SELECT * FROM project_movie_database.directors 
WHERE `name` IN ('James Cameron', 'Luc Besson', 'John Woo');

## e) Find all the directors with name starting with S
SELECT `name` FROM project_movie_database.directors 
WHERE `name` LIKE 'S%';

## f) Count Female Directors
SELECT count(*) AS Count_of_female_directors 
FROM project_movie_database.directors 
WHERE gender=1;

## g) Find the name of 10th First women director?
SELECT `name` AS female_director 
FROM project_movie_database.directors 
WHERE gender=1 ORDER BY gender 
DESC LIMIT 1 OFFSET 9;

## h) What are the 3 most popular movies?
SELECT original_title, popularity 
FROM project_movie_database.movies 
ORDER BY popularity DESC LIMIT 3;

## i) What are the 3 most bankable movies?
SELECT original_title, revenue 
FROM project_movie_database.movies 
ORDER BY revenue DESC LIMIT 3;

## j) What is the most awarded average vote since the January 1st, 2000?
SELECT title, vote_average, release_date 
FROM project_movie_database.movies 
WHERE release_date>=2000-01-01 
ORDER BY vote_average DESC LIMIT 1;

## k) Which movie(s) were directed by Brenda Chapman?
SELECT m.original_title, d.`name` 
FROM movies m JOIN directors d 
ON m.director_id=d.id 
WHERE d.`name` = "Brenda Chapman";

## l) Which director made the most movies
SELECT d.`name`, count(m.id) AS most_movie_count 
FROM movies m JOIN directors d 
ON m.director_id=d.id GROUP BY d.`name` 
ORDER BY most_movie_count DESC LIMIT 1;

## m) Which director is the most bankable?
SELECT d.`name`, SUM(m.revenue) AS most_revenue 
FROM movies m JOIN directors d 
ON m.director_id=d.id GROUP BY d.`name` 
ORDER BY most_revenue DESC LIMIT 1;

