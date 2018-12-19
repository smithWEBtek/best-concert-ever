class User < ActiveRecord::Base
  
  has_many :reviews
  has_many :concerts, through: :reviews
  
  validates :email, presence: true, uniqueness: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end
  
  #scope method (return the users best concert ever)
  def best_concert
    reviews.order(rating: :desc).limit(1).first && reviews.order(created_at: :asc).last 
  end
  
end
