# Campaigns App

To create a campaign, log in and enter the user#show page (click the Username located in the top right corner)

## To Implement 

- dynamic html titles for all the pages
- `Profession` and `Service` for `Expert` users
- Should I write a separate model for `Expert` users altogether?
- Should I write a separate model for `Commenting` on `Discussions` and on `Campaigns`?
- `#store_location` for redirects would be so nice, but I've ran out of time
- `edit` capabilites, for `Users`, `Campaigns`, for everything actually


## To Improve

- restrict the `routes` to the minimum (I lazily used `:resources` for everything (especially for `Users` and `Campaigns`))
- remove unnecessary `controllers`
- refactor `User` and `Campaign` `#index` views with partials
- implement a `before filter` to block not-expert users from creating campaigns directly from the model (now it's just blocked from the controller)
- add way more `validations`, like with `estimate_duration`
- while creating `campaigns` errors are not shown properly
- comments user `hidden_fields` to set the owner, I don't like that and there are more safe ways to implement it

### Tests

- so many tests to implement
- `user_login_test` is incomplete
- test `User status` upon signup

## To Fix

- the flash keeps flashing when it shouldn't anymore, it's something with the redirects and renders and refreshes, easy to fix
- `User has_one Campaign` wasn't working and as a quick fix I set it to `User has_many Campaigns`
- because of `User has_many Campaigns`, `User#show` users a lame `@campaign.first` that should be addressed