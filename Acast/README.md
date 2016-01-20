fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios xcode
```
fastlane ios xcode
```
Installs FixCode which disables the "Fix Issue" button in Xcode
### ios certs
```
fastlane ios certs
```
Fetches the provisioning profiles so you can build locally and deploy to your device
### ios test
```
fastlane ios test
```
Runs all the unit and ui tests
### ios screens
```
fastlane ios screens
```
Creates new screenshots and uploads them to iTunes Connect
### ios beta
```
fastlane ios beta
```
Submits a new Beta Build to Apple TestFlight
### ios deploy
```
fastlane ios deploy
```
Deploys a new version to the App Store

----

Generate this documentation by running `fastlane docs`
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/KrauseFx/fastlane)