## SunApps fastlane setup

This project demonstrates how you can use `fastlane` to work with any number of apps. `fastlane` has a unique number for every app created using the same code base.

**If you don't maintain dozens of apps, please look at the other `fastlane` setups instead.**

To identity the app in the Ruby code, the following code is used

```ruby
Dir.pwd.split('/')[-2]
```

The app identifier is always numeric: `net.sunapps.[app_id]`.

### Deliverfile

The `Deliverfile` contains the code that sets all required app metadata for a new app. It also sets the pricing and app rating. 

### Fastfile

Every `fastlane` run will download the latest app metadata and information from the SunApps CMS. 

`fastlane` will take care of creating all required profiles, push certificates and a new App ID if necessary.

### Multi Language

This example setup doesn't contain any multi language related code, as SunApps's clients are all German based. It should be easy to extend the configuration to support multiple languages.

### New Apps

New apps are created using the `produce` action. The initial version is filled in using `deliver`, which also contains the actual pricing and app's age rating (contained in the `Deliverfile`).

### Appfile

The `Appfile` contains the same Apple ID for every app, but a dymanic bundle identifier based on the current directory.

You could also define the app identifier like this:

```ruby
app_identifier ENV["APP_IDENTIFIER"]
```

and call fastlane like this:

```
APP_IDENTIFIER="net.sunapps.1" fastlane deploy
```

### Screenshots

The customer can define where to take the screenshots. The `Snapfile` will download the latest configuration from the user and store it in a local `.json` file. Inside the `snapshot.js` you see the code to parse a local JSON file.

