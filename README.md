<h3 align="center">
  <img src="Logos/fastlane_text.png" alt="fastlane Logo" />
</h3>

fastlane Example Setups
=======================

This repository contains a few `fastlane` example setups that help you getting started.

### [Artsy eidolon](https://github.com/artsy/eidolon)
![Artsy](Logos/Artsy.png)

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
![Wikmedia Logo](Logos/Wikimedia.png)

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
----

### [MindNode](https://mindnode.com/)
![MindNode](Logos/MindNode.png)

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
  <a href="/MindNode/screenshots/Framefile.json">Framefile.json</a>
</p>
----

### [ProductHunt](https://www.producthunt.com/apps/ios)
![ProductHunt Logo](Logos/ProductHunt.png)

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
![Be My Eyes Logo](Logos/BeMyEyes.png)

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
![SunApps](Logos/SunApps.png)

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

If you like [fastlane](https://fastlane.tools) and would like to help this project by sharing your `Fastfile`, feel free to submit a pull request :+1:

