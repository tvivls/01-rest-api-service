The API server has been developed using Ruby On Rails capabilities.

## Starting up the Web Server
1. Install dependencies: `bundle install`
2. Create the database and run migrations: `rails db:create && rails db:migrate`
3. Start the Rails server: `rails s`

## API methods:
*   Creating new users 

`http://localhost:3000/users/new` || `http://localhost:3000/users`
*   Fetching information for a single user 

`http://localhost:3000/users/:user_id`
*   Retrieving a list of all available programs 

`http://localhost:3000/programs`
*   Subscribing a user to a program (a user can't subscribe multiple times to the same program) 

`http://localhost:3000/subscriptions/new` || `http://localhost:3000/subscriptions`
*   Removing a user's subscription to a program 

`http://localhost:3000/subscriptions/:id`
*   Getting a list of programs subscribed by a user 

`http://localhost:3000/subscriptions/user_programs/:user_id`
*   Searching for popular programs: given a string `term` as input. The method should return programs whose `title` contains the `term`. The returned programs are sorted by popularity, which is determined by the number of users subscribed to the program. 

`http://localhost:3000/popular_programs?term=title`












