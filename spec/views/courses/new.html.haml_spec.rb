require 'spec_helper'

describe "courses/new.html.haml" do
  before(:each) do
    assign(:course, stub_model(Course,
      :user_id => 1,
      :name => "MyString",
      :grade => 1,
      :level => "MyString",
      :credit => 1
    ).as_new_record)
  end

  pending "renders new course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path, :method => "post" do
      assert_select "input#course_user_id", :name => "course[user_id]"
      assert_select "input#course_name", :name => "course[name]"
      assert_select "input#course_grade", :name => "course[grade]"
      assert_select "input#course_level", :name => "course[level]"
      assert_select "input#course_credit", :name => "course[credit]"
    end
  end
end
