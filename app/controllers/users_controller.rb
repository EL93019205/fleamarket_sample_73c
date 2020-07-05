class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  def edit
    @user = User.find(params[:id])
  end

private

def correct_user
  redirect_to root_path, alert: '他の人のマイページは見れません' if params[:id].to_i != current_user.id
end

end
