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


  def edit
     @item = Item.find(params[:id])
     @tags = Tag.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "#{@item.name} updated."
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, tag_ids: [])
  end

end
