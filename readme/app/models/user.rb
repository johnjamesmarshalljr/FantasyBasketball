class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_many :teams
  has_many :players, through: :teams

  validates :password, :presence => true,
                        :confirmation => true,
                        :length => {:within => 6..40},
                        :on => :create

  validates :email, uniqueness: true
  validates :email, presence: true

  def self.create_from_github_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create! do |user|
      user.email = provider_data.info.email || "github@test.com"
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
