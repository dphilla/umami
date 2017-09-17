class Admin::ItemsController < Admin::BaseController
  before_action :require_admin

  def index
    @items = Item.order(:status)
  end

  def new
    @item = Item.new
    @tags = Tag.all
  end

  def create
    @item = Item.new(item_params)
    @tags = Tag.all
    if @item.save
      flash[:notice] = "#{@item.name} Created."
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, tag_ids: [])
  end

end
