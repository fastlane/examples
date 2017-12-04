<h3 align="center">
  <img src="Logos/fastlane_text.png" alt="fastlane Logo" />
</h3>

fastlane Example Setups
=======================

This repository contains a few `fastlane` example setups that help you getting started.

### [Acast](https://www.acast.com)

[![Acast logotype](Logos/acast.png)](https://www.acast.com)

🎶 **Simple setup, saving tons of time**

- Slack notifications on failed builds or unsuccessful tests
  - Slack notifications are only fired if they're run on our CI
- Managed provisioning profiles using [match](https://github.com/fastlane/match)
- Creation of screenshots using [snapshot](https://github.com/fastlane/snapshot)
  - Text and device frames are added to screenshots using [frameit](https://github.com/fastlane/frameit)
  - Delivered to iTunes Connect using [deliver](https://github.com/fastlane/deliver)
- Submission to App Store using [gym](https://github.com/fastlane/gym) and [deliver](https://github.com/fastlane/deliver)

<p align="center">
  <a href="/Acast/">Overview</a> &bull;
  <a href="/Acast/Fastfile">Fastfile</a> &bull;
  <a href="/Acast/Appfile">Appfile</a> &bull;
  <a href="/Acast/Deliverfile">Deliverfile</a> &bull;
  <a href="/Acast/Gymfile">Gymfile</a> &bull;
  <a href="/Acast/Matchfile">Matchfile</a> &bull;
  <a href="/Acast/Scanfile">Scanfile</a> &bull;
  <a href="/Acast/Snapfile">Snapfile</a> &bull;
  <a href="/Acast/screenshots/Framefile.json">Framefile</a>
</p>

----

### [Timehop](https://timehop.com)

[![Timehop logo](Logos/Timehop.png)](https://timehop.com)

🎶 **Traveling in time using fastlane**

- Automatic generation of the changelog
- Advanced manual key management
- Printing out random squirrels and boats
- Table flips

<p align="center">
  <a href="/Timehop/">Overview</a> &bull;
  <a href="/Timehop/Fastfile">Fastfile</a>
</p>

----

### [Fitbay](https://fitbay.com)
[![fastlane Logo](Logos/Fitbay.png)](https://fitbay.com)

:womans_clothes: **Full stack deployment**

- Crashlytics, TestFlight, and App Store distribution
- Automatic build environment selection
- Managing of Provisioning Profiles
- Slack Team notifications
- Version number bump and Git commit
- Custom scripts
- Lane switching with private lanes

<p align="center">
  <a href="/Fitbay/">Overview</a> &bull;
  <a href="/Fitbay/Fastfile">Fastfile</a>
</p>

----

### [Fabric app](https://fabric.io/home)
[![Fabric app icon](Logos/FabricApp.png)](https://itunes.apple.com/us/app/fabric-real-time-alerts-analytics/id1077938720?mt=8)

:womans_clothes: **Standard Setup**

- Deploy updates through Crashlytics Beta
- Submit to the AppStore with screenshots and metadata
- Code generation for xib names, identifiers, etc using [`R.swift`](https://github.com/mac-cain13/R.swift)


<p align="center">
  <a href="/Fabric/">Overview</a> &bull;
  <a href="/Fabric/Fastfile">Fastfile</a> &bull;
  <a href="/Fabric/Snapfile">Snapfile</a> &bull;
  <a href="/Fabric/Appfile">Appfile</a>
</p>

----

### [Artsy eidolon](https://github.com/artsy/eidolon)
[![Artsy](Logos/Artsy.png)](https://github.com/artsy/eidolon)

:green_heart: **Standard Setup**

- Building and Signing of the iOS App
- Version Bump & Git Actions
- Hockey Distribution
- Production Keys


<p align="center">
  <a href="/Artsy/eidolon">Overview</a> &bull;
  <a href="/Artsy/eidolon/Fastfile">Fastfile</a>
</p>

----

### [Wikipedia](https://github.com/wikimedia/apps-ios-wikipedia/) by Wikimedia Foundation

:green_book: **Advanced - Multiple Environments**

- Different Bundle Identifiers per `lane`
- Advanced Testing
- Hockey Deployment
- App Store and TestFlight Deployment
- Custom `fastlane` actions like automatic change-logs based on git


<p align="center">
  <a href="/Wikipedia/">Overview</a> &bull;
  <a href="/Wikipedia/Fastfile">Fastfile</a> &bull;
  <a href="/Wikipedia/Deliverfile">Deliverfile</a> &bull;
  <a href="/Wikipedia/Appfile">Appfile</a> &bull;
  <a href="/Wikipedia/metadata/">Metadata</a>
</p>

---

### [SoundCloud](https://www.soundcloud.com)
[![SoundCloud](Logos/SoundCloud.png)](https://www.soundcloud.com)

:musical_note: **Standard Setup**

- Deployment to iTunes Connect
- Building acceptance tests builds with Frank
- Managing Certificates/Provisioning Profiles
- CI steps as lanes
- Project setup

<p align="center">
  <a href="/SoundCloud">Overview</a> &bull;
  <a href="/SoundCloud/Fastfile">Fastfile</a>
</p>

----

### [MindNode](https://mindnode.com/)
[![MindNode](Logos/MindNode.png)](https://mindnode.com/)

:computer: **Advanced iOS/Mac Setup**

- Mac and iOS Universal App
- App Store and TestFlight Deployment
- Automated Screenshots
- Screenshot Framing & Adding of Titles
- Copying of example data for screenshots
- Custom `xcodebuild` command


<p align="center">
  <a href="/MindNode/">Overview</a> &bull;
  <a href="/MindNode/Fastfile">Fastfile</a> &bull;
  <a href="/MindNode/Snapfile">Snapfile</a> &bull;
  <a href="/MindNode/MindNode.js">MindNode.js</a> &bull;
  <a href="/MindNode/screenshots">screenshots</a> &bull;
  <a href="/MindNode/screenshots/Framefile.json">Framefile.json</a> &bull;
  <a href="/MindNode/mac">MacScreenshots</a>
</p>

----

### [Product Hunt](https://www.producthunt.com/apps/ios)
[![ProductHunt Logo](Logos/ProductHunt.png)](https://www.producthunt.com/apps/ios)

:chart_with_upwards_trend: **Standard Setup**

- App Store and TestFlight Deployment
- Managing of Provisioning Profiles
- Push Notifications
- Version Bump & Git Actions

<p align="center">
  <a href="/ProductHunt/">Overview</a> &bull;
  <a href="/ProductHunt/Fastfile">Fastfile</a> &bull;
  <a href="/ProductHunt/Deliverfile">Deliverfile</a> &bull;
  <a href="/ProductHunt/metadata">metadata</a>
</p>

----


### [Be My Eyes](http://www.bemyeyes.org/)
[![Be My Eyes Logo](Logos/BeMyEyes.png)](http://www.bemyeyes.org/)

:eyes: **Standard Setup**

- App Store and TestFlight Distribution
- Local action `get_global_value`
- Version Bump & Git Actions


<p align="center">
  <a href="/BeMyEyes/">Overview</a> &bull;
  <a href="/BeMyEyes/Fastfile">Fastfile</a> &bull;
  <a href="/BeMyEyes/Deliverfile">Deliverfile</a> &bull;
  <a href="/BeMyEyes/actions/get_global_value.rb">get_global_value</a>
</p>

----

### [SunApps](https://sunapps.net)
[![SunApps](Logos/SunApps.png)](https://sunapps.net)

:wrench: **App Factory**

- Maintain and Deploy hundreds of Apps
- Automatically create new Apps
- Create profiles and push certificates
- Screenshots
- Remote configuration of `Fastfile` and `snapshot` scripts

A description on how the setup works is available in the [Overview](/SunApps).


<p align="center">
  <a href="/SunApps/">Overview</a> &bull;
  <a href="/SunApps/Fastfile">Fastfile</a> &bull;
  <a href="/SunApps/Deliverfile">Deliverfile</a> &bull;
  <a href="/SunApps/Snapfile">Snapfile</a> &bull;
  <a href="/SunApps/Appfile">Appfile</a> &bull;
  <a href="/SunApps/snapshot.js">snapshot.js</a>
</p>

----

### [Touchwonders](http://touchwonders.com)
[![Touchwondersa](Logos/Touchwonders.png)](http://touchwonders.com)

:bike: **Shared Fastfile for multiple projects**

- Maintain and Deploy multiple of Apps and Projects
- Import external `Fastfile` from external repo
- Load fastlane configuration YAML file
- Create/Renew/Download profiles for multiple targets
- Custom `load_release_notes` action

A description on how the setup works is available in the [Overview](/Touchwonders).


<p align="center">
  <a href="/Touchwonders/">Overview</a> &bull;
  <a href="/Touchwonders/Fastfile">Fastfile</a> &bull;
  <a href="/Touchwonders/fastlane_config.yaml">Configuration file</a>
</p>

----

### [QuizUp](https://www.quizup.com)
[![QuizUp](Logos/QuizUp.png)](https://www.quizup.com)

:zap: **Advanced - Multiple Environments**

- Deployment to iTunes Connect
- Deployment to Hockey App
- Running unit tests
- Linting with Swiftlint
- Managing Certificates/Provisioning Profiles
- CI steps as lanes
- Project setup
- Version Bump & Git Actions
- Slack Notifications
- Custom action for internal translation tools
- Custom action for versioning
- Custom action for selecting changelogs

<p align="center">
  <a href="/QuizUp">Overview</a> &bull;
  <a href="/QuizUp/Fastfile">Fastfile</a>
</p>

----


### [fastlane](https://fastlane.tools)
[![fastlane Logo](Logos/fastlane.png)](https://fastlane.tools)

:rocket: **Creative Uses**

- Deploying `fastlane` updates using `fastlane` (so meta)
- Lane Switching
- Network Requests
- Custom Commands
- Get GitHub Release

<p align="center">
  <a href="https://github.com/fastlane/fastlane/tree/master/fastlane">Overview</a> &bull; 
  <a href="https://github.com/fastlane/fastlane/blob/master/fastlane/Fastfile">Fastfile</a>
</p>

----


### [SHOP·COM](https://www.shop.com)
[![fastlane Logo](Logos/SHOP.COM.png)](http://www.shop.com/mobile_app-v.xhtml)

:bangbang: **Dual Platfrom Fastfile, Cordova project**

- Configuration for both iOS and Android in the same Fastfile
- Saves archives to a common build folder, sorted by date
- Handles provisioning in a separate lane
- Includes working configuration for building both iOS and Android native projects
- Has configuration for CI (Jenkins) to auto release to Hockeyapp, and auto unlock the keychain

<p align="center">
  <a href="/Shop.com">Overview</a> &bull; 
  <a href="/Shop.com/Fastfile">Fastfile</a>
</p>

----

### [Zattoo](https://zattoo.com)
[![Zattoo](Logos/Zattoo.png)](https://zattoo.com)

:tv: **Setup for tvOS**

- App Store and Testflight deployments
- Certificates and Provisioning Profiles management
- Provision of Localizable strings
- Deployment of Preview and Promotional releases
- Unit and UI testing lanes for Travis
- Linter

<p align="center">
  <a href="/Zattoo/">Overview</a> &bull;
  <a href="/Zattoo/Fastfile">Fastfile</a>
</p>
----

# Code of Conduct
Help us keep `fastlane` open and inclusive. Please read and follow our [Code of Conduct](https://github.com/fastlane/code-of-conduct).
