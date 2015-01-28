class DogsController < ApplicationController
  @@dogs_service = DogsService

  def index
    @dogs = dogs_service.search
    render :json => @dogs
  end

  private

  def dogs_service
    @@dogs_service.new
  end
end
