fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
### test
```
fastlane test
```
Run both iOS and Mac Tests

----

## iOS
### ios analyze
```
fastlane ios analyze
```
Run the static analyzer on the iOS project
### ios screenshots
```
fastlane ios screenshots
```
Create new screenshots for the App Store in all languages and device types

Additionally, this will add device frames around the screenshots and add the correct titles
### ios beta
```
fastlane ios beta
```
Build, sign and upload a new beta build to Apple TestFlight

This will **not** send an email to all testers, it will only be uploaded to the new TestFlight. 
### ios appstore
```
fastlane ios appstore
```
Build, sign and upload a new build to the App Store.

This will do the following:



- Create new screenshots and store them in `./fastlane/screenshots`

- Collect the app metadata from `./fastlane/metadata`

- Upload screenshots + app metadata

- Build, sign and upload the app



This will **not** submit the app for review.

----

## Mac
### mac metadata
```
fastlane mac metadata
```
[WIP] Upload App Metadata of the Mac App to iTunes Connect
### mac beta
```
fastlane mac beta
```
[WIP] Build, sign and upload a new Mac build to Hockey App

----

More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/KrauseFx/fastlane)