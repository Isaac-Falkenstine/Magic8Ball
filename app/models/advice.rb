class Advice < ApplicationRecord

  belongs_to :user

  validates_presence_of :body
end
