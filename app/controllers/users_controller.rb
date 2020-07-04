class UsersController < ApplicationController
  def edit
    # データベースにクレジットデータが存在する場合は@creditに該当データが入る
    # まだなければ@creditにnilが入る
    @credit = nil
    if Credit.exists?(params[:user_id])
      @credit = Credit.find(params[:user_id])
    end
  end
end
