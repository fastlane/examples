fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios test
```
fastlane ios test
```
Runs the tests of the iOS App
### ios screenshots
```
fastlane ios screenshots
```
Create new screenshots for all the devices
### ios beta
```
fastlane ios beta
```
Build and upload a new build to Apple TestFlight

This action will also do a build version bump and push it to git.

This will **not** send an email to all testers, it will only be uploaded to the new TestFlight.
### ios appstore
```
fastlane ios appstore
```

Submit a new version to the App Store

This will do the following: 

- Make sure the profiles are up to date and download the latest one

- Do a build version bump and push it

- Create new screenshots and store them in `./fastlane/screenshots`

- Collect the app metadata from `./fastlane/metadata`

- Upload screenshots + app metadata

- Build, sign and upload the app

This will **not** submit the app for review.
### ios push
```
fastlane ios push
```
Creates a new push certificate, ready to be uploaded to parse
----
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/KrauseFx/fastlane)