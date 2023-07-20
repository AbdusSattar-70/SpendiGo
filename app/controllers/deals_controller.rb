class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @user_deals = @category.deals.where(author_id: current_user.id).order(created_at: :desc)
  end

  def show; end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(name: deals_params[:name], amount: deals_params[:amount])

    @deal.author_id = current_user.id
    if @deal.save
      CategoriesDeal.create(deal: @deal, category_id: deals_params[:category_id])
      flash[:success] = 'Payment succesful'
      redirect_to edit_category_deal_path(category_id: deals_params[:category_id], id: @deal.id)

    else
      flash[:error] = 'Error: payment could not be added'
      render :new
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    flash[:notice] = 'Payment removed successfully'
    redirect_to category_deals_path
  end

  private

  def deals_params
    params.require(:deal).permit(:name, :amount, :category_id, :author_id)
  end
end
