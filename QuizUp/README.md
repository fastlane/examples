fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios deploy_daily
```
fastlane ios deploy_daily
```
Release a new daily build



- Only works on `master branch`

- Updates translations

- Installs cocoapods

- Signs, builds and uploads `QuizUp Enterprise to Hockey Beta App

- Sends success message to `#ios-builds` on slack

- Pushes translations update to master
### ios deploy_hourly
```
fastlane ios deploy_hourly
```
Release new hourly build



- Only works on `master` branch

- Installs cocoapods

- Prepares and commits a new build number

- Signs, builds and uploads `Quizup Dogfood Enterprise` target to Hockey Hourly App

- Sends success message to `#ios-builds` on slack

- Pushes new version number update to master
### ios upload_beta_to_s3
```
fastlane ios upload_beta_to_s3
```

- Only works on `master branch`

- Installs cocoapods

- Signs, builds and uploads `QuizUp Enterprise` to the web

- Sends success message to `#ios-builds` on slack
### ios submit_ipa
```
fastlane ios submit_ipa
```
Submits a new build to Apple



Submits the same build to hockey app so beta users will test the same build we are about to ship.

- Only works on `release` branch

- Re-installs cocoapods

- Signs, builds and uploads `QuizUp Enterprise` target to hockey

- Signs, builds and uploads `Quizup (App Store)` target to app store

- Uploads `dsysm` of the appstore builds to hockey

- Notifies `` and `` about new submission

- Creates and pushes a new tag to github
### ios submit
```
fastlane ios submit
```
Submits newest changes to Apple



The designated submission lane

- Merges new changes from `master` into `release`

- Prepares a change log

- Calls `submit_ipa` lane
### ios resubmit
```
fastlane ios resubmit
```
Resubmits the the build



- Calls `submit_ipa` lane
### ios bump_version
```
fastlane ios bump_version
```
Bumps version numbers



- Only works on `master` branch

- Create as a new version number e.g. 2.1.8 -> 2.1.9 and 2.1.9 -> 2.2.0

- Commits and pushes new version number to master
### ios test
```
fastlane ios test
```
Runs tests



- Installs cocoapods

- Runs tests

- Cleanup
### ios swift_lint
```
fastlane ios swift_lint
```
Runs SwiftLint

----

This README.md is auto-generated and will be re-generated every time to run [fastlane](https://fastlane.tools).
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).