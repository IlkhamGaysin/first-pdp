# FirstPDP
[![Build Status](https://semaphoreci.com/api/v1/ilkham-gaysin/first-pdp/branches/master/shields_badge.svg)](https://semaphoreci.com/ilkham-gaysin/first-pdp)
[![Code Climate](https://codeclimate.com/github/IlkhamGaysin/first-pdp/badges/gpa.svg)](https://codeclimate.com/github/IlkhamGaysin/first-pdp)
[![Test Coverage](https://codeclimate.com/github/IlkhamGaysin/first-pdp/badges/coverage.svg)](https://codeclimate.com/github/IlkhamGaysin/first-pdp/coverage)

## Project description

My first PDP based on Rails Base app.

Implemented user stories:

* Visitor can sign up.
* Visitor can sign in.
* Visitor can recover his/her password.
* Visitor can observe articles on main page of project (paginated and sorted by recent).
* Visitor can send Email via Contact form.
* Visitor can view About Us page.
* User can sign out.
* User can upload profile picture.
* User can create an article with necessary fields: Title, Text.
* User can leave comments to articles with single Text field.
* User can edit article created by this user.

## Dependencies

* PostgreSQL 9.5
* Ruby 2.3.0
* PhantomJS
* Rails 4

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

## Quick Start

```bash
# clone repo
git clone git@github.com:IlkhamGaysin/first-pdp.git
cd first-pdp

# run setup script
bin/setup

# configure ENV variables in .env
vim .env

# run server on 5000 port
bin/server
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

## Production

* http://first-pdp-practice.herokuapp.com
