class Task < ActiveRecord::Base
  include Sluggable

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :body, presence: true, length: { minimum: 3 }
  validates :user_id, presence: true

  sluggable_column :title
end