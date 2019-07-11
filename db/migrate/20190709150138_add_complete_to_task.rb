class AddCompleteToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :complete, :boolean, default:false
    add_reference :tasks, :project, foregin_key: true
    add_column :tasks, :description, :text
  end
end
