class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params.require(:company).permit(:name, :location, :phone, :mail))
    @company.save

    redirect_to @company
  end

  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs
    if @jobs.empty?
      flash.now[:notice] = 'Nenhuma vaga disponível'
    end
  end
end
