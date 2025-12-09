class Parent < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :line_user_id, presence: true, uniqueness: true
end
