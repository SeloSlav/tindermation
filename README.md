# Tindermation

![Tindermation Logo](https://github.com/santafebound/tindermation/blob/master/web_hi_res_512.png)

## Table of Contents  
* [Description](#description)
* [Team & Past Contributors](#team)
* [Setup Instructions](#setup)
* [Download the Tinder APK](#tinder)
* [Clone Tindermation](#clone)
* [Configure the Script](#configure)
* [Run the Script](#script)
* [Future Development](#future)

<hr>

<a name="description"></a>
## Description
Tindermation is the fastest way to generate a large quantity of Tinder leads. Tindermation is an automation script for Android devices that swipes right on every single encounter. This project was forked from <a href="https://github.com/feelobot">feelobot</a> and updated for use in the more recent Tinder installations.

| <a href="https://www.youtube.com/watch?v=640tI6J5fMI"><img src="https://github.com/santafebound/tindermation/blob/master/youtube-512.png" width="96"></a>  |
| ------------- |
| Tindermation Example Video  |

<hr>

<a name="team"></a>
## Team & Past Contributors
* <a href="https://github.com/feelobot">feelobot</a> (original author)<br> 
* <a href="https://github.com/seloslav">seloslav</a> 

<hr>

<a name="setup"></a>
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

<hr>

<a name="tinder"></a>
## Download the Tinder APK

Download the latest Tinder APK: http://www.androidapksfree.com/apk/tinder-apk-latest-version-download-for-android/

<hr>

<a name="clone"></a>
## Clone Tindermation

Download the actual Tindermation script from this repository with the following command ``git clone https://github.com/santafebound/tindermation.git``

<hr>

<a name="configure"></a>
## Configure the Script

If you are running this script from a connected Android device then pay attention to lines 21-30:

```ruby
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
```

It is here that you will configure your ``platformVersion``, i.e. 6.0, the file path to your APK, under ``app``, i.e. C:/tindermation-apk/tinder.apk, or wherever you have installed it on your computer, and your ``appium-version``, i.e. 1.6.4.

<hr>

<a name="script"></a>
## Run the Script

Navigate to ``C:\Users\santafebound\Documents\tindermation\node_modules\.bin`` and run the following Ruby commands (first time only)
```ruby
gem install bundler
bundle install
```

Make sure your device is connected by USB. Check with
``adb devices``

You will see something like the following if your device is connected
```
List of devices attached
1PFUCZ1WMMA44Q6G        device
```

Double-check that your appium server is running with ``appium &``. Finally, from the root directory at ``C:\Users\santafebound\Documents\tindermation`` run:

```ruby
ruby tindermation.rb
```

You may skip the last two commands by running the batch file included in this repo by double-clicking ``tindermation.bat``

<hr>

<a name="future"></a>
## Ideas for Future Development

### Cross-Device Compatability
Getting the script to run properly on every device will be require some refactoring because as for now I'm simply selecting the X,Y coordinates that correspond to certain UI elements on my own device (Xaomi Redmi Note 4). I will have to download Appium Inspector or UI Automator Viewer to determine the actual element identifiers. If you are using this script on a device other than the one I just mentioned you will have to open ``Settings > Developer Options > Pointer Location`` and redefine each of the ``Appium::TouchAction`` tap functions in the main ``tindermation.rb`` script. 

### Running in the Background?
Currently, Appium's Ruby library allows us to send applications to the background but automations will always continue to run on the main OS thread. This means we can't run automations unless the desired application is actively in-use. To truly automate swiping, we are probably better off accessing the Tinder API directly. See <a href="https://github.com/deftx/loltinder">loltinder.git</a>.

### Send a Message
Check for matches and send a message from a list of pre-populated openers?

### Containerization
Somebody with Docker experience might be able to contain the script in an environment that comes pre-loaded with all of its dependencies so that booting it up for the first time doesn't take 30 minutes for non-developers...

Anway, feel free to make a Pull Request if you would like to contribute and improve upon the script!
