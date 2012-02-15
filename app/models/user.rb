class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :authentications, :dependent => :delete_all
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def apply_omniauth(auth)
		self.email = auth['info']['email']
		self.name = auth['info']['name']
		authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
	end       

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
