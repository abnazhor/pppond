class PostsController < ApplicationController
  # before_action :set_pin, only: %i[ show edit update destroy ]

  # GET /pins/new
  def new
    render Views::Posts::New.new
  end

  def create
    @pin = Pin.new
    @pin.postable = Post.new(url: params[:url])

    if @pin.save
      redirect_to @pin, notice: "Pin was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    # @pin = Pin.new(pin_params)
    # @pin.url_cache = UrlCache.find_or_create_by(url: @pin.url)

    # if @pin.save
    #   UrlCaches::Refresher.new(@pin.url_cache).call if !@pin.url_cache.fresh?

    #   respond_to do |format|
    #     format.html { redirect_to @pin, notice: "Pin was successfully created." }
    #     format.turbo_stream
    #   end
    # else
    #   respond_to do |format|
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.turbo_stream { head :unprocessable_entity }
    #   end
    # end
  end

  private

  def pin_params
    params.require(:pin).permit(pinable_attributes: [:url])
  end
end
