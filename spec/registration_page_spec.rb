# frozen_string_literal: true

require_relative '../pages/registration_page'
require_relative '../pages/login_page'
require_relative 'spec_helper'

cred_reg = YAML.load_file('config/test_data.yml')

RSpec.describe RegistrationPage do
  let(:guest) { described_class.new(@driver) }

  it 'Can registrate a new user.' do
    guest.click_sign_up
    guest.type_name(cred_reg.fetch('test_guest')['guest_name'])
    guest.type_email(cred_reg.fetch('test_guest')['guest_email'])
    guest.type_phone(cred_reg.fetch('test_guest')['guest_phone'])
    guest.click_birth_date_fld
    guest.click_years_fld
    guest.click_year
    guest.click_day
    guest.click_ok_btn
    guest.type_password(cred_reg.fetch('test_guest')['guest_pw'])
    guest.type_pass_confrirm(cred_reg.fetch('test_guest')['guest_confirm_pw'])
    guest.click_create_acc
    @wait.until { @driver.find_element(xpath: '/html/body/div/main/div/div[1]/div/span/h5').displayed? }
    url = @driver.current_url
    expect(url).to eq('http://127.0.0.1:8880/log-in')
  end

  it 'Can log in with new user.' do
    guest.type_email(cred_reg.fetch('emails')['new_email'])
    guest.type_password(cred_reg.fetch('pw')['new_pwd'])
    @wait.until { @driver.find_element(xpath: "//button[@type='submit']").displayed? }
    guest.click_submit
    @wait.until { @driver.find_element(css: '[style*="padding"]') }
    expect(@driver.find_element(css: '[style*="padding"]')).to be_displayed
  end
end
