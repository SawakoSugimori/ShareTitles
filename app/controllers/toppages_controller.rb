class ToppagesController < ApplicationController
  def index
    @pictures = Picture.order(id: :desc).page(params[:page])
  end
end
