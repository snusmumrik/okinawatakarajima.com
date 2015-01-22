class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  acts_as_paranoid

  validates :name, :email, :text, presence: true
end
