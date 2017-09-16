class Admin::ItemsController < Admin::BaseController
  before_action :require_admin
  before_action :set_backup_image, only: [:create, :update]

  def index
    @items = Item.order(:status)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if params[:item][:tag_ids].count == 1
      @item.errors.add(message: "Item must have at least one tag")
      redirect_to new_admin_item_path
    else
      if @item.save
        flash[:notice] = "#{@item.name} Created"
        redirect_to item_path(@item)
      else
        redirect_to new_admin_item_path
      end
    end
  end

  def edit

  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, tag_ids: [])
  end

  def set_backup_image
    if params[:item][:image].empty?
      params[:item][:image] = "http://img.providr.com/n-SALT-628x314.jpg"
    end
  end

end
