# Tindermation

![Tindermation Logo](https://github.com/santafebound/tindermation/blob/master/web_hi_res_512.png)

## Description
**Warning:** This script is not yet functional. If you have experience with Appium Inspector or <a href="http://www.software-testing-tutorials-automation.com/2015/10/ui-automator-viewer-get-android-app.html">UI Automator Viewer</a>, then please consider contributing!

Tindermation is an automation script that swipes right on every single encounter. It also sends corny pick-up lines for each match. This project was forked from <a href="https://github.com/feelobot">feelobot</a> and updated for use in the latest Tinder installations.

## Example Output
```
Looking for girls to match...
#############################################
NO MORE GIRLS :(
CHECKING MESSAGES
#############################################
Hey..somebody farted. Let's get out of here.
Is your last name Gillete cause your the best a man can get.
So what haven't you been told tonight?
I was so enchanted by your beauty that I ran into that wall over there. So I am going to need your name and number for insurance purposes..
You must be a sargeant, because you have my private standing in attention.
I've just moved you to the top of my 'to do' list.
Go up to a girl, ask her: "Do you know what winks and screws like a tiger?" [No] Then wink..
The only reason I would kick you out of bed would be to fuck you on the floor.
#############################################
NO MORE MATCHES :(
#############################################
```

## Setup Instructions

If you are a Windows user, I would begin by installing <a href="https://www.google.cz/search?q=cygwin+latest+installation&rlz=1C1CHBD_enCZ733CZ733&oq=cygwin+latest+installation&aqs=chrome..69i57j0l5.2824j0j7&sourceid=chrome&ie=UTF-8">Cygwin</a>. This will allow you to quickly download the required dependencies to run this script. Make sure to include ``curl``, ``rvm``, ``brew``, ``node``, ``ant``, ``mvn`` and ``npm`` with your initial installation.

Install the latest stable release of Ruby.
```
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby
```

Make sure RVM is using the correct Ruby by default
```
rvm list
rvm --default use 2.1.1
```

If you have an old ruby/rvm, you can upgrade with
```
rvm get head
rvm autolibs homebrew
rvm install ruby
```

Check that it’s installed properly by printing the ruby version.
```
ruby --version
```

Update RubyGems and Bundler.
```
gem update --system
gem install --no-rdoc --no-ri bundler
gem update
gem cleanup
```

Check that RubyGems is >= 2.1.5
```
gem --version
```

Install appium_console gem.
```
gem uninstall -aIx appium_lib
gem uninstall -aIx appium_console
gem install --no-rdoc --no-ri appium_console
```

Install flaky gem.
```
gem uninstall -aIx flaky
gem install --no-rdoc --no-ri flaky
```

Install brew
```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

Install nodejs using brew.
```
brew update
brew upgrade node
brew install node
```

Node should be v6 or better. Don’t use the big green install button on nodejs.org or all npm commands will require sudo.
```
node --version
npm --version
```

Install ant if it’s not already installed.
Install maven 3.1.1 or better if it’s not already installed. Old maven will not work.
```
ant -version
mvn -version
```

Clone appium
```
git clone git://github.com/appium/appium.git
```

Run npm install. When running npm install, make sure to be on Xcode 9+ (if on MacOS)
```
cd appium
npm install
```

If you see config errors, try cleaning git. ``git clean -dfx; git reset --hard``

Authorize for testing. If you’re only testing Android, this can be skipped.
```
npm install -g authorize-ios
authorize-ios
```

Start appium (from the appium directory)
```
node .
```

or (from any directory)

```
appium &
```

## Download the Tinder APK

Find and download the latest Tinder APK: http://www.androidapksfree.com/apk/tinder-apk-latest-version-download-for-android/

## Download Tindermation

Download the actual Tindermation script from this repository with the following command ``git clone https://github.com/santafebound/tindermation.git``

## Configure the Script

If you are running this script from a connected Android device then pay attention to lines 21-30:

```ruby
capabilities = {
    'appium-version'=> '1.0',
    'platformName'=> 'Android',
    'platformVersion'=> '6.0',
    'deviceName'=> '10.0.0.2:5555',
    'device' => 'android',
    'app' => 'C:/tindermation-apk/tinder.apk',
    'app-package' => 'com.tinder',
    'app-activity' => 'com.tinder.activities.ActivitySplashLoading_'
  }
```

It is here that you will configure your ``platformVersion``, i.e. 6.0, and the file path to your APK, under ``app``, i.e. C:/tindermation-apk/tinder.apk, or wherever you have installed it on your computer.

## Run the Script

Navigate to ``C:\Users\santafebound\Documents\tindermation\node_modules\.bin`` and run the following Ruby commands:

```ruby
gem install bundler
bundle install
```

Double-check that your appium server is running with ``appium &``. Finally, from the root directory at ``C:\Users\santafebound\Documents\tindermation`` run:

```ruby
ruby tindermation.rb
```

## Obstacles

Unfortunately, I cannot get this script running in its current state. In order to get past the login splash screen, we need to automate the "Log In With Facebook" button and subsequent Permission Request, i.e. "Allow Tinder to access this device's location?". Next, the like button (heart) must be clicked, the first "like button" instruction dialog must be closed, and liking must then continue as normal. This will require figuring out the names of the various UI elements using Appium Inspector or UI Automator Viewer. If you have experience with either of these tools, then please consider a Pull Request!

Installation and script execution works just fine but unfortunately the proper UI elements have no been configured to interact with the latest versions of Tinder and Appium:

```
C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/response.rb:69:in `assert_ok': Method has not yet been implemented (Selenium::WebDriver::Error::UnknownError)
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/response.rb:32:in `initialize'
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/http/common.rb:83:in `new'
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/http/common.rb:83:in `create_response'
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/http/default.rb:107:in `request'
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/http/common.rb:61:in `call'
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/bridge.rb:678:in `raw_execute'
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/bridge.rb:656:in `execute'
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/remote/bridge.rb:339:in `execute_script'
        from C:/Ruby22-x64/lib/ruby/gems/2.2.0/gems/selenium-webdriver-3.4.0/lib/selenium/webdriver/common/driver.rb:232:in `execute_script'
        from tindermation.rb:47:in `login_button'
        from tindermation.rb:91:in `<main>'
Logging in...
```
