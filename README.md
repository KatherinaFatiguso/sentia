# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-linux]
  
* Rails version 
  Rails 6.0.0
  
* System dependencies

* Configuration<br>
PostGreSQL role: rails_dev
PostGreSQL password: pass123
<br>
In the PostGres Terminal, password: postpass

* Deployment instructions<br>
You must populate the database in the following order:<br>
1. applications table
2. locations table
3. people table

Use the following rails command:
To populate the applications table:<br>
2.6.5 :001 > Application.import<br>
2.6.5 :001 > reload!<br>
<br>
To populate the locations table:<br>
2.6.5 :001 > Location.import<br>
2.6.5 :001 > reload!<br>
<br>
To populate the people table:<br>
2.6.5 :001 > Person.import<br>
2.6.5 :001 > reload!<br>

Once all tables are populated, run local server and then you can view the browser:
http://localhost:3000/people?search=&commit=Search

The column sort is for the First Name column only.
The pagination is for up to 10 items in the row.
The Search box is to look for values in Affiliations column only.

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)



* ...
# sentia
