# User
class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :authentication_token, presence: true
  before_validation :generate_token

  def generate_token
    return if authentication_token
    self.authentication_token = Devise.friendly_token
  end
end
