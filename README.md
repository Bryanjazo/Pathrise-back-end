# Instructions
Please make sure to follow step by step. numbers of steps will be provided to help guide the startup process.
 
## Step 1
 
Please make sure your gemfile is up to date by inputting it into your terminal.
 
#### `bundle install`
 
## Step 2
 
Next, make sure your database is migrated with the correct tables by inputting.
 
#### `rails db:migrate`
 
This will allow you to continue with the next steps.
 
## Step 3
 
Now feel free to seed your database to enable you to have all of the information needed for your front-end. This may take a while due to the large seeding structure going on from the CSV file.
 
### Please Input
 
#### `rails db:seed`
 
## Final step
 
Now feel free to start your server by typing.
 
#### `rails s or rails server`
 
This will start your server.
 
 
## For front-end please visit (https://github.com/Bryanjazo/Pathrise-front-end)
 
Steps on starting the repo will be in the ReadMe.
 
# Job_source Logic
Please refer to `app/models/api/v1/job_source.rb` to see the logic being used to create a job source. I structured the files this way `api/v1/etc` to enable newer versions to be later on released if the company decides to upgrade or improve their API.
Moving on... for this logic I decided to use a two-pointer method by this I’m able to control my algorithm better. This allows me to continue my logic. I traverse through `Api::V1::JobOpportunity` and `Api::V1::JobBoard`. once this happens my first pointer || index starts at the first `JobOpportunity` then my other pointer iterates through all the `JobBoards` and tries to find a match between the URLs domain. If the algorithm doesn’t match any `JobBoards` it will create a job_source with the job_source name as `'Unknown'` This allows all the default categories to be filled with no issues. If it does, it creates a job source and puts the job source name from the company it matched with. and finally if it has a URL that is `nil` it creates a `job_url` and `job_source` that are both `'Unknown'` since it cant find a match between companies. As you also see is that if the categories match it’ll check if the job post URL exists in the database allowing for duplicates to be removed since every URL for every job post has to be unique. Lastly, if all the categories match it’ll move up to the next job opportunity and will re-start the job board to the beggining which is resetting it to `0`. This will continue until the `JobOpportunity` count is less than the start1 pointer.
 
# Why its effective.
 
Time complexity wise its more effective than using two for loops. Also, two for loops decreases control and increases room for erros and takes more time to handle the correct algorithm to make things work.
 
# Gems/packages used.
{
gem 'rack-cors'
gem 'csv'
gem 'pry'
}
### Why..?
 
I used `rack-cors` to enable security between each request and set the config file to enable '*' which is all requests to be allowed. This enables my application to run secure while allowing my front-end to make valid requests.
 
I used `CSV` to allow my application to parse through the csv file provided and extracts the data the way I need it to to make a `job_source`. this extracts the correct data for me.
 
I used `pry` which allows me to debug errors by providing me with insight on params what each variable means and what’s going on.
 
# CSV File.
 
To get updated job source csv file please navigate to `http://localhost:3001/api/v1/job_sources`
 
 
# Job Source Count representation.


{
    "Google" => 117,
    "Glassdoor" => 164,
    "Angelist" => 87,
    "LinkedIn" => 5722,
    "Dribble" => 0,
    "Indeed" => 776,
    "Triplebyte" => 10,
    "Hired" => 22,
    "Wayup" => 0,
    "YCombinator Jobs" => 0,
    "Work At A Startup" => 4,
    "Jopwell" => 0,
    "Tech Ladies" => 2,
    "Intern Supply" => 0
    "Underdog" => 0
    "Stella" => 0
    "ZipRecruiter" => 51,
    "SimplyHired" => 0,
    "Gamasutra" => 0,
    "Huntr" => 0,
    "Lever" => 1617,
    "Greenhouse" => 2056,
    "Monster" => 4,
    "Github" => 0,
    "Stackoverflow" => 2,
    "Employbl" => 0,
    "Who Is Hiring?" => 0,
    "Jobvite" => 265,
    "SmartRecruiters" => 59,
    "Government Jobs" => 1
}