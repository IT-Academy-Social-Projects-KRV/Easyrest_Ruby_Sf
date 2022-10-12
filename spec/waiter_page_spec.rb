# frozen_string_literal: true

require_relative '../shared_context/shared_context_spec'
require_relative '../pages/waiter_page'

cred = YAML.load_file('config/test_data.yml')

RSpec.describe WaiterPage do
  let(:waiter) { described_class.new(@driver) }
  let(:user) { cred.fetch('emails')['waiter_email'] }
  let(:pw) { cred.fetch('pw')['waiter_pwd'] }

  include_context 'login'

  it 'can click all button' do
    waiter.click_all_btn
    @wait.until { @driver.find_element(xpath: '/html/body/div/main/div/div[4]/div/div') }
    expect(@driver.find_element(xpath: '/html/body/div/main/div/div[4]/div/div')).to be_displayed
  end

  it 'can test start button' do
    waiter.click_start_btn
    @wait.until { @driver.find_element(xpath: "//div[@role='alertdialog']").displayed? }
    expect(@driver.find_element(xpath: "//div[@role='alertdialog']").text).to eq('success')
  end

  it 'can test close button' do
    waiter.click_close_btn
    @wait.until { @driver.find_element(xpath: "//div[@role='alertdialog']").displayed? }
    expect(@driver.find_element(xpath: "//div[@role='alertdialog']").text).to eq('success')
  end

  it 'can test history tab' do
    waiter.click_history_btn
    @wait.until { @driver.find_element(xpath: '/html/body/div/main/div/div[5]/div/div').displayed? }
    expect(@driver.find_element(xpath: '/html/body/div/main/div/div[5]/div/div')).to be_displayed
  end
end
