SELECT *
  FROM [PortfolioProject (Marvel Box Office)].[dbo].[marvel_box_office];

-- Updating Table
UPDATE marvel_box_office
	SET Phase = null
	WHERE Phase = '';

-- Data Used

SELECT Movie, [Release Date], [Release Month], [Release Day], [Release Year], Ownership, [Domestic Box Office], [International Box Office], [Worldwide Box Office], [Opening Weekend], Budget, [IMDb Score], [Meta Score], Tomatometer, [Rotten Tomato Audience Score], [Run Time In Minutes], Phase, Director
	FROM marvel_box_office;

-- Movie Rankings Based on Audience Ratings
SELECT movie, [Rotten Tomato Audience Score]
	FROM marvel_box_office
		ORDER BY [Rotten Tomato Audience Score] DESC;

-- Movie with the Highest Budget
SELECT movie, Budget
	FROM marvel_box_office
		ORDER BY Budget DESC;

-- Highest Opening Day Performance
SELECT movie, [Opening Weekend]
	FROM marvel_box_office
		ORDER BY [Opening Weekend] DESC;

-- Opening Day Profit Margins
SELECT movie, [Opening Weekend], Budget, [Opening Weekend] - Budget as OpeningProfit
	FROM marvel_box_office
		ORDER BY OpeningProfit DESC;

-- Director with Highest Average Profit Per Movie
SELECT Director, AVG(Budget) AS AvgBudgetPerMovie, AVG([Opening Weekend]) AS AvgOpeningPerformance, AVG([Opening Weekend]) - AVG(Budget) AS AvgInitialProfit
	FROM marvel_box_office
		GROUP BY Director
		ORDER BY AvgInitialProfit DESC;

-- Ranked Average Director Audience Movie Ratings
SELECT Director, AVG([Rotten Tomato Audience Score]) AS AvgAudienceScore
	FROM marvel_box_office
		GROUP BY Director
		ORDER BY AvgAudienceScore DESC;

-- Ranked Highest Director Movie Ratings
SELECT Director, MAX([Rotten Tomato Audience Score]) AS MaxAudienceScore
	FROM marvel_box_office
		GROUP BY Director
		ORDER BY MaxAudienceScore DESC;

-- Highest Performing Studio Per Movie
SELECT Ownership, AVG(Budget) AS AvgBudgetPerMovie, AVG([Opening Weekend]) AS AvgOpeningPerformance, AVG([Opening Weekend]) - AVG(Budget) AS AvgInitialProfit
	FROM marvel_box_office
		GROUP BY Ownership
		ORDER BY AvgOpeningPerformance DESC;

-- MCU Phase Performance
SELECT Phase, AVG(Budget) AS AvgBudgetPerMovie, AVG([Opening Weekend]) AS AvgOpeningPerformance, AVG([Opening Weekend]) - AVG(Budget) AS AvgInitialProfit
	FROM marvel_box_office
		WHERE Phase is not null
		GROUP BY Phase
		ORDER BY AvgOpeningPerformance DESC;

-- MCU Phase with the Highest Budget
SELECT Phase, SUM(Budget) AS TotalBudget
	FROM marvel_box_office
		WHERE Phase is not null
		GROUP BY Phase
		ORDER BY TotalBudget DESC;

-- Ranked MCU Phase Average Audience Ratings
SELECT Phase, AVG([Rotten Tomato Audience Score]) AS AvgAudienceScore
	FROM marvel_box_office
		WHERE Phase is not null
		GROUP BY Phase
		ORDER BY AvgAudienceScore DESC;

-- Ranked Highest MCU Phase Audience Ratings
SELECT Phase, MAX([Rotten Tomato Audience Score]) AS MaxAudienceScore
	FROM marvel_box_office
		WHERE Phase is not null
		GROUP BY Phase
		ORDER BY MaxAudienceScore DESC;

-- Most Common Months to Release Movies and Their Performance
SELECT [Release Month], COUNT([Release Month]) AS MoviesReleased, AVG([Opening Weekend]) AS AvgOpeningPerformance, AVG([Opening Weekend]) - AVG(Budget) AS AvgInitialProfit
	FROM marvel_box_office
		GROUP BY [Release Month]
		ORDER BY AvgOpeningPerformance DESC;
