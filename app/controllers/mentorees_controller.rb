class MentoreesController < ApplicationController

  def index
    @mentorees = policy_scope(Mentoree)
  end

  def new
    @mentoree = Mentoree.new
    authorize @mentoree
  end

  def create
    @mentoree = Mentoree.new(mentoree_params)
    authorize @mentoree

    if @mentoree.save
      UserMentoree.create(user: current_user, mentoree: @mentoree)
      redirect_to mentoree_path(@mentoree)
    else
      render :new
    end
  end

  def show
    @mentoree = Mentoree.find(params[:id])
    @mentoree_data = @mentoree.fetch_github_events
    @mentoree_daily_contributions = @mentoree.fetch_github_daily_contributions.select{ |cont| Date.today - cont[:date] < 31 }.reverse
    @mentoree.try_github_update

    authorize @mentoree
  end

  private

  def mentoree_params
    params.require(:mentoree).permit(:github_username)
  end
end
