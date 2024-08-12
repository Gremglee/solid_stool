require "solid_stool/version"
require "solid_stool/engine"

module SolidStool
  mattr_accessor :admin_roles
  @@admin_roles = ['admin']

  mattr_accessor :notification_method
  @@notification_method = :email

  mattr_accessor :task_categories
  @@task_categories = ['General']

  mattr_accessor :admin_check
  @@admin_check = ->(user) { user.respond_to?(:admin?) && user.admin? }

  def self.configure
    yield self
  end
end
