class Project < ActiveRecord::Base
	has_many :tasks
	has_and_belongs_to_many :users, :join_table => "users_projects"
  accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => proc { |attribute| attribute[:name].blank?  }
end
