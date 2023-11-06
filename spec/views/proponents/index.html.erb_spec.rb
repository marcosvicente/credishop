require 'rails_helper'

RSpec.describe "proponents/index", type: :view do
  let(:proponent) { create_list(:proponent, 2)}
  before(:each) do
    assign(:proponents, [
      proponent
    ])
  end

  it "renders a list of proponents" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(1.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cpf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Birth Date".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
  end
end
