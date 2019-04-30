require 'test_helper'

feature 'login' do
  describe "not logged in" do
    it 'respond a 302 when loading admin homepage' do
      get admin_root_path
      assert_equal 302, last_response.status
    end
  end

  describe "logged in" do
    before do
      sign_in users(:one)
    end

    it 'respond a 200 when loading admin homepage' do
      get admin_root_path
      assert_equal 200, last_response.status
    end
  end
end