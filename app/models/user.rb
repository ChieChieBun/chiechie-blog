class User < ApplicationRecord
  has_secure_password
  validates :role, presence: true
  validates :role, inclusion: { in: ['admin', 'guest','owner']}
  has_many :journals

  def self.username_list
    pluck(:username)
  end
end
