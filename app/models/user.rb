class User < ApplicationRecord
    has_secure_password
    has_many :projects, dependent: :destroy
    has_many :tasks, dependent: :destroy
    has_many :discussions, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true
    
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
    # before_validation :update_password
    def full_name
        "#{first_name} #{last_name}"
    end

    # def update_password
    #     if params[:user][:password] 
    #       if current_user
    #         @user = User.find(params[:id])
    #         if @user.update_attributes(params[:user])
    #           redirect_to root_path, :notice => "Password has been changed!"
    #         else
    #           render :edit_password 
    #         end
    #       else
    #         # Something else
    #       end
    #     end 
    # end

    # def update_password
    #     @user = User.find params[:id]
    #     if params[:current_password] == @user.Password
    #         @user.update_attributes params[:user]
    #         redirect_to root_path, notice: "Password successfully updated"
    #     else
    #         render :edit_password
    #     end
    # end
end
