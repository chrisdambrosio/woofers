class DogsController < ApplicationController
  def search
    @search = Dog.search
    render :json => @search
  end
end
