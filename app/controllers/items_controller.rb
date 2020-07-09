class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :set_items, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.trading_status = 1
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      @item.images.new
      render :new
    end
  end

  def edit
    #カテゴリーデータ取得
    @grandchild_category = @item.category
    @child_category = @grandchild_category.parent
    @category_parent = @child_category.parent

    #カテゴリー一覧を作成
    @category = Category.find(params[:id])
    # 紐づく孫カテゴリーの親（子カテゴリー）の一覧を配列で取得
    @category_children = @item.category.parent.parent.children
    # 紐づく孫カテゴリーの一覧を配列で取得
    @category_grandchildren = @item.category.parent.children
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: '商品情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def item_params
    params.require(:item).permit(:name, :price,
      :introduction, :user_id, :condition, :trading_status, 
      :shipping_area, :shipping_days, :shipping_price, :category_id, :brand, images_attributes: [:src, :_destroy, :id])
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

end
