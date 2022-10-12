# frozen_string_literal: true

require_relative '../shared_context/shared_context_spec'
require_relative '../pages/moderator_page'
require_relative '../pages/shared_objects'

cred = YAML.load_file('config/test_data.yml')

RSpec.describe ModeratorPage do
  let(:mod) { described_class.new(@driver) }
  let(:user) { cred.fetch('emails')['mod_email'] }
  let(:pw) { cred.fetch('pw')['mod_pwd'] }

  include_context 'login'

  it 'can disapprove a restaurant' do
    mod.click_unapproved
    mod.can_disapprove
    @wait.until { @driver.find_element(xpath: "//span[contains(text(),'Archived (4)')]").displayed? }
    expect(@driver.find_element(xpath: "//span[contains(text(),'Archived (4)')]").text).to eq('ARCHIVED (4)')
  end

  it 'can approve a restaurant' do
    mod.can_approve
    @wait.until { @driver.find_element(xpath: "//span[contains(text(),'Approved (4)')]").displayed? }
    expect(@driver.find_element(xpath: "//span[contains(text(),'Approved (4)')]").text).to eq('APPROVED (4)')
  end

  it 'can delete a restaurant' do
    mod.click_approved
    mod.can_detele_restaurant
    @wait.until { @driver.find_element(xpath: "//span[contains(text(),'Archived (5)')]").displayed? }
    expect(@driver.find_element(xpath: "//span[contains(text(),'Archived (5)')]").text).to eq('ARCHIVED (5)')
  end

  it 'can restore a restaurant' do
    mod.click_archived
    mod.click_restore_btn
    @wait.until { @driver.find_element(xpath: "//span[contains(text(),'Approved (4)')]").displayed? }
    expect(@driver.find_element(xpath: "//span[contains(text(),'Approved (4)')]").text).to eq('APPROVED (4)')
  end

  it 'can ban/unban users' do
    mod.click_users_btn
    @wait.until { @driver.find_element(xpath: "//tbody/tr[8]/td[5]/button[1]/span[1]//*[name()='svg']").displayed? }
    mod.ban_unban_users
    @wait.until { @driver.find_element(xpath: "//span[contains(text(),'Banned (1)')]").displayed? }
    expect(@driver.find_element(xpath: "//span[contains(text(),'Active (9)')]").text).to eq('ACTIVE (9)')
    mod.ban_unban_users
    @wait.until { @driver.find_element(xpath: "//span[contains(text(),'Banned (0)')]").displayed? }
    expect(@driver.find_element(xpath: "//span[contains(text(),'Banned (0)')]").text).to eq('BANNED (0)')
  end

  it 'can ban/unban owners' do
    mod.click_owners_btn
    @wait.until { @driver.find_element(xpath: "//tbody/tr[4]/td[6]/button[1]/span[1]//*[name()='svg']").displayed? }
    mod.ban_unban_owners
    @wait.until { @driver.find_element(xpath: "//span[contains(text(),'Banned (1)')]").displayed? }
    expect(@driver.find_element(xpath: "//span[contains(text(),'Active (4)')]").text).to eq('ACTIVE (4)')
    mod.ban_unban_owners
    @wait.until { @driver.find_element(xpath: "//span[contains(text(),'Banned (0)')]").displayed? }
    expect(@driver.find_element(xpath: "//span[contains(text(),'Banned (0)')]").text).to eq('BANNED (0)')
  end
end
