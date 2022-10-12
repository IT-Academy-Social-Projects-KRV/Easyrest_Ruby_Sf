# frozen_string_literal: true

require_relative '../shared_context/shared_context_spec'
require_relative '../pages/administrator_panel_page'

cred = YAML.load_file('config/test_data.yml')

RSpec.describe Administrator do
  let(:admstr) { described_class.new(@driver) }
  let(:user) { cred.fetch('emails')['administr_email'] }
  let(:pw) { cred.fetch('pw')['administr_pwd'] }

  include_context 'login'

  # before(:each) do
  #   @driver.manage.timeouts.implicit_wait = 10
  # end

  it "Select an order with status 'Waiting To Confirm' and accept it" do
    admstr.click_waiting_for_confirm_tab
    admstr.click_order
    @wait.until { @driver.find_element(:xpath, '//div/main/div/div/div/div/div[1]/div[2]/div/div/div/div/div[2]/div/button/span[1]').displayed? }
    admstr.click_accept_order
    @wait.until { @driver.find_element(:xpath, '//div[1]/main[1]/div[1]/div[2]/div[1]/div[1]/span[1]/p[1]').displayed? }
    expect(@driver.find_element(:xpath, '//div[1]/main[1]/div[1]/div[2]/div[1]/div[1]/span[1]/p[1]')).to be_displayed
  end

  it 'Select an order with status \'Accepted\' and assign in to a waiter' do
    admstr.click_accepted_tab
    admstr.click_order
    @wait.until { @driver.find_element(xpath: '//div[1]/div[2]/div/div/div/div/div[2]/div[1]/fieldset/div/label[2]/span[1]/span[1]').displayed? }
    admstr.click_waiter_radio_btn
    admstr.click_assign_order
    @wait.until { @driver.find_element(:xpath, '//div[1]/main[1]/div[1]/div[2]/div[1]/div[1]').displayed? }
    expect(@driver.find_element(:xpath, '//div[1]/main[1]/div[1]/div[2]/div[1]/div[1]')).to be_displayed
  end

  it 'Select a waiter and view his orders' do
    admstr.click_waiters_tab
    @wait.until { @driver.find_element(:xpath, '//div/main/div/div[1]/div[1]/div[1]/div').displayed? }
    admstr.click_waiter
    @wait.until { @driver.find_element(:xpath, '//div/main/div/div/div/div/div[1]/div[1]/div[1]/div').displayed? }
    admstr.click_order
    @wait.until { @driver.find_element(:xpath, '/html/body/div/main/div/div[1]/div[2]/div/div/div/div/div[1]/div/div[2]/div/div/div/div/table/tbody/tr[6]/td[3]').displayed? }
    expect(@driver.find_element(:xpath, '//div/main/div/div[1]/div[2]/div/div/div/div/div[1]/div/div[2]/div/div/div/div/h6')).to be_displayed
  end
end
