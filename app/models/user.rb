class User < ApplicationRecord
  has_many :journals

  def self.username_list
    pluck(:username)
  end
  
end
