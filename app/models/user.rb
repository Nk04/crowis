class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  # association
  has_many :complaints
  has_many :comments
  has_many :empathy

  # validation
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nick_name
    validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }, confirmation: true
  end
end
