fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios setup
```
fastlane ios setup
```
Call this lane when setting up a new development machine

Remember to install Cocoapods before you run this by running `sudo gem install cocoapods`

It does the following:

- Asks you to enter your apple-id which will be used to authorize you on iTunes Connect

- Copies the device frames we use for our screenshots to your home directory

- Installs the pods our app is dependant on

- Installs Xcode CLI

- Installs Homebrew

- Installs SwiftLint

- Installs FixCode

- Downloads and installs the required provisioning profiles
### ios certs
```
fastlane ios certs
```
Downloads the provisioning profiles so you can build locally and deploy to your device
### ios test
```
fastlane ios test
```
Runs all the unit and ui tests
### ios version_patch
```
fastlane ios version_patch
```
Bumps version. Type: patch
### ios version_minor
```
fastlane ios version_minor
```
Bumps version. Type: minor
### ios version_major
```
fastlane ios version_major
```
Bumps version. Type: major
### ios beta
```
fastlane ios beta
```
Submits a new Beta Build to Apple TestFlight
### ios meta
```
fastlane ios meta
```
Uploads the metadata to iTunes Connect
### ios screenshots
```
fastlane ios screenshots
```
Creates new screenshots and uploads them to iTunes Connect
### ios deploy
```
fastlane ios deploy
```
Compiles the app, uploads it to iTunes Connect and submits it for review

----

This README.md is auto-generated and will be re-generated every time to run [fastlane](https://fastlane.tools).  
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).  
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane).