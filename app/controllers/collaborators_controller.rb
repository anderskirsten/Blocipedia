class CollaboratorsController < ApplicationController
    before_action :set_wiki
    
    def new
       @collaborator = Collaborator.new 
    end
    
    def create
        @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
        #@user_id = @collaborator.user_id
        #@collaborator_email = (User.find_by_id(@user_id)).email
           
        if @collaborator.save
            flash[:notice] = "#{@collaborator} has been added as a collaborator."
            redirect_to edit_wiki_path(@wiki)
        else
            flash[:alert] = "There was an error adding this collaborator. Please try again."
            redirect_to edit_wiki_path(@wiki)
        end
    end
    
    def destroy
        @collaborator = Collaborator.find(params[:id])
        #@user_id = @collaborator.user_id
        #@collaborator_email = User.find_by_id(@user_id).email
        
        if @collaborator.destroy
            flash[:notice] = "#{@collaborator} has been removed as a collaborator."
            redirect_to edit_wiki_path(@wiki)
        else
            flash[:alert] = "There was an error removing this collaborator. Please try again."
            redirect_to edit_wiki_path(@wiki)
        end
    end
    
    private
    
    def set_wiki
       @wiki = Wiki.find(params[:wiki_id]) 
    end
    
    def collaboration_params
       params.require(:collaborator).permit(:user_id, :wiki_id) 
    end
end
