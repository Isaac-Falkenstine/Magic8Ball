class User < ApplicationRecord

  has_many :advices

  validates_presence_of :name,
                        :email

  validates :email, uniqueness: true

  has_secure_password validations: false

end
