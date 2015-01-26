class DogsController < ApplicationController
  def index
    @dogs = Dog.search
    render :json => @dogs
  end
end
