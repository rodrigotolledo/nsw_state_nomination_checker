require 'watir-webdriver'
require 'mail'

describe "NSW State Migration Website" do
	context "when I visit the state migration plan" do

		before(:all) do
			@browser = Watir::Browser.new :chrome
		end

		after(:all) do
			@browser.close
		end

		it "should send an email if IT Visas are still SUSPENDED" do
			@browser.goto 'http://www.business.nsw.gov.au/live-and-work-in-nsw/visa-and-migration/state-migration-plan'
			if @browser.text.include?("Other Engineering Professional").should == true or @browser.text.include?("Software and Applications Programmers").should == true
				send_email
			end
		end
	end
end

def send_email
	options = { :address      => "smtp.gmail.com",
		:port                 => 587,
		:domain               => 'rtolled.local',
		:user_name            => 'nsw.state.nomination.checker',
		:password             => 'abc12345!',
		:authentication       => 'plain',
		:enable_starttls_auto => true  }

	Mail.defaults do
		delivery_method :smtp, options
	end

	Mail.deliver do
		to 'rodrigotolledo@gmail.com'
		from 'nsw.state.nomination.checker@gmail.com'
		subject 'NSW State Nomination - IT Visas are still SUSPENDED!!!'
		body 'NSW State Nomination - IT Visas are still SUSPENDED!!!'
	end
end
