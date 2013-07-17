class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects

  validates :first_name, :last_name, :email, presence: true
end
