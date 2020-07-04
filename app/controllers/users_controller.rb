class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  def edit
    # データベースにクレジットデータが存在する場合は@creditに該当データが入る
    # まだなければ@creditにnilが入る
    @credit = nil
    if Credit.exists?(params[:user])
      @credit = Credit.find(params[:user])
    end
  end

private

def correct_user
  user = User.find(params[:id])
  redirect_to root_path, alert: '他の人のマイページには飛べません' if user.id != current_user.id
end

end
