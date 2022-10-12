# frozen_string_literal: true

require_relative '../shared_context/shared_context_spec'
require_relative '../pages/home_page'

cred = YAML.load_file('config/test_data.yml')

RSpec.describe HomePage do
  let(:home) { described_class.new(@driver) }
  let(:user) { cred.fetch('emails')['customer_email'] }
  let(:pw) { cred.fetch('pw')['customer_pwd'] }

  # before(:each) do
  #   @driver.manage.timeouts.implicit_wait = 10
  # end

  it 'Restaurant list button redirects to all restaurants' do
    home.click_restaurants_list
    @wait.until { @driver.find_element(:xpath, "//div[@title='Johnson PLC']") }
    expect(@driver.find_element(:xpath, "//div[@title='Johnson PLC']")).to be_displayed
  end

  it 'Homepage button redirects correctly to homepage' do
    home.click_homepage
    @wait.until { @driver.find_element(:xpath, "//img[@alt='View All']") }
    expect(@driver.find_element(:xpath, "//img[@alt='View All']")).to be_displayed
  end

  it 'View all button redirects to all restaurants' do
    home.click_view_all
    @wait.until { @driver.find_element(:xpath, "//div[@title='Johnson PLC']") }
    expect(@driver.find_element(:xpath, "//div[@title='Johnson PLC']")).to be_displayed
  end

  it 'Easy-rest button redirects correctly to homepage' do
    home.click_easy_rest
    @wait.until { @driver.find_element(:xpath, "//img[@alt='View All']") }
    expect(@driver.find_element(:xpath, "//img[@alt='View All']")).to be_displayed
  end

  it 'Clicking any category redirects to the corresponding category' do
    home.click_any_category
    @wait.until { @driver.find_element(:xpath, "//span[normalize-space()='details']") }
    expect(@driver.find_element(:xpath, "//span[normalize-space()='details']")).to be_displayed
  end

  it 'Sign in button redirects to log-in page' do
    home.click_sign_in
    @wait.until { @driver.find_element(:xpath, "//span[normalize-space()='Google']") }
    expect(@driver.find_element(:xpath, "//span[normalize-space()='Google']")).to be_displayed
  end

  it 'Sign up button redirects to sign-up page' do
    home.click_sign_up
    @wait.until { @driver.find_element(name: 'phoneNumber') }
    expect(@driver.find_element(name: 'phoneNumber')).to be_displayed
  end
end
