class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :redirect_index, only: %i[ new show edit]

  def index
    @articles = Article.order(id: :desc).all
  end

  def show
    render :shoe_detail if params[:detail]
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render :create
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    render turbo_stream: turbo_stream.remove(@article)
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def redirect_index
    redirect_to article_url unless turbo_frame_request?
  end
end
