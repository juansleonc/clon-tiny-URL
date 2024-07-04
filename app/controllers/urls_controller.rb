class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :info]

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to info_url(@url.token), notice: 'URL was successfully shortened.'
    else
      render :new
    end
  end

  def show
    @url.visits.create(ip_address: request.remote_ip)
    redirect_to @url.original_url, allow_other_host: true
  end

  def info
    @visits_count = @url.visits.count
    @visitors = @url.visits.distinct(:ip_address)
  end

  private

  def set_url
    @url = Url.find_by!(token: params[:token])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
