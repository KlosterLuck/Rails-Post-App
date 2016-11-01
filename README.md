# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

VERSION: jobpostsV04_4-Post_Devise_TwoUsers: 
Two Users. Only one (users) can create posts. Users can only edit,delete and create their own.

VERSION: jobpostsV04_4.1-Post_Devise_TwoUsers: 
Same as above. But employers are now the only one who can create posts.

VERSION: jobpostsV04_5-Post_Devise_TwoUsers_With_Categories:
Now with Test Categories.
Added admin to users and employer. (user.admin, employer.admin)
Added Jobtypes (Categories) to posts. Employer.Admin can edit and create new jobtypes.

VERSION: jobpostsV04_6-Post_Devise_TwoUsers_With_Categories_And_Search:
* http://www.korenlc.com/creating-a-simple-search-in-rails-4/ Simple search created with this
* https://blog.skcript.com/implementing-categories-in-ruby-on-rails-14c2b5e77b34#.atuo9g9mc

****
Issues: 
* Users and employers can sign up with same email
* current_employer.admin? gives trouble. Replace with current_employer.try(:admin?)
* Can't delete jobtypes
 