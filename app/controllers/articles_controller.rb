class ArticlesController < ApplicationController

  include ArticlesHelper

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, :except => [:show, :index]


  # GET /articles
  # GET /articles.json
  def index

    @articles = Article.order(:created_at).page params[:page]


    @featured = Article.last
  end

  # GET /articles/1
  # GET /articles/1.json
  def show

    @articles = Article.order(:created_at).page params[:page]


  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)


    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update

    @article.slug = to_slug(@article.slug)

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      #params.require(:article).permit(:title, :subtitle, :slug, :body, :keyword, :image, :user, :article_category_ids)
      params.require(:article).permit!
    end

    def admin_only
      if user_signed_in?
        unless current_user.admin?
          redirect_to root_path, :alert => "Access denied."
        end

      else
        redirect_to root_path, :alert => "Access denied."

      end

    end
end
