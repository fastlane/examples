We use a shared fast file accross all of our apps

see [Fastfile](SharedFastfile.rb)

in the fastfile of each app we use a few global variables wich are specific to the app.

```ruby
$self_workspace="App.xcworkspace"
$self_scheme="AppScheme"
$self_idfs = [ "app-idf", "app-idf.today", "app-idf.watchkitapp", "app-idf.watchkitextension" ]
import_from_git(url: "git@shared-repo")
```

Build a new Build and Submit to Testflight:
===

```ruby
fastlane testflight
```

Submit current open Version using latest testflight build for review
===

```ruby
fastlane submit_build
```

  * for a specific build you can use

  ```ruby 
  fastlane submit_build build_number:666
  ```

Bump xcode/plist versions:
===

```ruby
fastlane bump_version
```

Run UnitTests:
===

```
fastlane tests
```


ANDROID
===

 * BETA

```ruby
	fastlane android_beta
```

 * PROD

```ruby
	fastlane android_production
```
