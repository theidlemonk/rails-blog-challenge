class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  
  validates :username, presence: true, format: { with: /\w+@\w+\.\w{2,3}/ }
  validates :password,presence: true, length: { minimum: 6 }
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }

  def full_name
    [self.first_name,self.last_name].join(' ')
  end
end
