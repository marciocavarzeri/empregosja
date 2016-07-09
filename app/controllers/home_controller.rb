class HomeController < ApplicationController
  def index
    @job = Job.all
  end
end
