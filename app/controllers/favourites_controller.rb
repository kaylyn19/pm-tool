class FavouritesController < ApplicationController
    before_action :project_params
    before_action :authenticate!

    def create
        # @project = Project.find params[:project_id]
        @favourite = Favourite.new(user_id: current_user.id, project_id: @project.id)
        if @favourite.save
            redirect_to project_path(@project), notice: "Favourite Added!"
        else
            redirect_to index_path, alert: "Unable to add Favourite"
        end
    end

    def destroy
        # @project = Project.find params[:project_id]
        @favourite = @project.favourites.find_by(user_id: current_user.id)

        return redirect_to index_path, alert: "Not Authorized!" unless can?(:favourite, @project)
        if @favourite.destroy
            redirect_to @project, notice: "Un-favourited!"
        else
            redirect_to index_path, alert: "Unable to unfavourte the project"
        end
    end

    private

    def project_params
        @project = Project.find params[:project_id]
    end
end
