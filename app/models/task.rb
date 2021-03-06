class Task < ActiveRecord::Base
  belongs_to :user
  has_one :recurrence, dependent: :destroy

  attr_accessible :time_expression, :action, :description, :user_id

  validates :time_expression, :action, :user_id, presence: true

  scope :by_next_at, -> { joins(:recurrence).order('next_at asc') }
end

