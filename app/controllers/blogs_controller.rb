class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:new, :edit, :show]


  def index
    @blogs = Blog.all
  end


  def show
     @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  
  def new
    @blog = Blog.new
  end

  
  def edit
  end

  
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id 
      if @blog.save
      ContactMailer.contact_mail(@blog).deliver
      redirect_to blogs_path, notice: "ブログを作成しました！"
    end
  end

  def update
    sleep 3
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:date, :title, :content, :image)
    end
end
