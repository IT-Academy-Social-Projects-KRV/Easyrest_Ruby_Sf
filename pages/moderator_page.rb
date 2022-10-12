# frozen_string_literal: true

# This page is for creating objects from moderator page elements
class ModeratorPage
  USERS_BTN = { css: '[href*="users"]' }.freeze
  OWNERS_BTN = { css: '[href*="owners"]' }.freeze
  RESTAIRANTS_BTN = { css: '[href*="moderator/restaurants"]' }.freeze
  ALL_TAB = { xpath: '//main/div[1]/header/div/div[2]/div[2]/div/button[1]/span[1]/span' }.freeze
  APPROVED_TAB = { xpath: '//main/div[1]/header/div/div[2]/div[2]/div/button[3]' }.freeze
  DELETE_BTN = { xpath: '/html/body/div/div/main/div[2]/div[1]/div/div/div[3]/button' }.freeze
  UNAPPROVED_TAB = { xpath: '/html/body/div/div/main/div[1]/header/div/div[2]/div[2]/div/button[2]/span[1]/span' }.freeze
  ARCHIVED_TAB = { xpath: '//div/div/main/div[1]/header/div/div[2]/div[2]/div/button[4]/span[1]/span/span' }.freeze
  APPROVED_BTN = { xpath: '/html/body/div/div/main/div[2]/div[1]/div/div/div[3]/button[2]/span[1]' }.freeze
  RESTORE_BTN = { xpath: '/html/body/div/div/main/div[2]/div[1]/div/div/div[3]/button' }.freeze
  DISAPPROVE_BTN = { xpath: '/html/body/div/div/main/div[2]/div[4]/div/div/div[3]/button[1]/span[1]' }.freeze
  BAN_UNBAN_USER_BTN = { xpath: "//tbody/tr[8]/td[5]/button[1]/span[1]//*[name()='svg']" }.freeze
  BAN_UNBAN_OWNER_BTN = { xpath: "//tbody/tr[4]/td[6]/button[1]/span[1]//*[name()='svg']" }.freeze

  def
     initialize(driver)
    @driver = driver
  end

  def click_users_btn
    @driver.find_element(USERS_BTN).click
  end

  def click_owners_btn
    @driver.find_element(OWNERS_BTN).click
  end

  def click_restaurants_btn
    @driver.find_element(RESTAIRANTS_BTN).click
  end

  def click_all_btn
    @driver.find_element(ALL_TAB).click
  end

  def can_detele_restaurant
    @driver.find_element(DELETE_BTN).click
  end

  def click_archived
    @driver.find_element(ARCHIVED_TAB).click
  end

  def click_restore_btn
    @driver.find_element(RESTORE_BTN).click
  end

  def click_unapproved
    @driver.find_element(UNAPPROVED_TAB).click
  end

  def can_disapprove
    @driver.find_element(DISAPPROVE_BTN).click
  end

  def click_approved
    @driver.find_element(APPROVED_TAB).click
  end

  def can_approve
    @driver.find_element(APPROVED_BTN).click
  end

  def ban_unban_owners
    @driver.find_element(BAN_UNBAN_OWNER_BTN).click
  end

  def ban_unban_users
    @driver.find_element(BAN_UNBAN_USER_BTN).click
  end
end
