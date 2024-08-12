module SolidStool
  class Task < ApplicationRecord
    belongs_to :assigned_to, class_name: 'User'
    belongs_to :created_by, class_name: 'User'

    validates :title, presence: true
    validates :priority, inclusion: { in: %w(low medium high) }
    validates :status, inclusion: { in: %w(pending in_progress completed) }

    scope :pending, -> { where(status: 'pending') }
    scope :in_progress, -> { where(status: 'in_progress') }
    scope :completed, -> { where(status: 'completed') }
  end
end
