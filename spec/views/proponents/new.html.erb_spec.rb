require 'rails_helper'

RSpec.describe "proponents/new", type: :view do
  before(:each) do
    assign(:proponent, build(:proponent))
  end

  it "renders new proponent form" do
    render

    assert_select "form[action=?][method=?]", proponents_path, "post" do

      assert_select "input[name=?]", "proponent[name]"

      assert_select "input[name=?]", "proponent[cpf]"

      assert_select "input[name=?]", "proponent[birth_date]"

      assert_select "input[name=?]", "proponent[salary]"
    end
  end
end
