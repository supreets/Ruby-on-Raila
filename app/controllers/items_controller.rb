class ItemsController < ApplicationController
    helper_method :sort_param, :sort_direction
    before_filter :authenticate_user!, :except => [:show,:index]
    
    def new
        @item = Item.new
        @item.item_images.build if @item.item_images.nil?
        
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
            if params[:item_images]
                 params[:item_images]['picture'].each do |i|
                 @item.item_images.create!(:picture => i, :item_id => @item.id)
            end
        end
            redirect_to items_path
        else
            render 'new'
        end
    end
    
    def show
        @item = Item.find_by(id: params[:id])
    end
    
    def destroy
        Item.find_by(params[:id]).destroy
        flash[:success] = "Item Destroyed"
        redirect_to items_path
    end
    
    def index
      
         @items = Item.search(params[:search]).order(sort_param + " " + sort_direction).paginate(:per_page => 10, page: params[:page])
         @categories = Category.all
    end
    
    def edit
    end
    
    def update
    end
    
    def item_params
        params.require(:item).permit(:title, :price, :description, :email, :category_id)
    end
    
    private
    def sort_param
        (["title","price"].include?(params[:sort]))? params[:sort] : "price"
    end
    
    def sort_direction
       direction =  (%w[asc desc].include?(params[:dir]))? params[:dir] : "asc"
    end
end
