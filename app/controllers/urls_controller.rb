class UrlsController < ApplicationController

  def index
    @urls = all_urls_desc
    @url = Url.new
  end

  def show
    @url = Url.find_by(token: params[:token])

    if @url
      redirect_to @url.original_url, status: :moved_permanently
    else
      redirect_to root_path, flash: { error: 'Url was not found.' }
    end
  end

  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to root_path, notice: 'Url was successfully shortened.' }
      else
        format.html do
          @urls = all_urls_desc
          render :index
        end
      end
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Url was successfully destroyed.' }
    end
  end

private
  def all_urls_desc
    Url.all.order(id: :desc)
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
