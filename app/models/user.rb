class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_and_belongs_to_many :projects, :join_table => "users_projects"
  has_many :authentications, :dependent => :delete_all
  
  accepts_nested_attributes_for :projects, :allow_destroy => true, :reject_if => proc { |attribute| attribute[:name].blank?  }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def apply_omniauth(auth)
		self.name = auth['info']['name']
		authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
	end       

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :projects_attributes, :tasks_attributes
end
