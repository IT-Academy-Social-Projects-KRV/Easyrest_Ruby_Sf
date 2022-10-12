# frozen_string_literal: true

require_relative '../shared_context/shared_context_spec'

cred = YAML.load_file('config/test_data.yml')

RSpec.describe LoginPage do
  let(:user) { cred.fetch('emails')['customer_email'] }
  let(:login) { described_class.new(@driver) }

  # before(:each) do
  #   @driver.manage.timeouts.implicit_wait = 10
  # end

  it 'checks for error message with invalid password' do
    login.click_sign_in
    login.type_email(user)
    login.type_password('asd')
    login.click_submit
    @wait.until { @driver.find_element(:css, "[id='client-snackbar']") }
    expect(@driver.find_element(:css, "[id='client-snackbar']").text).to eq('Email or password is invalid')
  end

  it 'check for valid email' do
    login.clear_email
    login.type_email('user.com')
    login.click_submit
    @wait.until { @driver.find_element(xpath: '//div/main/div/div[2]/form/div/div[1]/div/p').displayed? }
    expect(@driver.find_element(xpath: '//div/main/div/div[2]/form/div/div[1]/div/p')).to be_displayed
  end

  it 'checks for empty password field' do
    login.clear_email
    login.type_email(user)
    login.clear_pwd
    login.type_password(:backspace)
    login.click_submit
    @wait.until { @driver.find_element(xpath: '//div/main/div/div[2]/form/div/div[2]/div/p').displayed? }
    expect(@driver.find_element(xpath: '//div/main/div/div[2]/form/div/div[2]/div/p')).to be_displayed
  end
end
