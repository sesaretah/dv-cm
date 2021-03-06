class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:email_sent]
  def reports
    if !params[:start_yyyy].blank?
      @start_date = JalaliDate.to_gregorian(params[:start_yyyy],params[:start_mm],params[:start_dd])
    end
    if !params[:end_yyyy].blank?
      @end_date = JalaliDate.to_gregorian(params[:end_yyyy],params[:end_mm],params[:end_dd])
    end
    if !@start_date.blank? && !@end_date.blank?
      @dating_ids = Dating.where('event_date <= ? AND event_date >= ?', @end_date, @start_date).pluck(:article_id)
      @article_ids = Article.where('id IN (?)', @dating_ids).pluck(:id)
    else
      @dating_ids = Dating.where('event_date <= ? AND event_date >= ?',  Date.today, 3.month.ago.beginning_of_month).pluck(:article_id)
      @start_date = 3.month.ago.beginning_of_month
      @end_date =  Date.today
      @article_ids = Article.where('id IN (?)', @dating_ids).pluck(:id)
    end
  end
  def email_sent
    render layout: 'layouts/devise'
  end
  def change_current_role
    current_user.current_role_id = params[:role_id]
    current_user.save
  end

  def index
    @role = Role.find_by_id(current_user.current_role_id)
    if !@role.blank?
      @workflow_state_ids = WorkflowState.where(role_id: @role.id).collect(&:id)
      @articles = Article.where("workflow_state_id IN (?)", @workflow_state_ids).paginate(:page => params[:page], :per_page => 5)
      @notifications = Notification.where('notifiable_type = ?  AND notifiable_id IN (?)', 'Article', @articles.pluck(:id))
    else
        @articles = []
        @notifications = []
    end

  end

  def advanced_search
    @model_results = Article.search params[:q], star: true, :page => params[:page], :per_page => 15#, with: restrict_articles
    @model_results.context[:panes] << ThinkingSphinx::Panes::ExcerptsPane
  #  @group_results = group_articles(restrict_articles)

  end

  def restrict_articles
    @h = {
          'language_ids'       => [],
          'article_type_ids'   => [],
          'article_format_ids' => [],
          'article_area_ids'   => [],
          'article_source_ids' => []
        }
    params.each do |name, value|
      @model = name.split('_')[0]
      case @model
      when 'Language'
        @h['language_ids']      << value.to_i
      when 'ArticleType'
        @h['article_type_ids']   << value.to_i
      when 'ArticleFormat'
        @h['article_format_ids'] << value.to_i
      when 'ArticleArea'
        @h['article_area_ids']   << value.to_i
      when 'ArticleSource'
        @h['article_source_ids'] << value.to_i
      end
    end
    return @h
  end

  def group_articles(with_hash)
    @result  = {
      'Language'      => grouper(Article, params[:q], 'language_ids', with_hash) ,
      'ArticleType'   => grouper(Article, params[:q], 'article_type_ids', with_hash),
      'ArticleFormat' => grouper(Article, params[:q], 'article_format_ids', with_hash),
      'ArticleArea'   => grouper(Article, params[:q], 'article_area_ids', with_hash) ,
      'ArticleSource' => grouper(Article, params[:q], 'article_source_ids', with_hash)
    }
    return @result
  end

  private
  def grouper(model, query, group_by, with_hash)
    return model.search query, star: true, with: with_hash, :group_by => group_by,  :order_group_by => 'count(*) desc'
  end
end
