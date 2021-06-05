# Venuerific Code Assignment

Create a simple app for blog using Ruby on Rails. This application is made to fulfill the assigment test at Venuerific.

## Overview

Blog post is a web application that use Ruby on Rails 6. The application provide end-user to read posts created by some users.

# Techs

* Ruby 3.0.1
* Rails 6.1.3.2
* Node & NPM & Yarn
* PostgreSQL
* Devise
* Start Bootstrap
* Heroku CLI

# Run on local

* You need to have the techs above this.
* Clone or download the repo and go to the directory
* Run `bundle install && yarn install`
* Copy .env.example and set the values
* Run `rails db:reset`
* Run `rails s` or `rails server`
* You can log in as first admin (email: admin@example.com, password: admin123)


## Features

* Regular user can sign in & sign up
* User authorization
* Admin can do anything
* Posts scoped only for Published post
* Posts scoped by ownership inside backpanel
* Use Start Bootstrap as design template (Both panel)
* Simple pagination for post collection

## App

[Blog post Front panel](https://venuerific-code-assignment.herokuapp.com/)

[Blog post Back Panel](https://venuerific-code-assignment.herokuapp.com/admin)

# Version

1.0.0

# Best Practices

* Use indexing, unique, default, and references on migration.
* Best to put ordering, scoped, and validation on model.
* Use includes to avoid queries N+1
* Use helper to minimize code in views
* Minimalize code on controller, make some method to separate some code, make easier to read
* DRY (Don't Repeat Yourself) in form, always using partial.

# TODO

* Use better pagination such as kaminari and pagy
* More minimalize code
