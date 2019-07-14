class AddCommentReferenceToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :discussion, foreign_key: true
    add_reference :discussions, :project, foreign_key: true
  end
end
