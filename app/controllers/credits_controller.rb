class CreditsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  def new
    @user = User.find(params[:user_id])
    @credit = Credit.new
  end

  def create
    user = User.find(params[:user_id])
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to edit_user_path(user), notice: 'クレジットカード情報を登録しました'
    else
      render :new, alert: "クレジットカード情報の登録に失敗しました"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @credit = Credit.find(params[:user_id])
  end

  def update
    @credit = Credit.find(params[:user_id])
    if @credit.update(credit_params)
      redirect_to edit_user_path(@credit), notice: 'クレジットカード情報を更新しました'
    else
      render :edit, alert: "クレジットカード情報の更新に失敗しました"
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:card_fullname, :card_number, :expiration, :security_code).merge(user_id: params[:user_id])
  end

  def correct_user
    user = User.find(params[:user_id])
    redirect_to root_path, alert: '他の人のクレジット編集ページには飛べません' if user.id != current_user.id
  end

end
