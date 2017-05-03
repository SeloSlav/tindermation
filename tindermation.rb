require 'rubygems'
require 'appium_lib'
require 'nokogiri'
require 'open-uri'

if ENV['SAUCE']
  capabilities = {
    'appium-version'=> '1.6.4',
    'platformName'=> 'Android',
    'platformVersion'=> '6.0',
    'deviceName'=> 'Android Emulator',
    'app'=> 'sauce-storage:tinder.apk.zip',
    'appPackage' => 'com.tinder',
    'appActivity' => 'com.tinder.activities.ActivitySplashLoading_',
    'name' => "Tindermation",
    'locationServicesEnabled' => true
  }
  server_url = "http://localhost:4723/wd/hub/status"
  Appium::Driver.new(caps: capabilities).start_driver
else
  capabilities = {
    'appium-version'=> '1.6.4',
    'platformName'=> 'Android',
    'platformVersion'=> '6.0',
    'deviceName'=> '10.0.0.2:5555',
    'device' => 'android',
    'app' => 'C:/tindermation-apk/tinder.apk',
    'app-package' => 'com.tinder',
    'app-activity' => 'com.tinder.activities.ActivitySplashLoading_'
  }

  Appium::Driver.new("appium_lib" => {
      "server_url" => "http://localhost:4723/wd/hub"
    },caps: capabilities).start_driver
end

Appium.promote_appium_methods Object

# def get_corny_joke
#   page = Nokogiri::HTML(open("http://www.pickuplinegenerator.com/"))
#   puts "# joke: #{page.css("h2").text}"
#   page.css("h2").text
# end

def login_button
  sleep 1
  Appium::TouchAction.new.tap( x: 539, y:1464, count: 3).release.perform
  sleep 1
end

def allow_location_access
  sleep 1
  Appium::TouchAction.new.tap( x: 880, y:1129, count: 3).release.perform
  sleep 1
end

def skip_tutorial
  sleep 1
  Appium::TouchAction.new.tap( x: 727, y:1774, count: 3).release.perform
  sleep 1
  Appium::TouchAction.new.tap( x: 727, y:1774, count: 3).release.perform
  sleep 1
end

def like_button
  sleep 1
  Appium::TouchAction.new.tap( x: 727, y:1774, count: 3).release.perform
  sleep 1
end

# def send_message(text)
#   sleep 1
#   find_element(:xpath, "//android.view.View[1]/android.support.v4.view.ViewPager[1]/android.widget.EditText[1]").send_keys(text)
#   sleep 1
#   driver.execute_script 'mobile: tap', :x => 716, :y => 577, :fingers => 1, :tapCount => 1, :duration => 0.5
#   driver.execute_script 'mobile: tap',:x => 24, :y => 100, :fingers => 1, :tapCount => 1, :duration => 0.5
# end

# def matches?
#   exists { find_element(:text, "Matched on").click } ? false : true
# end

# def click_msgs_btn
#   driver.execute_script 'mobile: tap', :x => 900, :y => 165, :fingers => 1, :tapCount => 1, :duration => 0.5

# end

# def go_to_tinder_home
#   driver.execute_script 'mobile: tap', :x => 450, :y => 155, :fingers => 1, :tapCount => 1, :duration => 0.5
# end

puts "Logging in..."
login_button
puts "Allowing location access..."
allow_location_access
puts "Skipping tutorial..."
skip_tutorial
puts "Swiping like a demon!"
set_wait(5)
i=0
while true do
  begin
    puts "Looking for girls to match..."
    like_button
    puts "Liked Girl #: #{i+=1}"
  rescue Selenium::WebDriver::Error::NoSuchElementError
    begin
      puts "Can't Find <3, is there a match?"
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "#############################################"
      puts "NO MATCH and NO MORE GIRLS :("
      puts "#############################################"
    end
  end
end
