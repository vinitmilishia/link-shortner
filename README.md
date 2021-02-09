# README

## Installation

This app requires Ruby installed and the ability to install gems.
Ruby >= 2.6 should be used

Run `bundle install` after checking out this project

## The Application

The intent of this application is to build out a "link shortener". That is,
an API that receives a URL and outputs a "shortened" version of it.

How detailed you want to get is up to you. The idea here is to demonstrate how
you would write code in your professional day-to-day at work.

It is not intended to take up too much of your time, so you may also add your own
notes on what you _would_ do if you had more time.

This is also however not intended to be done as quickly as possible (eg: using rails scaffolding),
It is intended to display the level of detail you would put into any problem that you tackle,
and if that level of detail is too effortful or time consuming, please just write
what you would do

Things to consider:

- Is your test suite passing and is your test coverage of the work you're performing adequate?
- Should this be a multi-tenant application? (you can decide either way)
- What algorithm should you use for generating new URL slugs?

## Requirements

You can run the existing test suite using `rails test`. It will fail to start.

You are expected to:

1. Design the datamodel you think is required to solve the link shortening system
2. Test and commit your code as you would for a production quality system
3. Document any assumptions you've made that may not be obvious
4. Mention any design decisions you would make if this were a production system, but that would take too long to implement
