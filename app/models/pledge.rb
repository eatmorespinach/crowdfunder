class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :user_id, :project_id, presence: true
  validates :amount, numericality: {greater_than: 0, only_integer: true}, presence: true
end
