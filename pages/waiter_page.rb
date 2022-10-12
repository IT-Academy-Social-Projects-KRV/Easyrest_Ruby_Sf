# frozen_string_literal: true

# This page is for creating objects from waiter page elements
class WaiterPage
  def initialize(driver)
    @driver = driver
  end

  def click_all_btn
    @driver.find_element(:css, '[href*="orders"]').click
  end

  def click_start_btn
    @driver.find_element(:css, '[href*="Assigned"]').click
    sleep(1)
    @driver.find_element(:xpath, '/html/body/div/main/div/div[1]/div/div/div[2]/div/div[4]/div/button').click
    sleep(1)
    @driver.find_element(:xpath, '/html/body/div/main/div/div[1]/div/div[2]/div/div/div[2]/button').click
  end

  def click_close_btn
    @driver.find_element(:css, '[href*="progress"]').click
    sleep(2)
    @driver.find_element(:xpath, '/html/body/div/main/div/div[1]/div/div/div[2]/div/div[4]/div/button').click
    sleep(2)
    @driver.find_element(:xpath, '/html/body/div/main/div/div[1]/div/div[2]/div/div/div[2]/button').click
  end

  def click_history_btn
    @driver.find_element(:css, '[href*="History"]').click
  end
end
