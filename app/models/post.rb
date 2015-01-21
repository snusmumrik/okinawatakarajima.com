class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images

  acts_as_paranoid

  validates :name, :title, :text, presence: true
end
