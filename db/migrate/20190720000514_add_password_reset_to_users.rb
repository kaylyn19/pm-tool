class AddPasswordResetToUsers < ActiveRecord::Migration[5.2]
  def change
    # rails g migration add_password_reset_to_users reset_password_token:token
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_index :users, :reset_password_token, unique: true
  end
end
