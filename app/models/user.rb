class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  attachment :image
  
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  is_impressionable

  # Omniauth callback
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end 

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
