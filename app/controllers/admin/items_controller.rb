class Admin::ItemsController < Admin::BaseController
  before_action :require_admin

  def index
    @items = Item.order(:status)
  end

  def new
    @item = Item.new
  end

  def create
    # if params[:item][:image].empty?
    #   params[:item][:image] = "http://img.providr.com/n-SALT-628x314.jpg"
    # end
    # if Item.find_by(name: params[:item][:name])
    #   flash[:notice] = "Item with that name already exists"
    #   redirect_to new_admin_item_path
    # elsif Item.find_by(description: params[:item][:description])
    #   flash[:notice] = "Item with that description already exists"
    #   redirect_to new_admin_item_path
    # elsif params[:item][:tag_ids].count == 1
    #   flash[:notice] = "Item must have at least one tag"
    #   redirect_to new_admin_item_path
    # else
      @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "#{@item.name} Created"
        redirect_to item_path(@item)
      else
        flash[:notice] = "No fields can be empty"
        redirect_to new_admin_item_path
      end
    # end
  end

  def edit

  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, tag_ids: [])
  end

end
