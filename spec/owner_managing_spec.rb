# frozen_string_literal: true

require_relative '../shared_context/shared_context_spec'
require_relative '../pages/owner_managing_rest_page'
require_relative 'spec_helper'

cred_reg = YAML.load_file('config/test_data.yml')

RSpec.describe OwnerManaging do
  let(:owner) { described_class.new(@driver) }
  let(:user) { cred_reg.fetch('emails')['owner_email'] }
  let(:pw) { cred_reg.fetch('pw')['owner_pwd'] }

  include_context 'login'

  it 'Can archive and unarchive a restaurant.' do
    owner.click_three_dot_btn
    owner.click_archive_unarchive_btn
    @wait.until { @driver.find_element(xpath: "//span[normalize-space()='ARCHIVED']").displayed? }
    expect(@driver.find_element(xpath: "//span[normalize-space()='ARCHIVED']").text).to eq('ARCHIVED')
    owner.click_three_dot_btn
    owner.click_archive_unarchive_btn
    @wait.until { @driver.find_element(xpath: "//span[normalize-space()='NOT APPROVED']").displayed? }
    expect(@driver.find_element(xpath: "//span[normalize-space()='NOT APPROVED']").text).to eq('NOT APPROVED')
  end

  it 'Can manage a restaurant.' do
    owner.click_three_dot_btn
    owner.click_manage_btn
    expect(@driver.find_element(css: "[href*='info']")).to be_displayed
  end

  it 'Can edit the info of restaurant.' do
    owner.click_edit_rest_btn
    @wait.until { @driver.find_element(xpath: "//input[@name='name']").displayed? }
    owner.delete_value
    owner.edit_rest_name('AleksandrosRest')
    owner.edit_click_blockquote_btn
    owner.edit_click_ol_btn
    owner.edit_click_update_btn
    @wait.until { @driver.find_element(xpath: '/html/body/div/div/main/div[4]/div').displayed? }
    expect(@driver.find_element(xpath: "//span[contains(@id, 'client-snackbar')]").text).to eq('Restaurant was successfully updated')
  end

  it 'Can add a waiter.' do
    owner.click_waiters_btn
    owner.click_add_waiter_btn
    @wait.until { @driver.find_element(xpath: '/html/body/div/div/main/div[3]/div/div/div/div[2]/form/div/div[1]/div/div/input').displayed? }
    owner.type_waiter_name(cred_reg.fetch('test_waiter')['waiter_name'])
    owner.type_waiter_email(cred_reg.fetch('test_waiter')['waiter_email'])
    owner.type_waiter_password(cred_reg.fetch('test_waiter')['waiter_pw'])
    owner.type_waiter_phone(cred_reg.fetch('test_waiter')['witer_phone'])
    @wait.until { @driver.find_element(xpath: "//span[contains(@class, 'MuiButton-label')][contains(., 'Add')]").displayed? }
    owner.click_add_waiter_menu_btn
    @wait.until { @driver.find_element(xpath: '/html/body/div/div/main/div[4]/div').displayed? }
    expect(@driver.find_element(xpath: "//span[contains(@id, 'client-snackbar')]").text).to eq('User successfully added')
  end

  it 'Can delete a waiter.' do
    owner.click_delete_waiter_btn
    @wait.until { @driver.find_element(xpath: "//span[contains(@class, 'MuiButton-label')][contains(., 'Add')]").displayed? }
    expect(@driver.find_element(xpath: '//div/div/main/div[1]').text).not_to include(cred_reg.fetch('test_waiter')['waiter_name'])
  end

  it 'Can add a administrator.' do
    owner.click_administrators_btn
    owner.click_add_administrator_btn
    @wait.until { @driver.find_element(name: 'name').displayed? }
    owner.type_administrator_name(cred_reg.fetch('test_administrator')['administrator_name'])
    owner.type_administrator_email(cred_reg.fetch('test_administrator')['administrator_email'])
    owner.type_administrator_password(cred_reg.fetch('test_administrator')['administrator_pw'])
    owner.type_administrator_phone(cred_reg.fetch('test_administrator')['administrator_phone'])
    @wait.until { @driver.find_element(xpath: "//span[contains(@class, 'MuiButton-label')][contains(., 'Add')]").displayed? }
    owner.click_add_administrator_menu_btn
    @wait.until { @driver.find_element(xpath: '/html/body/div/div/main/div[4]/div').displayed? }
    expect(@driver.find_element(xpath: "//span[contains(@id, 'client-snackbar')]").text).to eq('User successfully added')
  end

  it 'Can delete a administrator.' do
    owner.click_delete_administrator_btn
    @wait.until { @driver.find_element(xpath: '//div/div/main/div[1]').displayed? }
    expect(@driver.find_element(xpath: '//div/div/main/div[1]').text).not_to include(cred_reg.fetch('test_administrator')['administrator_name'])
  end
end
