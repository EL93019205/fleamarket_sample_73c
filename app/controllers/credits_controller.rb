class CreditsController < ApplicationController
  require "payjp"
  before_action :authenticate_user!
  before_action :dont_other_user_new, only: [:new, :create]
  before_action :dont_other_user_edit, only: [:edit, :update]
  before_action :set_user, only: [:new, :create, :edit, :update]
  before_action :set_credit, only: [:edit, :update]

  def new
    gon.public_key = Rails.application.credentials[:payjp][:public]
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:private]
    if params["payjp-token"].blank?
      redirect_to edit_user_path(@user), error: 'クレジットカードを登録してください'
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp-token"],
        metadata: {user_id: current_user.id }
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to edit_user_path(@user), notice: 'クレジットカード情報を登録しました'
      else
        render :new, error: "クレジットカード情報が正しくありません"
      end
    end

  end

  def edit
  end

  def update
    if @credit.update(credit_params)
      redirect_to edit_user_path(@user), notice: 'クレジットカード情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    card = current_user.credit
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to edit_user_path(current_user.id), notice: "クレジットカード情報を削除しました"
  end

  private

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

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_credit
    @credit = Credit.find(params[:id])
  end

end
