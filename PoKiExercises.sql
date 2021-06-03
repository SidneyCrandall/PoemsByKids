-- 1) What grades are stored in the database?

 -- SELECT * FROM Grade;

-- 2) What emotions may be associated with a poem?

 -- SELECT * FROM Emotion; 

-- 3) How many poems are in the database?
-- COUNT() returns how many rows match that criteria

 /*SELECT COUNT(p.id) as PoemTotal
	FROM Poem p;*/

-- 4) Sort authors alphabetically by name. What are the names of the top 76 authors?
-- ORDER BY will order things in the table in asc/desc depending on specification

 /*SELECT TOP 76 Author.Name
	FROM Author
	ORDER BY Author.Name asc;*/

-- 5) Starting with the above query, add the grade of each of the authors.
-- JOIN the Grade table so that the Author can select that info and display in the table

/*SELECT TOP 76 Author.Name, Grade.Name as Grade 
	FROM Author
	JOIN Grade on Author.GradeId = Grade.Id
	ORDER BY Author.Name asc;*/


-- 6) Starting with the above query, add the recorded gender of each of the authors.
-- 'As' name the values we want to display.
-- Like the one above JOIN grade and gender to select data for query.

 /*SELECT TOP 76 Author.Name, Grade.Name as Grade, Gender.Name as Gender
	FROM Author 
	JOIN Grade on Author.GradeId = Grade.Id
	JOIN Gender on Author.GenderId = Gender.Id
	ORDER BY Author.Name asc;*/

-- 7) What is the total number of words in all poems in the database?
-- SUM() adds the number of words in all the poems.

 /*SELECT SUM(Poem.WordCount)
	FROM Poem;*/

-- 8) Which poem has the fewest characters?
-- Title and Character Count (CharCount) should be returned. 
-- SELECT MIN() chooses the data that has the fewest. 

 /*SELECT Poem.Title, Poem.CharCount
	FROM Poem
	WHERE Poem.CharCount = (
	SELECT MIN(Poem.CharCount)
	FROM Poem);*/

-- 9) How many authors are in the third grade?
-- JOIN the Grade and Author columns, count how many there are in the 3rd and return that number.
-- COUNT() those rows and return the number

/*SELECT COUNT(Author.Name) as '3rd Graders'
	FROM Author
	JOIN Grade on GradeId = Grade.Id
	WHERE Grade.Id = 3;*/

-- 10) How many total authors are in the first through third grades?
-- Similar to the one above. Add OR to retrun the criteria of all grades.

/*SELECT COUNT(Author.Name) as '1st-3rd Graders'
	FROM Author
	JOIN Grade on GradeId = Grade.Id
	WHERE Grade.Id = 3 OR Grade.Id = 2 OR Grade.Id = 1;*/

-- 11) What is the total number of poems written by fourth graders?
-- JOIN Author and Grade so we can pull the correct tables

/*SELECT COUNT(Poem.Id) as 'Peems by 4th' 
	FROM Poem
	JOIN Author on Poem.AuthorId = Author.Id
	JOIN Grade on GradeId = Grade.Id
	WHERE GradeId = 4;*/

-- 12) How many poems are there per grade?
-- GROUP BY groups result set that have the same values into summary rows.

/*SELECT COUNT(Poem.Id) as 'Poems per Grade'
	FROM Poem
	JOIN Author on AuthorId = Author.Id
	JOIN Grade on GradeId = Grade.Id
	GROUP BY GradeId;*/

-- 13) How many authors are in each grade? (Order your results by grade starting with 1st Grade)
-- 14) What is the title of the poem that has the most words?
-- 15) Which author(s) have the most poems? (Remember authors can have the same name.)
-- 16) How many poems have an emotion of sadness?
-- 17) How many poems are not associated with any emotion?
-- 18) Which emotion is associated with the least number of poems?
-- 19) Which grade has the largest number of poems with an emotion of joy?
-- 20) Which gender has the least number of poems with an emotion of fear?