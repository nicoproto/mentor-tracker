class MentoreesController < ApplicationController
  def new
    @mentoree = Mentoree.new
  end

  def create
    @mentoree = Mentoree.new(mentoree_params)

    if @mentoree.save
      UserMentoree.create(user: current_user, mentoree: @mentoree)
      redirect_to @mentoree
    else
      render :new
    end
  end

  private

  def mentoree_params
    params.require(:mentoree).permit(:github_url)
  end
end
