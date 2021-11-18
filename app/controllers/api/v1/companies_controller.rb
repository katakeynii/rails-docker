class Api::V1::CompaniesController < ApplicationController

    def index
      companies = Company.all
      render json: companies, status: :ok
    end
end
