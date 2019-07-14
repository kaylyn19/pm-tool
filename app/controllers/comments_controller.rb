# class CommentsController < ApplicationController
#     def create
#         @project = Project.find params[:project_id]
#         @discussion = Discussion.find params[:discussion_id]
#         @comment = Comment.new comment_params
#         @comment.discussion = @discussion
#         if @comment.save
#             redirect_to @project, notice: "Commented on the discussion!"
#         else
#             redirect_to @project, alert: "Comment submission failed!"
#             # project_discussion_comment_path(@project)
#         end
#     end

#     def destroy
#     end

#     def edit
#     end

#     def update
#     end

#     private

#     def comment_params
#         params.require(:comment).permit(:body)
#     end
# end
