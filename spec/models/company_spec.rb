require 'rails_helper'

RSpec.describe Company, type: :model do
  it "should contain a name" do
    company = Company.new
    company.validate
    expect(company.errors.messages).to include(:name)
  end

  it "should contain a valid code" do
    company = Company.new name: "Chez Joe"
    company.validate
    expect(company.errors.messages).not_to include(:code)
    expect(company.code).not_to be_empty
  end

end
