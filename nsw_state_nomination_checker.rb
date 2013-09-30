require 'watir-webdriver'

describe "NSW State Migration Website" do
	context "when I visit the state migration plan" do

		before(:all) do
			@browser = Watir::Browser.new :chrome
		end

		after(:all) do
			@browser.close
		end

		it "should NOT have Software Development occupations suspended" do
			@browser.goto 'http://www.business.nsw.gov.au/live-and-work-in-nsw/visa-and-migration/state-migration-plan'
			@browser.text.include?("Other Engineering Professional").should == true
			@browser.text.include?("Software and Applications Programmers").should == true
		end
	end
end
