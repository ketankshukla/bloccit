class User < ActiveRecord::Base

  before_save(on: :name) do
    split_name = self.name.split(' ')
    new_names = []
    split_name.each{|name| new_names << name.capitalize!}
    self.name = new_names.join(' ')
  end

  before_save { self.email = email.downcase }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password
end
