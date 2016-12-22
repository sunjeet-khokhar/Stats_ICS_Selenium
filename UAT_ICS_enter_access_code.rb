require "json"
require "selenium-webdriver"
#include RSpec::Expectations
require "rspec/Expectations"


    def enter_access_code(access_code)

    arr = access_code.split('')
    ac1 = arr[0..2]
    ac2 = arr[3..5]
    ac3 = arr[6..8]
    ac4 = arr[9..11]


    @driver = Selenium::WebDriver.for :firefox 
    @base_url = "https://censusinterim-uat.cwp.govt.nz/census-test/landing/"
    @driver.get(@base_url)
    @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_0").clear
    @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_0").send_keys(ac1)
    @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_1").clear
    @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_1").send_keys(ac2)
    @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_2").clear
    @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_2").send_keys(ac3)
    @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_3").clear
    @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_3").send_keys(ac4)
    @driver.find_element(:id, "Form_UniqueCodeForm_action_doValidateCode").click


    
    #wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

     #explicitly wait for the Dwelling form CSS label to load
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    wait.until { @driver.find_element(:css, "th.panel-detail.detail-title") }
     
     
     #then navigate back to logout
     @driver.navigate.back

     #explicitly wait for the access code box element to load
     wait.until { @driver.find_element(:id, "Form_UniqueCodeForm_uniqueCode_3") }

     #expect(page_message).to eql 'Congratulations! You must have the proper credentials.'

    #@driver.wait
    @driver.quit

    end
   
    enter_access_code('100000008snj')