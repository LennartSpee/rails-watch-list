class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  def new
   @list = List.new
  end

  def index
    @lists = List.all
  end

  def show
  end

  def create
    @lists = List.new(lists_params)

    if @lists.save
      redirect_to @lists, notice: 'List was successfully created.'
    else
      render :new
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:title, :overview, :rating)
    end
end
