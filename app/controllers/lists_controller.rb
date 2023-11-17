class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    # @review = Review.new(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :picture)
  end
      # before_action :set_list, only: [:show]

      # def index
      #   @lists = List.all
      # end

      # def new
      #   @list = List.new
      # end

      # def show
      # end

      # def create
      #   @list = List.new(list_params)
      #     if @list.save
      #       redirect_to lists_path(@list) # on repasse par la methode de controller index
      #     else
      #       render :new, status: :unprocessable_entity # on va directement à ma page new.html.erb
      #     end
      # end

      # private

      # def set_list
      #   @list = List.find(params[:id])
      # end

      # def list_params
      #   params.require(:list).permit(:name)
      # end
end
