class Group < ActiveRecord
  belongs_to :user
  validates :title, presence: true
end
