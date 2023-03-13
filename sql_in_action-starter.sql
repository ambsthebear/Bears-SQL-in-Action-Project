-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon

SELECT * FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out how many rows are in the table "final_airbnb"
-- EXPECTED OUTPUT: 146
SELECT count(host_id) FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out the name of the host for "host_id" 63613
-- HINT: "Where" could it be?

-- EXPECTED OUTPUT: Patricia
SELECT host_name FROM final_airbnb WHERE host_id = "63613";

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to just show the unique neighbourhoods listed
-- HINT: This is a "distinct" operation...

-- EXPECTED OUTPUT: 40 neighbourhoods listed
SELECT DISTINCT neighbourhood FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>

-- Find both the highest price listing and the lowest price listing, displaying the entire row for each
-- HINT: This can be two different queries.

-- FOOD FOR THOUGHT: Think about the results. Are the high and low prices outliers in this data set?

-- EXPECTED OUTPUT: Highest = 785, Lowest = 55

SELECT max(price) FROM final_airbnb;
SELECT min(price) FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the average availability for all listings in the data set (using the availability_365 column)
-- HINT: Aggregates are more than just big rocks...

-- EXPECTED OUTPUT: 165.3904
SELECT avg(availability_365) FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Find all listings that do NOT have a review
-- HINT: There are a few ways to go about this. Remember that an empty cell is "no value", but not necessarily NULL

-- EXPECTED OUTPUT: 6 rows
SELECT id FROM final_airbnb WHERE number_of_reviews = 0;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 
-- HINT: Sorting is your friend!

-- EXPECTED OUTPUT: 58059
SELECT id FROM final_airbnb WHERE room_type = "Private room" ORDER BY number_of_reviews DESC LIMIT 1;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the most popular neighbourhood for listings 
-- HINT: Look for which neighbourhood appears most frequently in the neighbourhood column
-- HINT: You are creating "summary rows" for each neighbourhood, so you will just see one entry for each neighbourhood

SELECT COUNT(neighbourhood) AS number_of_listings, neighbourhood FROM final_airbnb GROUP BY neighbourhood ORDER BY number_of_listings DESC LIMIT 1;

-- EXPECTED OUTPUT: Williamsburg
-- INVESTIGATE: Should Williamsburg be crowned the most popular neighbourhood?
-- No, I think that popularity should be determined by frequently people are staying there. A potential query could look like this:

SELECT neighbourhood, COUNT(neighbourhood), AVG(number_of_reviews/availability_365) AS booking_frequency FROM final_airbnb GROUP BY neighbourhood;

-- This also shows Williamsburg is the most popular and deserves the crown!

SELECT neighbourhood, AVG(availability_365), COUNT(neighbourhood) FROM final_airbnb WHERE neighbourhood = "Harlem" OR neighbourhood = "Williamsburg" GROUP BY neighbourhood;
-- This query shows that Harlem has more days booked (less availability) than Williamsburg, even though they have the same number of listings. An argument could be made that Harlem is more popular.
-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with a minimum_nights value of less than 7
-- HINT: Sorting is still your friend! So are constraints.

-- EXPECTED OUTPUT: 58059
SELECT id, reviews_per_month FROM final_airbnb WHERE minimum_nights < 7 ORDER BY reviews_per_month DESC LIMIT 1;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out which host has the most listings. 
-- Create a NEW column that will show a calculation for how many listings the host for each listing has in the table
-- Display the column using aliasing.
-- HINT: Work this one step at a time. See if you can find a way to just display the count of listings per host first.

-- EXPECTED OUTPUT: The Box House Hotel with 6 listings
SELECT COUNT(host_id) AS number_of_listings, host_name FROM final_airbnb GROUP BY host_name ORDER BY number_of_listings DESC LIMIT 1;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 11 >>>>>>>>>>>>>>>>>>>>>>>
-- <<<<<<<<<<<<<<<<<<<<<<< WRAP UP >>>>>>>>>>>>>>>>>>>>>>>>>
-- What do you think makes a successful AirBnB rental in this market? What factors seem to be at play the most?
-- Write a few sentences and include them with your project submission in the README file 
SELECT * FROM final_airbnb WHERE availability_365 < 10 ORDER BY number_of_reviews DESC LIMIT 5;
-- The output from line 96 shows that locations in Brooklyn are slightly more popular than other neighbourhood groups based on the number of reviews and having less availability (presumably because the locations are booked frequently). The price range is $75-100 for a private room and $80-$150 for the entire home/apt - price point may be a significant factor in popularity. Our top 5 were a mix of short and mid term rentals, so minimum stays don't appear to be a factor in popularity as guests may have different needs. More information is needed to determine the true nature of these top listings. I believe next steps for assessing what makes a successful airbnb in this market would be to look at common themes in reviews. Focusing on a single neighbourhood or growing the number of listings one has may not correspond with success.
SELECT * FROM final_airbnb WHERE host_name = "The Box House Hotel";
-- The information from line 98 shows the host with the most listings. While they are in a popular neighborhood group, their lowest cost room is $210 and only has 21 reviews and is only booked for about 60% of the year while the second lowest cost room at $250 does better in review numbers with 41 reviews, but is only booked for 45% of the year. The other listings fare worse in terms of time booked and number of reviews. Looking at this information confirms that price point is a factor in success while listing numbers may not indicate success. If someone is looking into airbnb hosting as a profitable business, I would recommend diversifying the locations and prices of listings as a building strategy.
SELECT * FROM final_airbnb WHERE price < 250 AND availability_365 < 30 ORDER BY number_of_reviews DESC LIMIT 10;
-- The information from line 100 shows listings that are less than $250 and are booked for at least 92% of the year. The top 10 by number of reviews average 0.94 reviews per month, pointing to positive guest experiences and satisfaction.
-- <<<<<<<<<<<<<<<<<<<<< ** BONUS ** >>>>>>>>>>>>>>>>>>>>>>>
-- Find the the percent above or below each listing is compared to the average price for all listings.
-- HINT: No hints! It's a bonus for a reason :)

