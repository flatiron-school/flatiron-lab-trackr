# Flatiron Lab Trackr

A Rails app for Flatiron instructors to aggregate student PRs and review student code. You can add a lab to your cohort and grab that lab's PRs. View all PRs for a given lab or view all PRs for a given student. Toggle PR view by directory or file to better compare student's work in various areas. 

## Contributing

* Fork and clone this repo to get started.
* It runs Rails 5 beta 4 and Ruby 2.3.0. Make sure you have Ruby 2.3.0 installed before bundling. 
* Runs on Postgres database, `brew install postgresql` if you haven't done so already. 
* `rake db:create; rake db:migrate; rake db:seed`. 
* Run `figaro install` to generate the `application.yml` and append it to the .gitignore. Put your GitHub secrts here:

```ruby
OCTO_TOKEN: <XXXXXXXXXXXXXXXXX>
GITHUB_USERNAME: <XXXXXXXXXXXXXXX>
GITHUB_PASSWORD: <XXXXXXXXXXXXXX>
```
* IMPORTANT: Test suite uses Puffing Billy gem to stub API calls made from the client-side. THIS GEM IS NOT WORKING WITH RAILS 5 BETA 4. To run the test suite, make sure the Puffing Billy gem is uncommented out in the Gemfile, bundle install then run rspec. To run the server in development, comment out the Puffing Billy gem and bundle install. 

### Tips

* most of the magic happens in `app/adapters/adapter.rb`, where `Adapters::GitHubWrapper` is defined. This class uses Octokit client to get pull requests for a given repo, get and instantiate files for given pull request. 
* Paperclip gem is used to allow for csv file uploads. When creating a new cohort, upload the CSV roster and the cohort's students will be created and persisted, along with their github usernames. 
* Ajax and jQuery on the front-end to support "view PR files by file or directory" options on lab and student show page. (this could use some refactorings)