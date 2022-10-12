# frozen_string_literal: true

require_relative '../shared_context/shared_context_spec'
require_relative '../pages/owner_page'
require 'pg'
include Test::Unit::Assertions

cred = YAML.load_file('config/test_data.yml')

RSpec.describe Owner do
  let(:owner) { described_class.new(@driver) }
  let(:user) { cred.fetch('emails')['owner_email_2'] }
  let(:pw) { cred.fetch('pw')['owner_pwd'] }

  include_context 'login'

  it 'Verify redirection to personal info page' do
    owner.click_my_personal_info_btn
    @wait.until { @driver.find_element(xpath: "//*[contains(text(),'Jason Brown')]") }
    assert_equal('Jason Brown', @driver.find_element(xpath: "//*[contains(text(),'Jason Brown')]").text, 'Name label not found.')
  end

  it 'Verify redirection to current orders page' do
    owner.click_my_current_orders_btn
    @wait.until { @driver.find_element(css: "[href*='profile/current_orders/Waiting for confirm']") }
    assert_equal('WAITING FOR CONFIRM (0)', @driver.find_element(css: "[href*='profile/current_orders/Waiting for confirm']").text, 'Not found.')
  end

  it 'Verify redirection to order history page' do
    owner.click_my_order_history_btn
    @wait.until { @driver.find_element(css: "[href*='/profile/order_history/History']") }
    assert_equal('HISTORY (0)', @driver.find_element(css: "[href*='/profile/order_history/History']").text, 'Not found.')
  end

  xit 'Verify redirection to my restsaurants page' do
    owner.click_my_restaurants_btn
    @wait.until { @driver.find_element(css: "[href*='/restaurant/4/menu/7']") }
    assert(@driver.find_element(css: "[href*='/restaurant/4/menu/7']"), 'Label not found.')
  end

  xit 'Create new restaurant' do
    owner.click_add_restaurant_btn
    owner.type_rest_name(cred.fetch('test_rest')['rest_name'])
    owner.type_rest_address(cred.fetch('test_rest')['rest_address'])
    owner.type_rest_phone(cred.fetch('test_rest')['rest_phone'])
    owner.type_rest_preview_txt(cred.fetch('test_rest')['rest_preview_txt'])
    owner.type_rest_description(cred.fetch('test_rest')['rest_description'])
    owner.click_add_rest_btn
    @wait.until { @driver.find_element(xpath: "//*[contains(text(),'Restaurant was successfully created')]") }
    assert_equal('Restaurant was successfully created', @driver.find_element(xpath: "//*[contains(text(),'Restaurant was successfully created')]").text, 'Message not found')
    db = PG.connect(dbname: 'easyrest', user: 'admin', password: '12345678')
    db.exec('DELETE FROM restaurants WHERE id>10')
    @driver.navigate.refresh
    begin
      assert(@driver.find_element(xpath: "//*[contains(text(),'Test reastaurant')]"), 'Label not found')
    rescue => RSpec::Core::MultipleExceptionError
      puts 'Test restaurant deleted successfully'
    end
  end
end
