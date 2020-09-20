class TitlesController < ApplicationController
  before_action :correct_user, only: [:destroy]
  
  def index
    @titles = Title.order(id: :desc).page(params[:page]).per(25)
  end

  def create
    @pictures = Picture.order(id: :desc).page(params[:page]) #check
    
    @title = current_user.titles.build(title_params)
    @title.picture = Picture.find_by(id: params[:picture_id])
    
    if @title.save
      flash[:success] = 'タイトルを投稿しました。'
      redirect_to 'titles/index'
    else
      @titles = current_user.titles.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'タイトルの投稿に失敗しました。'
      render 'pictures/index'
    end
  end

  def destroy
    @title.destroy
    flash[:success] = 'タイトルを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def title_params
    params.require(:title).permit(:title)
  end
  
  def correct_user
    @title = current_user.titles.find_by(id: params[:id])
    unless @title
      redirect_to titles_path
    end
  end
end
