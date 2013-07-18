class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :user_id, :project_id, presence: true
  validates :amount, presence: true, numericality: {only_integer: true}
end
