# Campaigns App

To create a campaign, log in and enter the user#show page (click the Username located in the top right corner)

## To Implement 

- dynamic html titles for all the pages
- `Profession` and `Service` for `Expert` users
- Should I write a separate model for `Expert` users altogether?
- Should I write a separate model for `Commenting` on `Discussions` and on `Campaigns`?


## To Improve

- restrict the `routes` to the minimum (I lazily used `:resources` for everything (especially for `Users` and `Campaigns`))
- 

### Tests

- so many tests to implement
- `user_login_test` is incomplete
- test `User status` upon signup

## To Fix
- the flash keeps flashing when it shouldn't anymore, it's something with the redirects and renders and refreshes, easy to fix
- `User has_one Campaign` wasn't working and as a quick fix I set it to `User has_many Campaigns`
- 