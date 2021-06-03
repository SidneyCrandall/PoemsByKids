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
-- Query the poems title and charcount, then subquery the MIN()
-- Where tells it where to select it from

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
-- Group the grades, then order them in ascending order. 

 /*SELECT Grade.Name, COUNT(Author.Id) as TotalPoets
	FROM Author
	LEFT JOIN Grade on Grade.Id = Grade.Id
	WHERE GradeId = 1 OR GradeId = 2 OR GradeId = 3 OR GradeId = 4 OR GradeId= 5
	GROUP BY Grade.Name
	ORDER BY Grade.Name ASC;*/

-- 14) What is the title of the poem that has the most words?
-- Similar to when we found the poem with the fewest word count, we will use MAX() this time.
-- We will query the poems first then subquery the word count

 /*SELECT Poem.Title, Poem.WordCount
	FROM Poem
	WHERE Poem.WordCount = (
	SELECT MAX(Poem.WordCount)
	FROM Poem);*/

-- 15) Which author(s) have the most poems? (Remember authors can have the same name.)
-- Look at the poets and poems. Join those tables. But count the number of poems they have.
-- Different poeple even though they have same names. Order the poems from most to fewest (Desc)

 /*SELECT Author.Name as Poet, COUNT(Poem.Id) as PoemCount
	FROM Author
	LEFT JOIN Poem on Author.Id = Poem.AuthorId
	GROUP BY Poem.AuthorId, Author.Name
	ORDER BY PoemCount DESC;*/
	
-- 16) How many poems have an emotion of sadness?
-- Select the poems, then join the poem to emotion table and poememotion table
-- We tell it where to pull the query from which is the emotion name of Sadness

 /*SELECT COUNT(Poem.Id) as SadPoems
	FROM Poem
	JOIN PoemEmotion on Poem.Id = PoemEmotion.PoemId
	JOIN Emotion on PoemEmotion.EmotionId = Emotion.Id
	WHERE Emotion.Name = 'Sadness';*/

-- 17) How many poems are not associated with any emotion?
-- Just like the one above. Select the poems, Look through them and at more spicifically at emotions.
-- Match those type of values, then return to us poems that don't have emotions attached to them 

 /*SELECT COUNT(Poem.Id) as 'No Emotion Poem'
	FROM Poem
	LEFT JOIN PoemEmotion on Poem.Id = PoemEmotion.PoemId
	LEFT JOIN Emotion on PoemEmotion.EmotionId = Emotion.Id
	WHERE Emotion.Name IS NULL;*/

-- 18) Which emotion is associated with the least number of poems?
-- Without the 'where' at the end of 17 you would be able to see all emotions associated with the poems.
-- Here we group the poems to their emotion then we order them with one with the fewest emotions is first.
-- Null emotion is teh loweest, while Joy is the highest. (Asc)

 /*SELECT Name, COUNT(Poem.Id) as NumOfPoems
	FROM Poem
	LEFT JOIN PoemEmotion on Poem.Id = PoemEmotion.PoemId
	LEFT JOIN Emotion on PoemEmotion.EmotionId = Emotion.Id 
	GROUP BY Name
	ORDER BY NumOfPoems Asc;*/

-- 19) Which grade has the largest number of poems with an emotion of joy?
-- Becuase 'TOP 1" is used we wont need an order by. The query will reeturn only one grade.
-- 'Having' clause becuase 'where' keyword cannot be used to aggregate functions.

 /*SELECT TOP 1 COUNT(Poem.Id) as Poems, Grade.Name as Grade, Emotion.Name
	FROM Poem
	LEFT JOIN PoemEmotion on Poem.Id = PoemEmotion.PoemId
	LEFT JOIN Emotion on PoemEmotion.EmotionId = Emotion.Id
	LEFT JOIN Author on Poem.AuthorId = Author.Id
	LEFT JOIN Grade on Author.GradeId = Grade.Id
	GROUP BY Grade.Name, Emotion.Name
	HAVING Emotion.Name = 'Joy';*/

-- 20) Which gender has the least number of poems with an emotion of fear?
-- This will need the ORDER BY in order to show which gender is has the least emotions... 
-- Written like #19, we need to connect the tables to query the info asked for.

 /*SELECT COUNT(Poem.Id) as FearfulPoems, Gender.Name as Gender, Emotion.Name
	FROM Poem
	LEFT JOIN PoemEmotion on Poem.Id = PoemEmotion.PoemId
	LEFT JOIN Emotion on PoemEmotion.EmotionId = Emotion.Id
	LEFT JOIN Author on Poem.AuthorId = Author.Id
	LEFT JOIN Gender on Author.GenderId = Gender.Id
	GROUP BY Gender.Name, Emotion.Name
	HAVING Emotion.Name = 'Fear'
	ORDER BY FearfulPoems;*/