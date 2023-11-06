require 'rails_helper'

RSpec.describe "proponents/show", type: :view do
  before(:each) do
    assign(:proponent, create(:proponent))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Birth Date/)
    expect(rendered).to match(/2.5/)
  end
end
