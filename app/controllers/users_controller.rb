class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  def edit
    @user = User.find(params[:id])
  end

private

def correct_user
  user = User.find(params[:id])
  redirect_to root_path, alert: '他の人のマイページには飛べません' if user.id != current_user.id
end

end
