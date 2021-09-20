class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]
  
  # GET /companies

  def index

    @companies = Company.all
    @stacks = params[:stack]
    @staff_size = params[:staff_size]
    @categories = params[:categories]
    
    @filtered_companies = @companies.filtering(@stacks,@staff_size,@categories)
    
    render json: @filtered_companies.map{|company|
      company.as_json.merge(stacks: company.stacks, company_stacks: company.companies_stacks)
      }
  end

  # GET /companies/1
  def show
    @company_stack = CompaniesStack.where(company_id: @company.id)
    @stacks_names = @company_stack.map{|stack| {name: Stack.find(stack.stack_id).name, company_stack_id: stack.id}}
    render json: @company.as_json.merge(company_stacks: @stacks_names, company_id: @company.id)
    
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.permit(:name, :description, :website_link, :github_link, :staff_size, :is_it_recruiting)
    end
end
