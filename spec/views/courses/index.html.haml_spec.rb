require 'spec_helper'

describe "courses/index.html.haml" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :user_id => 1,
        :name => "Name",
        :grade => 1,
        :level => "Level",
        :credit => 1
      ),
      stub_model(Course,
        :user_id => 1,
        :name => "Name",
        :grade => 1,
        :level => "Level",
        :credit => 1
      )
    ])
  end

  pending "renders a list of courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Level".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
