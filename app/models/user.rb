class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image

  validates :email, presence: true

  # Search method
  def self.search(keyword)
    if keyword
      where(["name LIKE ?", "%#{keyword}%"])
    else
      all
    end
  end
end
