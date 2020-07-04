class CreditsController < ApplicationController
  before_action :authenticate_user!
  before_action :dont_other_user_new, only: [:new, :create]
  before_action :dont_other_user_edit, only: [:edit, :update]

  def new
    @user = User.find(params[:user_id])
    @credit = Credit.new
  end

  def create
    @user = User.find(params[:user_id])
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to edit_user_path(@user), notice: 'クレジットカード情報を登録しました'
    else
      render :new, alert: "クレジットカード情報の登録に失敗しました"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @credit = Credit.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @credit = Credit.find(params[:id])
    if @credit.update(credit_params)
      redirect_to edit_user_path(@user), notice: 'クレジットカード情報を更新しました'
    else
      render :edit, alert: "クレジットカード情報の更新に失敗しました"
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:card_fullname, :card_number, :expiration, :security_code).merge(user_id: params[:user_id])
  end

  def dont_other_user_edit
    # アクセスIDとログインIDが不一致
    if params[:user_id].to_i != current_user.id
      redirect_to root_path, alert: '他の人のクレジットカード情報は編集できません'
    else
      # クレジットカードが登録されていないのに編集ページに移動しようとした
      if current_user.credit.nil?
        redirect_to root_path, alert: "クレジットカードが登録されていないため編集することができません"
      else
        # アクセスクレジットユーザーIDとログインしている人のクレジットのユーザーIDが不一致
        if params[:id].to_i != current_user.credit.id
          redirect_to root_path, alert: '他の人のクレジットカード情報は編集できません'
        end
      end
    end
  end

  def dont_other_user_new
    # アクセスIDとログインIDが不一致
    if params[:user_id].to_i != current_user.id
      redirect_to root_path, alert: '他の人のクレジットカード情報は登録できません'
    else
      # 既にカード登録済
      if current_user.credit.present?
        redirect_to root_path, alert: '既にクレジットカード登録済みです'
      end
    end
  end

end
