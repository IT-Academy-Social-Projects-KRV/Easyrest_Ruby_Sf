# frozen_string_literal: true

# This class OwnerManaging is for owner managin page.
class OwnerManaging
  THREE_DOT_BTN = { xpath: '/html/body/div/main/div/div/div/div[1]/div[1]/div[2]/div/div[2]/div/div[1]/button' }.freeze
  ARCHIVE_UNARCHIVE_BTN = { xpath: '//div[2]/div[2]/ul/li/div[2]/span' }.freeze
  MANAGE_BTN = { xpath: '//div[2]/div[2]/ul/a/div[2]/span' }.freeze
  EDIT_REST_BTN = { xpath: '//div/div/main/div[2]/button' }.freeze
  EDIT_REST_NAME_FLD = { xpath: "//input[@name='name']" }.freeze
  EDIT_REST_ADDRESS_FLD = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[2]/div/div/input' }.freeze
  EDIT_REST_PHONE_FLD = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[3]/div/div/input' }.freeze
  EDIT_REST_PREVIEW_TXT_FLD = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[4]/div/div/textarea' }.freeze
  EDIT_REST_TAG_BTN = { xpath: '//*[@id="select-tags"]' }.freeze
  EDIT_REST_DESCRIPTION_FLD = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[6]/div/div[2]/div/div/div/div/div' }.freeze
  EDIT_HEADING_BTN = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[6]/div/div[1]/div[1]/button[1]' }.freeze
  EDIT_BLOCKQUOTE_BTN = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[6]/div/div[1]/div[1]/button[2]' }.freeze
  EDIT_UL_BTN = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[6]/div/div[1]/div[1]/button[3]' }.freeze
  EDIT_OL_BTN = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[6]/div/div[1]/div[1]/button[4]' }.freeze
  EDIT_BOLD_BTN = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[6]/div/div[1]/div[2]/button[1]' }.freeze
  EDIT_ITALIC_BTN = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[6]/div/div[1]/div[2]/button[2]' }.freeze
  EDIT_UNDERLINE_BTN = { xpath: '//div[3]/div/div/div/div[2]/form/div/div[6]/div/div[1]/div[2]/button[3]' }.freeze
  EDIT_UPDATE_BTN = { xpath: "//span[contains(@class, 'MuiButton-label')][contains(., 'Update')]" }.freeze
  EDIT_CANCEL_BTN = { xpath: '//div/div/main/div[3]/div/div/div/div[2]/form/div/div[8]/button/span[1]' }.freeze
  DETAILS_BTN = { xpath: '//div/div/div/div/ul/a[1]/div[2]/span' }.freeze
  MENUES_BTN = { xpath: '//div/div/div/div/ul/div/div[2]/span' }.freeze
  WAITERS_BTN = { xpath: '//div/div/div/div/ul/a[2]/div[2]/span' }.freeze
  ADMINISTRATORS_BTN = { xpath: '//div/div/div/div/ul/a[3]/div[2]/span' }.freeze
  DELETE_WAITER_BTN = { xpath: '//div/div/main/div[1]/ul/li[3]/button' }.freeze
  ADD_WAITER_BTN = { xpath: "//button[contains(@title, 'Add Waiter')]" }.freeze
  WAITER_NAME_FLD = { xpath: '//div/div/main/div[3]/div/div/div/div[2]/form/div/div[1]/div/div/input' }.freeze
  WAITER_EMAIL_FLD = { xpath: '//div/div/main/div[3]/div/div/div/div[2]/form/div/div[2]/div/div/input' }.freeze
  WAITER_PASSWORD_FLD = { xpath: '//div/div/main/div[3]/div/div/div/div[2]/form/div/div[3]/div/div/input' }.freeze
  WAITER_PHONE_FLD = { xpath: '//div/div/main/div[3]/div/div/div/div[2]/form/div/div[4]/div/div/input' }.freeze
  ADD_WAITER_MENU_BTN = { xpath: "//span[contains(@class, 'MuiButton-label')][contains(., 'Add')]" }.freeze
  CANCEL_WAITER_BTN = { xpath: '//div/div/main/div[3]/div/div/div/div[2]/form/div/div[6]/button/span[1]' }.freeze
  DELETE_ADMINISTRATOR_BTN = { xpath: '//div/div/main/div[1]/ul/li/button' }.freeze
  ADD_ADMINISTRATOR_BTN = { xpath: "//button[contains(@title, 'Add Administrator')]" }.freeze
  ADMINISTRATOR_NAME_FLD = { name: 'name' }.freeze
  ADMINISTRATOR_EMAIL_FLD = { name: 'email' }.freeze
  ADMINISTRATOR_PASSWORD_FLD = { name: 'password' }.freeze
  ADMINISTRATOR_PHONE_FLD = { name: 'phone_number' }.freeze
  ADD_ADMINISTRATOR_MENU_BTN = { xpath: '//div/div/main/div[3]/div/div/div/div[2]/form/div/div[7]/button/span[1]' }.freeze
  CANCEL_ADMINISTRATOR_BTN = { xpath: '//div/div/main/div[3]/div/div/div/div[2]/form/div/div[6]/button/span[1]' }.freeze

  def initialize(driver)
    @driver = driver
  end

  def delete_value
    @driver.find_element(EDIT_REST_NAME_FLD).click
    @driver.action.key_down(:control).send_keys('a').key_up(:control).perform
  end

  def click_three_dot_btn
    @driver.find_element(THREE_DOT_BTN).click
  end

  def click_archive_unarchive_btn
    @driver.find_element(ARCHIVE_UNARCHIVE_BTN).click
  end

  def click_manage_btn
    @driver.find_element(MANAGE_BTN).click
  end

  def click_edit_rest_btn
    @driver.find_element(EDIT_REST_BTN).click
  end

  def edit_rest_name(value)
    @driver.find_element(EDIT_REST_NAME_FLD).send_keys(value)
  end

  def edit_rest_address(value)
    @driver.find_element(EDIT_REST_ADDRESS_FLD).send_keys(value)
  end

  def edit_rest_phone(value)
    @driver.find_element(EDIT_REST_PHONE_FLD).send_keys(value)
  end

  def edit_rest_preview_txt(value)
    @driver.find_element(EDIT_REST_PREVIEW_TXT_FLD).send_keys(value)
  end

  def edit_click_rest_tag_fld
    @driver.find_element(EDIT_REST_TAG_BTN).click
  end

  def edit_rest_description(value)
    @driver.find_element(EDIT_REST_DESCRIPTION_FLD).send_keys(value)
  end

  def edit_click_heading_btn
    @driver.find_element(EDIT_HEADING_BTN).click
  end

  def edit_click_blockquote_btn
    @driver.find_element(EDIT_BLOCKQUOTE_BTN).click
  end

  def edit_click_ul_btn
    @driver.find_element(EDIT_UL_BTN).click
  end

  def edit_click_ol_btn
    @driver.find_element(EDIT_OL_BTN).click
  end

  def edit_click_bold_btn
    @driver.find_element(EDIT_BOLD_BTN).click
  end

  def edit_click_italic_btn
    @driver.find_element(EDIT_ITALIC_BTN).click
  end

  def edit_click_underline_btn
    @driver.find_element(EDIT_UNDERLINE_BTN).click
  end

  def edit_click_update_btn
    @driver.find_element(EDIT_UPDATE_BTN).click
  end

  def edit_click_cancel_btn
    @driver.find_element(EDIT_CANCEL_BTN).click
  end

  def click_details_btn
    @driver.find_element(DETAILS_BTN).click
  end

  def click_menues_btn
    @driver.find_element(MENUES_BTN).click
  end

  def click_waiters_btn
    @driver.find_element(WAITERS_BTN).click
  end

  def click_administrators_btn
    @driver.find_element(ADMINISTRATORS_BTN).click
  end

  def click_delete_waiter_btn
    @driver.find_element(DELETE_WAITER_BTN).click
  end

  def click_add_waiter_btn
    @driver.find_element(ADD_WAITER_BTN).click
  end

  def type_waiter_name(value)
    @driver.find_element(WAITER_NAME_FLD).send_keys(value)
  end

  def type_waiter_email(value)
    @driver.find_element(WAITER_EMAIL_FLD).send_keys(value)
  end

  def type_waiter_password(value)
    @driver.find_element(WAITER_PASSWORD_FLD).send_keys(value)
  end

  def type_waiter_phone(value)
    @driver.find_element(WAITER_PHONE_FLD).send_keys(value)
  end

  def click_add_waiter_menu_btn
    @driver.find_element(ADD_WAITER_MENU_BTN).click
  end

  def click_cancel_waiter_btn
    @driver.find_element(CANCEL_WAITER_BTN).click
  end

  def click_delete_administrator_btn
    @driver.find_element(DELETE_ADMINISTRATOR_BTN).click
  end

  def click_add_administrator_btn
    @driver.find_element(ADD_ADMINISTRATOR_BTN).click
  end

  def type_administrator_name(value)
    @driver.find_element(ADMINISTRATOR_NAME_FLD).send_keys(value)
  end

  def type_administrator_email(value)
    @driver.find_element(ADMINISTRATOR_EMAIL_FLD).send_keys(value)
  end

  def type_administrator_password(value)
    @driver.find_element(ADMINISTRATOR_PASSWORD_FLD).send_keys(value)
  end

  def type_administrator_phone(value)
    @driver.find_element(ADMINISTRATOR_PHONE_FLD).send_keys(value)
  end

  def click_add_administrator_menu_btn
    @driver.find_element(ADD_ADMINISTRATOR_MENU_BTN).click
  end

  def click_cancel_administrator_btn
    @driver.find_element(CANCEL_ADMINISTRATOR_BTN).click
  end
end
