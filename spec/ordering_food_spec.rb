# frozen_string_literal: true

require_relative '../shared_context/shared_context_spec'
require_relative '../pages/ordering_food'

cred = YAML.load_file('config/test_data.yml')

RSpec.describe OrderingFood do
  let(:client) { described_class.new(@driver) }
  let(:user) { cred.fetch('emails')['customer_email'] }
  let(:pw) { cred.fetch('pw')['customer_pwd'] }

  # before(:each) do
  #   @driver.manage.timeouts.implicit_wait = 10
  # end

  include_context 'login'

  it 'Verify that description is extendable.' do
    client.click_johnson_watchmenu
    @wait.until { @driver.find_element(xpath: '//div[2]/div[2]/div/div[2]/div/div/div/div[2]/div[2]/div/div[2]').displayed? }
    client.view_details
    @wait.until { @driver.find_element(xpath: "//h6[normalize-space()='Description:']").displayed? }
    expect(@driver.find_element(xpath: "//h6[normalize-space()='Description:']").text).to eq('Description:')
  end

  it 'Verify that quantity can be changed.' do
    client.quantity_highlight
    client.quantity_change('5')
    @wait.until { @driver.find_element(xpath: "//p[normalize-space()='398.00$']").displayed? }
    expect(@driver.find_element(xpath: "//p[normalize-space()='398.00$']").text).to eq('398.00$')
  end

  it 'Verify that item can be add to the cart.' do
    client.select_chiken_broccoli
    @wait.until { @driver.find_element(xpath: "//span[normalize-space()='Submit order']").displayed? }
    expect(@driver.find_element(xpath: "//span[normalize-space()='Submit order']")).to be_displayed
  end

  it 'Verify that can click on submit button.' do
    client.click_submit
    @wait.until { @driver.find_element(xpath: '//div[2]/div[2]/div/div[1]/h6').displayed? }
    expect(@driver.find_element(xpath: '//div[2]/div[2]/div/div[1]/h6').text).to eq('Order confirmation')
  end

  it 'Verify that can submit order from order confirmation.' do
    @wait.until { @driver.find_element(xpath: '//div[2]/div[2]/div/div[1]/h6').displayed? }
    client.click_submit_order_confirmation
    @wait.until { @driver.find_element(xpath: '//div/main/div[3]/div/div[1]/span/p').displayed? }
    expect(@driver.find_element(xpath: '//div/main/div[3]/div/div[1]/span/p').text).to eq('Order status changed to Waiting for confirm')
  end

  it 'Verify that can remove item from the cart.' do
    client.select_chiken_broccoli
    @wait.until { @driver.find_element(xpath: "//span[normalize-space()='Submit order']").displayed? }
    client.remove_item
    @wait.until { @driver.find_element(xpath: "//div[@role='alertdialog']").displayed? }
    expect(@driver.find_element(xpath: "//div[@role='alertdialog']").text).to eq('Item was removed')
  end

  it 'Verify that can change quantity from order confirmation panel' do
    client.select_chiken_broccoli
    @wait.until { @driver.find_element(xpath: "//span[normalize-space()='Submit order']").displayed? }
    client.click_submit
    @wait.until { @driver.find_element(xpath: '//div[2]/div[2]/div/div[2]/div[2]/table/tbody/tr[1]/td[5]/div/div/input').displayed? }
    client.quantity_highlight_order_conformation
    @wait.until { @driver.find_element(xpath: '//div[2]/div[2]/div/div[2]/div[2]/table/tbody/tr[1]/td[1]/button').displayed? }
    client.quantity_change_order_confirmation('2')
    @wait.until { @driver.find_element(xpath: '//div/div[2]/div[2]/table/tbody/tr[1]/td[6]').displayed? }
    expect(@driver.find_element(xpath: '//div/div[2]/div[2]/table/tbody/tr[1]/td[6]').text).to eq('159.20$')
  end

  it 'Verify that can remove item from order confirmation panel.' do
    @wait.until { @driver.find_element(xpath: '//div[2]/div[2]/div/div[2]/div[2]/table/tbody/tr[1]/td[1]/button').displayed? }
    client.remove_item_from_order_confirmation
    @wait.until { @driver.find_element(xpath: '/html/body/div[2]/div[2]/div/div[2]/div[2]/table/tbody/tr/td[3]').displayed? }
    expect(@driver.find_element(xpath: '/html/body/div[2]/div[2]/div/div[2]/div[2]/table/tbody/tr/td[3]').text).to include('0.00$')
  end

  it 'Verify that can return to menu from ordering confirmation panel.' do
    @wait.until { @driver.find_element(xpath: '/html/body/div[2]/div[2]/div/div[3]/button[1]').displayed? }
    client.click_cancel_order_confirmation
    begin
      expect(@driver.find_element(xpath: '/html/body/div[2]/div[2]').displayed?).to be false
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts 'Expect that there is no such element.'
      false
    end
  end
end
