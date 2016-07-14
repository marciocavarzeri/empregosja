class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs
    if @jobs.empty?
      flash.now[:notice] = 'Nenhuma vaga disponível'
    end
  end
end
