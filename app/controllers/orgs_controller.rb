class OrgsController < ApplicationController
  def show
    org = OrgsService.new.show params[:id]
    render json: org.to_json
  end
end
