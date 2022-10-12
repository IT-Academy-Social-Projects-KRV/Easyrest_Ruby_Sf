# frozen_string_literal: true

require_relative 'restaurant_list'

# This page is for class OrderingFood
class OrderingFood < RestaurantList
  ADD_CHIKEN_BROCCOLI = { xpath: '//div[2]//div[1]//div[1]//div[1]//div[2]//div[2]//div[1]//div[3]//button[1]//span[1]' }.freeze
  CHIKEN_BROCCOLI_DETAILS = { xpath: '//div[2]/div[2]/div/div[2]/div/div/div/div[2]/div[2]/div/div[2]' }.freeze
  GO_TO_SALAD = { css: "[href*='#Salats']" }.freeze
  SHOW_CART = { css: "[aria-label='Show cart']" }.freeze
  SUBMIT_ORDER_BTN = { xpath: "//span[normalize-space()='Submit order']" }.freeze
  CHANGE_QUANTITY = { xpath: '//*[@id="quantity"]' }.freeze
  REMOVE_ITEM = { css: "[aria-label='Remove item']" }.freeze
  REMOVE_ITEM_FROM_ORD_CONFM = { xpath: '//div[2]/div[2]/div/div[2]/div[2]/table/tbody/tr[1]/td[1]/button' }.freeze
  CHANGE_QUANTITY_ORD_CONFM = { xpath: '/html/body/div[2]/div[2]/div/div[2]/div[2]/table/tbody/tr[1]/td[5]/div/div/input' }.freeze
  CANCEL_BTN = { xpath: '/html/body/div[2]/div[2]/div/div[3]/button[1]' }.freeze
  SUBMIT_BTN = { xpath: '//div[2]/div[2]/div/div[3]/button[2]/span[1]' }.freeze

  def initialize(driver)
    @driver = driver
    super
  end

  def select_chiken_broccoli
    @driver.find_element(ADD_CHIKEN_BROCCOLI).click
  end

  def view_details
    @driver.find_element(CHIKEN_BROCCOLI_DETAILS).click
  end

  def cart_show
    @driver.find_element(SHOW_CART).click
  end

  def goto_salad
    @driver.find_element(GO_TO_SALAD).click
  end

  def click_submit
    @driver.find_element(SUBMIT_ORDER_BTN).click
  end

  def quantity_highlight
    @driver.find_element(CHANGE_QUANTITY).click
    @driver.action.key_down(:control).send_keys('a').key_up(:control).perform
  end

  def quantity_change(value)
    @driver.find_element(CHANGE_QUANTITY).send_keys(value)
  end

  def remove_item
    hover = @driver.find_element(xpath: '/html/body/div/main/div[2]/div[3]/div/div/div/div[1]')
    @driver.action.move_to(hover).perform
    @driver.find_element(REMOVE_ITEM).click
  end

  def remove_item_from_order_confirmation
    @driver.find_element(REMOVE_ITEM_FROM_ORD_CONFM).click
  end

  def quantity_highlight_order_conformation
    @driver.find_element(CHANGE_QUANTITY_ORD_CONFM).click
    @driver.action.key_down(:control).send_keys('a').key_up(:control).perform
  end

  def quantity_change_order_confirmation(value)
    @driver.find_element(CHANGE_QUANTITY_ORD_CONFM).send_keys(value)
  end

  def click_cancel_order_confirmation
    @driver.find_element(CANCEL_BTN).click
  end

  def click_submit_order_confirmation
    @driver.find_element(SUBMIT_BTN).click
  end
end
