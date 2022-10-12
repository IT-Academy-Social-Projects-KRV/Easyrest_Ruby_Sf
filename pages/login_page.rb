# frozen_string_literal: true

# This class is for login page
class LoginPage
  SIGN_IN_BTN = { css: "[href*='/log-in']" }.freeze
  EMAIL_FIELD = { xpath: "//input[@name='email']" }.freeze
  PASSWORD_FIELD = { xpath: "//input[@name='password']" }.freeze
  SUBMIT_BTN = { xpath: "//button[@type='submit']" }.freeze
  SIGN_UP_BTN = { xpath: "//span[normalize-space()='Create account']" }.freeze

  def initialize(driver)
    @driver = driver
  end

  def clear_email
    @driver.find_element(EMAIL_FIELD).click
    @driver.action.key_down(:control).send_keys('a').key_up(:control).perform
  end

  def clear_pwd
    @driver.find_element(PASSWORD_FIELD).click
    @driver.action.key_down(:control).send_keys('a').key_up(:control).perform
  end

  def click_sign_in
    @driver.find_element(SIGN_IN_BTN).click
  end

  def type_email(value)
    @driver.find_element(EMAIL_FIELD).send_keys(value)
  end

  def type_password(value)
    @driver.find_element(PASSWORD_FIELD).send_keys(value)
  end

  def click_submit
    @driver.find_element(SUBMIT_BTN).click
  end
end
