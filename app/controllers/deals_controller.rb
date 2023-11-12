class DealsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show
    @deal = Deal.find(params[:id])
    @category = @deal.categories.first # Assuming a deal has one category, adjust accordingly

    # Fetch all deals that belong to the same category as the current deal
    @user_deals = @category.deals.where(author_id: current_user.id)
  end

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

  def edit; end

  private

  def deals_params
    params.require(:deal).permit(:name, :amount, :category_id, :author_id)
  end
end
