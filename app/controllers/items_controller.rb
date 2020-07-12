class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]
  before_action :set_items, only: [:edit, :update, :destroy, :show]
  before_action :set_category, only: [:new, :create, :edit, :update]
  before_action :set_category_child, only: [:edit, :update]
  before_action :set_category_grandchild, only: [:edit, :update]
  before_action :set_category_id, only: [:edit, :update, :show]
  def index
    @items_category = Item.includes(:images).order('created_at DESC').limit(4)
    @items_brand = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), notice: '商品を出品しました'
    else
      # 再度画像選択できるようにする
      @item.images = []
      @item.images.new
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '出品情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: '出品をキャンセルしました'
  end

  def show
    @user = User.find(@item.user_id)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :price,
      :introduction, :user_id, :condition, :trading_status, 
      :shipping_area, :shipping_days, :shipping_price, :category_id, :brand, images_attributes: [:src, :_destroy, :id])
      .merge(user_id: current_user.id, trading_status: 1)
  end

  # itemをDBから取得
  def set_items
    @item = Item.find(params[:id])
  end

  # 親カテゴリの一覧作成
  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 子カテゴリの一覧作成(edit,update用)
  def set_category_child
    @category_children_array = @item.category.parent.parent.children
  end

  # 孫カテゴリの一覧作成(edit,update用)
  def set_category_grandchild
    @category_grandchildren_array = @item.category.parent.children
  end

  #カテゴリーデータ取得(edit,update用)
  def set_category_id
    @grandchild = @item.category
    @child = @grandchild.parent
    @parent = @child.parent
  end

end
