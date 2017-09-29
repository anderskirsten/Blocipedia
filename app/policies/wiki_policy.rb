class WikiPolicy < ApplicationPolicy
    class Scope
        attr_reader :user, :scope
        
        def initialize(user, scope)
            @user = user
            @scope = scope
        end
        
        ## REFACTOR - NOT WORKING
#        def resolve
#            if user.role == 'admin'
#                scope.all
#                
#            elsif user.role == 'premium'
#                scope = wiki.private == false + wiki.user == user + wiki.collaborators.pluck(:user_id).include?(user.id)
#                
#            else #conditions for 'standard' user
#                scope = wiki.private == false + wiki.collaborators.pluck(:user_id).include?(user.id)
#            end
#        end
        
        def resolve
            wikis = []
            
            if user.role == 'admin'
                wikis = scope.all
                
           elsif user.role == 'premium'
                all_wikis = scope.all
                
                all_wikis.each do |wiki|
                    if wiki.private == false || wiki.user == user || wiki.collaborators.pluck(:user_id).include?(user.id)
                        wikis << wiki
                    end
                end
                
            else #conditions for 'standard' user
                all_wikis = scope.all
                
                all_wikis.each do |wiki|
                    if wiki.private == false || wiki.collaborators.pluck(:user_id).include?(user.id)
                        wikis << wiki
                    end
                end
            end
            wikis
        end
    end
end