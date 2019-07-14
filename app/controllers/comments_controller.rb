class CommentsController < ApplicationController
    before_action :find_id, except: [:create]
    before_action :authenticate!

    def create
        @discussion = Discussion.find params[:discussion_id]
        @comment = Comment.new comment_params
        @comment.discussion = @discussion
        if @comment.save
            redirect_to @discussion, notice: "Commented on the discussion!"
        else
            redirect_to @discussion, alert: "Comment submission failed!"
            # project_discussion_comment_path(@project)
        end
    end

    def destroy
        # @comment = Comment.find params[:id]
        if @comment.destroy
            redirect_to discussion_path(@comment.discussion_id), notice: 'Comment successfully deleted!'
        else
            render :edit
        end
    end

    def edit
        # @comment = Comment.find params[:id]
        @discussion = Discussion.find params[:discussion_id]
    end

    def update
        # @comment = Comment.find params[:id]
        if @comment.update comment_params
            redirect_to discussion_path(@comment.discussion_id)
        else
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

    def find_id
        @comment = Comment.find params[:id]
    end
end
