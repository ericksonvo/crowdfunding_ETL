-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id,backers_count FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id, COUNT(*)
FROM backers
GROUP BY cf_id
ORDER BY count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT cc.first_name,
	cc.last_name,
	cc.email,
	cam.goal - cam.pledged AS remaining_goal_amount
-- INTO email_contacts_remaining_goal_amount
FROM contacts AS cc
INNER JOIN campaign AS cam
ON (cc.contact_id = cam.contact_id)
WHERE cam.outcome = 'live'
ORDER BY remaining_goal_amount DESC;


-- Check the table

SELECT * FROM email_contacts_remaining_goal_amount


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email,
	b.first_name,
	b.last_name,
	b.cf_id,
	cam.company_name,
	cam.description,
	cam.end_date,
	cam.goal - cam.pledged AS Left_of_Goal
INTO email_backers_remaining_goal_amount
FROM backers AS b
INNER JOIN campaign AS cam
ON (b.cf_id=cam.cf_id)
WHERE cam.outcome = 'live'
ORDER BY b.last_name ASC;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount