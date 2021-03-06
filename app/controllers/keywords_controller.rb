class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :edit, :update, :destroy]
  before_action :check_grant, only: [:new, :edit, :create,:update, :destroy]
  def batch_keywording
    for article in Article.all
      if article.content.include?("رابط کاربری") || article.content.include?("ظاهر گرافیکی") || article.content.include?("ui") ||  article.content.include?("UI") || article.content.include?("UX") || article.content.include?("Ui") || article.content.include?("interface") || article.content.include?("طراحی") || article.content.include?("طراح") || article.content.include?("گرافیکی ")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 1)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 1)
        end
      end
      if article.content.include?("سیم‌کارت") || article.content.include?("سیم ‌کارت") || article.content.include?("sim") || article.content.include?("سیمکارت") || article.content.include?("سیم کارت")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 20)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 20)
        end
      end
      if article.content.include?("ایرانسل") || article.content.include?("irancell")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 6)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 6)
        end
      end
      if (article.content.include?("بسته ") || article.content.include?("شبانه") || article.content.include?("روزانه")) && !(article.content.include?("بسته شد") || article.content.include?("بسته میشه") || article.content.include?("بسته می شود"))
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 7)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 7)
        end
      end
      if article.content.include?("آپدیت") || article.content.include?("بروزرسانی") || article.content.include?("اپدیت") || article.content.include?("اپدیت")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 4)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 4)
        end
      end
      if (article.content.include?("حساب") || article.content.include?("ثبت نام") || article.content.include?("account") ||  article.content.include?("اکانت") || article.content.include?("پسورد") || article.content.include?("کد امنیتی") || article.content.include?("رمز جدید") || article.content.include?("رمز ورود") ||article.content.include?("لاگین")) && !(article.content.include?("حسابی"))
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 8)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 8)
        end
      end
      if (article.content.include?("خطا") || article.content.include?("ایراد") || article.content.include?("باز نمیشه") || article.content.include?("مشکل داره") || article.content.include?("مشکل دارد")  || article.content.include?("کار نمیکنه") || article.content.include?("نمیشه") || article.content.include?("لود ") || article.content.include?("نمیتونم وارد") || article.content.include?("خراب شد") || article.content.include?("کند شد") || article.content.include?("بالانمیاد") || article.content.include?("بالا نمیاد") || article.content.include?("مشکل مواجه") || article.content.include?("نتوانستم") || article.content.include?("کار نمی‌کنه") || article.content.include?("ری استارت") || article.content.include?("قفل میکنه") || article.content.include?("قفل می‌کنه") || article.content.include?("قفل می کند") || article.content.include?("قفل می‌کند") || article.content.include?("هنگ") || article.content.include?("ارور") || article.content.include?("خارج میشه")) && !(article.content.include?("مشکلیم نداره") || article.content.include?("مشکلی نداره") || article.content.include?("مشکل نداره"))
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 9)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 9)
        end
      end
      if article.content.include?("رمز دوم")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 11)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 11)
        end
      end
      if article.content.include?("permission") ||  article.content.include?("حریم خصوصی") || article.content.include?("دسترس")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 18)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 18)
        end
      end
      if article.content.include?("لغو خودکار")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 3)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 3)
        end
      end
      if article.content.include?("نوترینو")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 12)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 12)
        end
      end
      if article.content.include?("همراه من")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 13)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 13)
        end
      end
      if article.content.include?("اتصال اینترنت") || article.content.include?("اینترنت وصل") || article.content.include?("نت وصل") || article.content.include?("اتصال نت") || article.content.include?("اینترنتش")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 21)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 21)
        end
      end
      if article.content.include?("فیروزه") || article.content.include?("باشگاه")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 22)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 22)
        end
      end
      if (article.content.include?("بهتر میشه") || article.content.include?("لطفا")) && (!article.content.include?("لطفا صبر"))
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 19)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 19)
        end
      end
      if article.content.include?("اندروید") || article.content.include?("android") || article.content.include?("آندروید")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 16)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 16)
        end
      end
      if article.content.include?("اپل ") || article.content.include?("apple") || article.content.include?("ios")
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 17)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 17)
        end
      end
      if (article.content.include?("تشکر") || article.content.include?("بهتر شده")  || article.content.include?("مفیدیه") || article.content.include?("کاملیه") || article.content.include?("کامله") || article.content.include?("کامل است") || article.content.include?("مفید است") || article.content.include?("عالی") || article.content.include?("Best") || article.content.include?("خوب") || article.content.include?("بدک نیست") || article.content.include?("بهتر از قبل شده") || article.content.include?("بهترشده")) && !(article.content.include?("افتضاح") || article.content.include?("آشغال") || article.content.include?("ضعیف") || article.content.include?("گدا") || article.content.include?("دزد") || article.content.include?("ریدید") || article.content.include?("اشغال") || article.content.include?("خجالت") || article.content.include?("داغون") || article.content.include?("تباه") || article.content.include?("مزخرف") || article.content.include?("ناکارآمد") || article.content.include?("بسیار بد") ||  article.content.include?("ریدم به") || article.content.include?("لعنت") || article.content.include?("کیری") || article.content.include?("به درد نخوره") || article.content.include?("قابل قبولی نیست") || article.content.include?("قابل قبول نیست")  || article.content.include?("قابل قبول نیست") || article.content.include?("متاسفم") || article.content.include?("بدرد نخوره") || article.content.include?("رو اعصابه") || article.content.include?("رو اعصابمه") || article.content.include?("چرته") || article.content.include?("چرتیه") || article.content.include?("چرت و پرته") || article.content.include?("چرت و پرتیه") || article.content.include?("متاسفانه") || article.content.include?("ریدن با") || article.content.include?("ریدین به") || article.content.include?("چرت هست") || article.content.include?("چرت است") || article.content.include?("خوب نیست") || article.content.include?("نا امید کننده") || article.content.include?("خون به دل") || article.content.include?("خون به جگر") || article.content.include?("مسخره"))
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 14)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 14)
        end
      end
      if !(article.content.include?("عالی") || article.content.include?("Best") || article.content.include?("خوب")) && (article.content.include?("افتضاح") || article.content.include?("آشغال") || article.content.include?("ضعیف") || article.content.include?("گدا") || article.content.include?("دزد") || article.content.include?("ریدید") || article.content.include?("اشغال") || article.content.include?("خجالت") || article.content.include?("داغون") || article.content.include?("تباه") || article.content.include?("مزخرف") || article.content.include?("ناکارآمد") || article.content.include?("بسیار بد") ||  article.content.include?("ریدم به") || article.content.include?("لعنت") || article.content.include?("کیری") || article.content.include?("به درد نخوره") || article.content.include?("قابل قبولی نیست") || article.content.include?("قابل قبول نیست")  || article.content.include?("قابل قبول نیست") || article.content.include?("متاسفم") || article.content.include?("بدرد نخوره") || article.content.include?("رو اعصابه") || article.content.include?("رو اعصابمه") || article.content.include?("چرته") || article.content.include?("چرتیه") || article.content.include?("چرت و پرته") || article.content.include?("چرت و پرتیه") || article.content.include?("متاسفانه") || article.content.include?("ریدن با") || article.content.include?("ریدین به") || article.content.include?("چرت هست") || article.content.include?("چرت است") || article.content.include?("خوب نیست") || article.content.include?("نا امید کننده") || article.content.include?("خون به دل") || article.content.include?("خون به جگر") || article.content.include?("مسخره") ||  article.content.include?("تخمیه") || article.content.include?("تخمی") || article.content.include?("حال نکردم") || article.content.include?("کیرم") || article.content.include?("کثافت") || article.content.include?("احمق") || article.content.include?("شرم آوره") || article.content.include?("مایه شرم"))
        @tagging = Tagging.where(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 15)
        if @tagging.blank?
          @tagging = Tagging.create(taggable_type: 'Article', taggable_id: article.id, target_type: 'Keyword' ,target_id: 15)
        end
      end

    end
  end
  def search
    if !params[:q].blank?
      @keyword = Keyword.search params[:q], :star => true
    end
    resp = []
    for k in @keyword
      resp << {'title' => k.title, 'id' => k.id}
    end
    render :json => resp.to_json, :callback => params['callback']
  end
  # GET /keywords
  # GET /keywords.json
  def index
    @keywords = Keyword.all
  end

  # GET /keywords/1
  # GET /keywords/1.json
  def show
  end

  # GET /keywords/new
  def new
    @keyword = Keyword.new
  end

  # GET /keywords/1/edit
  def edit
  end

  # POST /keywords
  # POST /keywords.json
  def create
    @keyword = Keyword.new(keyword_params)
    @keyword.user_id = current_user.id
    respond_to do |format|
      if @keyword.save
        format.html { redirect_to @keyword, notice: 'Keyword was successfully created.' }
        format.json { render :show, status: :created, location: @keyword }
      else
        format.html { render :new }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keywords/1
  # PATCH/PUT /keywords/1.json
  def update
    @keyword.user_id = current_user.id
    respond_to do |format|
      if @keyword.update(keyword_params)
        format.html { redirect_to @keyword, notice: 'Keyword was successfully updated.' }
        format.json { render :show, status: :ok, location: @keyword }
      else
        format.html { render :edit }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keywords/1
  # DELETE /keywords/1.json
  def destroy
    @keyword.destroy
    respond_to do |format|
      format.html { redirect_to keywords_url, notice: 'Keyword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_grant
    if !grant_access("alter_keywords", current_user)
      head(403)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_keyword
    @keyword = Keyword.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def keyword_params
    params.require(:keyword).permit(:title, :description)
  end
end
