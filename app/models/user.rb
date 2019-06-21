class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    validates :encrypted_password, presence: true, length: { maximum:100, minimum: 6}
    validates :email, presence:true, length: { maximum: 255 }, format:{ with: URI::MailTo::EMAIL_REGEXP}, uniqueness: { case_sensitive: false }

    has_many :workouts

end
