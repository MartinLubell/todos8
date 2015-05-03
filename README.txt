Our assignment #7 is deployed at:

http://jhu-spring15-team4-todos.herokuapp.com

As of 4/20/15, we were having a technical difficulty running the
“heroku run rake db:migrate” command, due probably with a difference
between the sqlite and postgres database. On our local servers, running
sqlite, we have no problems running the “rake db:migrate” command.

However, Jason Rice from our class came up with a solution that worked!
Before the migrate and seed commands, he added the following one:

heroku run rake db:reset