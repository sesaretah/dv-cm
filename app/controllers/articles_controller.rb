class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :article_descriptors, :article_related_dates, :article_other_details, :article_contributions]

  def article_descriptors

  end

  def article_related_dates

  end

  def article_other_details

  end

  def article_contributions

  end
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
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
    @article.save
    params.each do |param|
    if param[0].include?('_title_type')
        @h = param[0].split('_')[0]
        @title_type = TitleType.find_by_id(param[1].to_i)
        Titling.create(title_type_id: @title_type.id, article_id: @article.id, content: params["#{@h}_other_title"] )
      end
    end

    respond_to do |format|
      format.html { redirect_to '/articles/article_descriptors/'+@article.id.to_s , notice: 'Article was successfully created.' }
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
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
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :abstract, :content, :url, :slug)
    end
end
