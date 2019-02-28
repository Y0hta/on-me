class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image
  
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  # Search method
  def self.search(keyword)
    if keyword
      where(["lower(name) LIKE ?", "%#{keyword.downcase}%"]).or(where(["lower(occupation) LIKE ?", "%#{keyword.downcase}%"]))
    else
      all
    end
  end

  # Generate token
  def token
    Digest::SHA1.hexdigest("#{self.created_at} - #{self.id}")[0,16]
  end
end
