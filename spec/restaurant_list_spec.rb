# frozen_string_literal: true

require_relative '../pages/restaurant_list'
require_relative '../spec/spec_helper'

RSpec.describe RestaurantList do
  let(:list) { described_class.new(@driver) }

  before(:each) do
    @driver.manage.timeouts.implicit_wait = 10
  end

  it 'Verify that fast food button works.' do
    list.click_restaurants_list
    list.click_fast_foot
    fast_food = @driver.current_url
    expect(fast_food).to eq('http://127.0.0.1:8880/restaurants?tag=fast%20food')
  end

  it 'Verify that view all button works.' do
    list.click_viewall
    view_all = @driver.current_url
    expect(view_all).to eq('http://127.0.0.1:8880/restaurants')
  end

  it 'Verify that details buttn works.' do
    list.click_johnson_details
    expect(@driver.find_element(xpath: "//u[normalize-space()='low prices']").text).to eq('low prices')
  end
end
