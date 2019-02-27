class Advice < ApplicationRecord

  belongs_to :user

  validates_presence_of :body

  def added_time
    created_at.to_s.split(" ").first
  end
end
