class User < ActiveRecord::Base
  include Sluggable

  has_secure_password

  has_many :tasks

  validates :username, presence: true, uniqueness: true, length: {minimum: 3}
  validates :password, presence: true, on: :create, length: { minimum: 5 }

  sluggable_column :username
end