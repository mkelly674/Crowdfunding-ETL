-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
Select backers_cont, cf_id
FROM campaign
WHERE outcome = 'live'
ORDER BY cf_id DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(backers_id), cf_id
FROM backers
GROUP BY cf_id
ORDER BY cf_id DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT ba.first_name, ba.last_name, ba.email, (ca.goal - ca.pledged) as amount_left
INTO amount_left_table
FROM backers as ba
JOIN campaign as ca
ON ba.cf_id = ca.cf_id
WHERE ca.outcome = 'live'
ORDER BY amount_left DESC;

-- Check the table
SELECT * FROM amount_left_table;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT ba.email, ba.first_name, ba.last_name, ba.cf_id, ca.company_name, ca.description, ca.end_date, (ca.goal - ca.pledged) as Left_of_Goal
INTO email_backers_remaining_goal_amount
FROM backers as ba
JOIN campaign as ca
ON ba.cf_id = ca.cf_id
WHERE ca.outcome = 'live'
ORDER BY ba.email DESC;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;

