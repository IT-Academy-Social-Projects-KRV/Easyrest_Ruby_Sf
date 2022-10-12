# frozen_string_literal: true

# This class is for AdminPage
class AdminPage
  USER_ADMIN_PROFILE_BTN = { xpath: '/html/body/div/header/div/div/div/button/span[1]/div' }.freeze
  ADMIN_PANEL = { css: '[href*="/admin"]' }.freeze
  USERS_BTN = { css: '[href*=users]' }.freeze
  OWNERS_BTN = { xpath: '/html/body/div/div/ul/a[2]' }.freeze
  LOCK_BTN = { xpath: '/html/body/div/div/main/div[2]/table/tbody/tr[1]/td[5]/button' }.freeze
  UNLOCK_BTN = { xpath: '/html/body/div/div/main/div[2]/table/tbody/tr/td[5]/button' }.freeze
  MODERATORS_BTN = { css: '[href*="/admin/moderators"]' }.freeze
  MODERATORS_ALL = { xpath: '/html/body/div/div/main/div[1]/header/div/div[2]/div[2]/div/button[1]/span[1]/span/span' }.freeze
  MODERATORS_ACTIVE = { xpath: '/html/body/div/div/main/div[1]/header/div/div[2]/div[2]/div/button[2]/span[1]/span/span' }.freeze
  MODERATORS_BANNED = { xpath: '/html/body/div/div/main/div[1]/header/div/div[2]/div[2]/div/button[3]/span[1]/span/span' }.freeze
  ADD_MODERATOR_BTN = { xpath: '/html/body/div/div/main/a' }.freeze
  MODERATOR_CANCEL_BTN = { xpath: '/html/body/div/div/main/div/div/form/div/div/div[7]/div/a' }.freeze
  ADD_MODERATOR_NAME = { name: 'name' }.freeze
  ADD_MODERATOR_EMAIL = { name: 'email' }.freeze
  ADD_MODERATOR_PHONENUMBER = { name: 'phoneNumber' }.freeze
  ADD_MODERATOR_BIRTHDATE = { name: 'birthDate' }.freeze
  ADD_MODERATOR_PASS = { name: 'password' }.freeze
  ADD_MODERATOR_CONFIRMPASS = { name: 'repeated_password' }.freeze
  ADD_MODERATOR_CREATEACC = { xpath: '/html/body/div/div/main/div/div/form/div/div/div[7]/div/button' }.freeze
  RESTAURANTS_BTN = { xpath: '/html/body/div/div/ul/a[4]/div[2]' }.freeze
  RESTAURANTS_UNAPPROVED = { xpath: '/html/body/div/div/main/div[1]/header/div/div[2]/div[2]/div/button[2]/span[1]/span' }.freeze
  RESTAURANTS_APPROVED = { xpath: '/html/body/div/div/main/div[1]/header/div/div[2]/div[2]/div/button[3]/span[1]/span' }.freeze

  YEARS_SELECT = { xpath: '/html/body/div[2]/div[2]/div/div[1]/div[1]/h6' }.freeze
  YEAR = { xpath: '/html/body/div[2]/div[2]/div/div[1]/div[2]/div[96]' }.freeze # 95 year
  DAY_SELECT = { xpath: '/html/body/div[2]/div[2]/div/div[1]/div[3]/div/div[4]/div[6]/button/span[1]' }.freeze # 22 day
  OK_BTN_DATE = { xpath: "//span[contains(@class, 'MuiButton-label')][contains(., 'OK')]" }.freeze

  def initialize(driver)
    @driver = driver
  end

  def click_user_admin_profile
    @driver.find_element(USER_ADMIN_PROFILE_BTN).click
  end

  def click_admin_panel
    @driver.find_element(ADMIN_PANEL).click
  end

  def click_users_btn
    @driver.find_element(USERS_BTN).click
  end

  def click_lock_button
    sleep(1)
    @driver.find_element(LOCK_BTN).click
  end

  def click_unlock_button
    sleep(1)
    @driver.find_element(UNLOCK_BTN).click
  end

  def click_owners
    @driver.find_element(OWNERS_BTN).click
  end

  def click_moderators_btn
    @driver.find_element(MODERATORS_BTN).click
  end

  def click_moderators_all
    @driver.find_element(MODERATORS_ALL).click
  end

  def click_moderators_active
    @driver.find_element(MODERATORS_ACTIVE).click
  end

  def click_moderators_banned
    @driver.find_element(MODERATORS_BANNED).click
  end

  def click_moderators_cancel
    @driver.find_element(MODERATORS_CANCEL_BTN).click
  end

  def click_add_moderators
    @driver.find_element(ADD_MODERATOR_BTN).click
  end

  def click_add_moderators_birthdate
    @driver.find_element(ADD_MODERATOR_BIRTHDATE).click
  end

  def click_add_moderators_confirmpass(value)
    @driver.find_element(ADD_MODERATOR_CONFIRMPASS).send_keys(value)
  end

  def click_add_moderators_createacc
    @driver.find_element(ADD_MODERATOR_CREATEACC).click
  end

  def click_add_moderators_email(value)
    @driver.find_element(ADD_MODERATOR_EMAIL).send_keys(value)
  end

  def click_add_moderators_name(value)
    @driver.find_element(ADD_MODERATOR_NAME).send_keys(value)
  end

  def click_add_moderators_pass(value)
    @driver.find_element(ADD_MODERATOR_PASS).send_keys(value)
  end

  def click_add_moderators_phonenumber(value)
    @driver.find_element(ADD_MODERATOR_PHONENUMBER).send_keys(value)
  end

  def click_restaurants_btn
    @driver.find_element(RESTAURANTS_BTN).click
  end

  def click_restaurants_approved
    @driver.find_element(RESTAURANTS_APPROVED).click
  end

  def click_restaurants_unapproved
    @driver.find_element(RESTAURANTS_UNAPPROVED).click
  end

  def click_years_fld
    @driver.find_element(YEARS_SELECT).click
  end

  def click_year
    @driver.find_element(YEAR).click
  end

  def click_day
    @driver.find_element(DAY_SELECT).click
  end

  def click_ok_btn
    @driver.find_element(OK_BTN_DATE).click
  end
end
