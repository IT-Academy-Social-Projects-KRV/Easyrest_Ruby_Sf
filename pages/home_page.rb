# frozen_string_literal: true

require_relative 'login_page'

# This page contains class HomePage and the page objects for it.
class HomePage < LoginPage
  HOMEPAGE_BTN = { xpath: '/html/body/div/header/div/nav/a[1]/span' }.freeze
  VIEW_ALL_BTN = { xpath: '/html/body/div/main/div/div/div[1]/a/img' }.freeze
  SIGN_UP_BTN = { css: "[href*='/sign-up']" }.freeze
  RESTAURANTS_LIST_BTN = { css: "[href*='/restaurants']" }.freeze

  category_name = ['vegeterian', 'sushi', 'fast food', 'pub', 'pizza', 'kebab', 'beer', 'ukrainian cuisine']

  VIEW_CATEGORY = { xpath: "//h6[normalize-space()='#{category_name.sample}']" }.freeze
  EASY_REST_BTN = { xpath: '/html/body/div/header/div/a' }.freeze

  def initialize(driver)
    @driver = driver
    super
  end

  def click_homepage
    @driver.find_element(HOMEPAGE_BTN).click
  end

  def click_view_all
    @driver.find_element(VIEW_ALL_BTN).click
  end

  def click_sign_up
    @driver.find_element(SIGN_UP_BTN).click
  end

  def click_restaurants_list
    @driver.find_element(RESTAURANTS_LIST_BTN).click
  end

  def click_any_category
    @driver.find_element(VIEW_CATEGORY).click
  end

  def click_easy_rest
    @driver.find_element(EASY_REST_BTN).click
  end
end
