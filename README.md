# Solid STOOL

**S**ynchronized **T**ask **O**rganization for **O**perational **L**eadership

Solid STOOL is a Ruby on Rails gem designed to keep your administrative tasks flowing smoothly. It provides a robust system for creating, assigning, and managing tasks for admins of your Rails application.

## Acknowledgments

Solid STOOL is inspired by the excellent [Solid Queue](https://github.com/basecamp/solid_queue) and [Solid Cache](https://github.com/rails/solid_cache) gems. We aim to provide a similarly robust and efficient solution for admin task management in Rails applications.

Remember, with Solid STOOL, your admin team will always maintain a healthy flow of tasks, ensuring nothing gets stuck in the pipeline!

[![Gem Version](https://badge.fury.io/rb/solid_stool.svg)](https://badge.fury.io/rb/solid_stool)
[![Build Status](https://travis-ci.org/gremglee/solid_stool.svg?branch=main)](https://travis-ci.org/gremglee/solid_stool)

## Features

- Centralized storage of administrative tasks in your existing database
- User-friendly UI for creating, assigning, and managing admin tasks
- Task prioritization and deadline management
- Admin-to-admin task assignment capabilities
- Built-in notification system for task updates
- Reporting and analytics on task completion and efficiency

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'solid_stool'
```

Then execute:

```
$ bundle install
```

## Usage

### Basic Setup

Run the installation generator:

```
$ rails generate solid_stool:install
```

This will create the necessary migrations and configuration files.

### Mounting the UI

Mount the Solid STOOL engine in your `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount SolidStool::Engine => "/admin/tasks"
end
```

Now you can access the admin task management UI at `/admin/tasks`.

### Creating Tasks

Admins can create tasks for themselves or other admins through the UI. Here's an example of how to programmatically create a task:

```ruby
SolidStool::Task.create(
  title: 'Review New User Signups',
  description: 'Check and approve new user registrations from the past 24 hours',
  assigned_to: User.find_by(email: 'admin@example.com'),
  due_date: 1.day.from_now,
  priority: :high
)
```

### Task Management

Admins can view, edit, and complete tasks through the UI. They can also reassign tasks to other admins as needed.

## Configuration

Configure Solid STOOL in an initializer:

```ruby
# config/initializers/solid_stool.rb
SolidStool.configure do |config|
  config.admin_roles = ['super_admin', 'moderator']
  config.notification_method = :email
  config.task_categories = ['User Management', 'Content Moderation', 'System Maintenance']
end
```

## Authorization

By default, Solid STOOL checks for an `admin?` method on the current user. You can customize this behavior:

```ruby
# config/initializers/solid_stool.rb
SolidStool.configure do |config|
  config.admin_check = ->(user) { user.has_role?(:admin) || user.has_role?(:moderator) }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gremglee/solid_stool.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
