class Collaborator < ActiveRecord::Base
    belongs_to :wiki
    belongs_to :user
    
    delegate :email, :to => :user, prefix: true
end
