class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_many :teams
  has_many :players, through: :teams


  def self.create_from_github_data(provider_data)
    # binding.pry
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create! do |user|
      user.email = provider_data.info.email || "github@test.com"
      user.password = Devise.friendly_token[0, 20]
    end
  end



end
