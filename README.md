# FirstPDP

[![Build Status](https://semaphoreci.com/api/v1/ilkham-gaysin/first-pdp/branches/master/shields_badge.svg)](https://semaphoreci.com/ilkham-gaysin/first-pdp)
[![Code Climate](https://codeclimate.com/github/IlkhamGaysin/first-pdp/badges/gpa.svg)](https://codeclimate.com/github/IlkhamGaysin/first-pdp)
[![Test Coverage](https://codeclimate.com/github/IlkhamGaysin/first-pdp/badges/coverage.svg)](https://codeclimate.com/github/IlkhamGaysin/first-pdp/coverage)

## Project description
My first PDP based on Rails Base app.

## Initializers

* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Getting Started

### Prepare dependencies

Some gems have native extensions.
You should have GCC installed on your development machine.

* `qt` - to run specs with [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit)
* `phantomjs198` - to run Javascript unit tests
* `graphviz` - to generate Entity-Relationship Diagram

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

### Bootstrap application

1. Clone application as new project with original repository named "rails-base". We use depth parameter here in order not to copy the history of changes in base project

   ```bash
   git clone git@github.com:IlkhamGaysin/first-pdp.git
   ```

2. Go to app folder

  ```bash
  cd first-pdp
  ```

3. Create .env file for environment

  ```bash
  cp .env.example .env
  ```
3. Run setup script

  ```bash
  bin/setup
  ```

4. Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.

  ```bash
  bin/ci
  ```

5. Run app

  ```bash
  bin/server
  ```


Continuous Integration
-

[Semaphore](https://semaphoreci.com/ilkham-gaysin/first-pdp)


Production
-

[Heroku production](https://first-pdp-practice.herokuapp.com)

Third-party services
-

[CodeClimate](https://codeclimate.com/github/IlkhamGaysin/first-pdp)

[<img src="http://www.flatstack.com/logo.svg" width="100"/>](http://www.flatstack.com)
