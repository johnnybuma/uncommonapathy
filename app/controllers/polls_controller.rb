class PollsController < ApplicationController

  before_action :admin_only, :except => [:show, :index]


  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def show
    @poll = Poll.includes(:vote_options).find_by_id(params[:id])
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      flash[:success] = 'Poll was created!'
      redirect_to polls_path
    else
      render 'new'
    end
  end



  def edit
    @poll = Poll.find_by_id(params[:id])
  end

  def update
    @poll = Poll.find_by_id(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to polls_path
    else
      render 'edit'
    end
  end

  def destroy
    @poll = Poll.find_by_id(params[:id])
    if @poll.destroy
      flash[:success] = 'Poll was destroyed!'
    else
      flash[:warning] = 'Error destroying poll...'
    end
    redirect_to polls_path
  end

  private

  def admin_only
    if user_signed_in?
      unless current_user.admin?
        redirect_to root_path, :alert => "Access denied."
      end

    else
      redirect_to root_path, :alert => "Access denied."

    end

  end

  def poll_params
    params.require(:poll).permit(:topic, :article_id, vote_options_attributes: [:id, :title, :_destroy])
  end
end