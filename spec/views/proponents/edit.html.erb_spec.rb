require 'rails_helper'

RSpec.describe "proponents/edit", type: :view do
  let(:proponent) { create(:proponent)}

  before(:each) do
    assign(:proponent, proponent)
  end

  it "renders the edit proponent form" do
    render

    assert_select "form[action=?][method=?]", proponent_path(proponent), "post" do

      assert_select "input[name=?]", "proponent[name]"

      assert_select "input[name=?]", "proponent[cpf]"

      assert_select "input[name=?]", "proponent[birth_date]"

      assert_select "input[name=?]", "proponent[salary]"
    end
  end
end
