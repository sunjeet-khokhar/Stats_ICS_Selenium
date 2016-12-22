require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "UATICSIFFormSection1" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://censusinterim-uat.cwp.govt.nz/census-test/landing/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_u_a_t_i_c_s_i_f_form_section1" do
    @driver.get(@base_url + "/census-test/census/summary")
    @driver.find_element(:css, "button.button-start-form").click
    @driver.find_element(:name, "hsp_confirm_name").click
    @driver.find_element(:xpath, "//input[@type='tel']").clear
    @driver.find_element(:xpath, "//input[@type='tel']").send_keys "01"
    @driver.find_element(:xpath, "(//input[@type='tel'])[2]").clear
    @driver.find_element(:xpath, "(//input[@type='tel'])[2]").send_keys "10"
    @driver.find_element(:xpath, "(//input[@type='tel'])[3]").clear
    @driver.find_element(:xpath, "(//input[@type='tel'])[3]").send_keys "1981"
    @driver.find_element(:name, "_form.individualFormSchema._field.sex").click
    @driver.find_element(:name, "ur_confirm_address").click
    @driver.find_element(:xpath, "(//input[@type='tel'])[4]").clear
    @driver.find_element(:xpath, "(//input[@type='tel'])[4]").send_keys "3"
    @driver.find_element(:name, "ethnicity_predefined").click
    @driver.find_element(:name, "_form.individualFormSchema._field.country_birth._field.country_birth_predefined").click
    @driver.find_element(:css, "button.button-next.hide-on-mobile").click
  end
  
  def element_present?(how, what)
    ${receiver}.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    ${receiver}.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = ${receiver}.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
