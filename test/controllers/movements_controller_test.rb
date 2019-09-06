# frozen_string_literal: true

require 'test_helper'

class MovementsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get movements_new_url
    assert_response :success
  end

end
