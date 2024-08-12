# Solid STOOL

**S**ynchronized **T**ask **O**ffloading & **O**utput **L**ayer

[![Gem Version](https://badge.fury.io/rb/solid_stool.svg)](https://badge.fury.io/rb/solid_stool)
[![Build Status](https://travis-ci.org/yourusername/solid_stool.svg?branch=main)](https://travis-ci.org/yourusername/solid_stool)

Solid STOOL is a Ruby on Rails gem designed to keep your application's task pipeline regular and prevent any embarrassing data backups. It provides a robust system for storing, managing, and executing tasks in your Rails application.

## Features

- Centralized task storage in your existing database
- Admin interface for creating and managing tasks
- Automated task scheduling and execution
- Seamless integration with ActiveJob
- Built-in monitoring and reporting tools

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'solid_stool'
```

Then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install solid_stool
```

## Usage

### Basic Setup

Run the installation generator:

```
$ rails generate solid_stool:install
```

This will create the necessary migrations and configuration files.

### Creating Tasks

Use the admin interface to create tasks:

```ruby
SolidStool::Task.create(
  name: 'Process Orders',
  cron: '0 * * * *',
  job_class: 'OrderProcessingJob'
)
```

### Executing Tasks

Solid STOOL automatically executes tasks based on their schedule. You can also manually trigger task execution:

```ruby
SolidStool::TaskExecutor.execute_all
```

## Admin Interface

Solid STOOL comes with a built-in admin interface. To access it, mount the engine in your `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount SolidStool::Engine => "/solid_stool"
end
```

Then visit `/solid_stool` in your browser.

## Configuration

You can configure Solid STOOL in an initializer:

```ruby
# config/initializers/solid_stool.rb
SolidStool.configure do |config|
  config.max_retention_period = 7.days
  config.default_queue = :default
  config.admin_auth = -> (request) { request.env["warden"].authenticate! }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yourusername/solid_stool.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Acknowledgments

Solid STOOL is inspired by the excellent [Solid Queue](https://github.com/basecamp/solid_queue) and [Solid Cache](https://github.com/rails/solid_cache) gems. We aim to provide a similarly robust and efficient solution for task management in Rails applications.

Remember, with Solid STOOL, your Rails app will always maintain a healthy flow, from input to output!
