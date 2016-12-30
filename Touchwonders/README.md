fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Architecture

## Remote Fastfile

In Touchwodners we decided to implement a base collection of standard lanes and actions that we want to share among all our projects.
To import them we take advantage of [import_from_git](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Advanced.md#import_from_git) action.

At very beginning of every project's Fastfile:

`import_from_git(url:"{touchwonders_git_repo}:/library/fastlane.git", path:"Fastfile")`

## Configuration file

Every project's fastlane folder contains a required configuration file responsible to load proper environment and settings per project deployment.

Example: [fastlane_config.yaml](fastlane_config.yaml)

# Available actions

## iOS
### Load release notes

Load release notes for current project's deployment.

Every project root folder contains:

* `build_notes.md`: Markdown file containing the release note of latest deployed version. For project management reasons this file is kept under version control.
* `RELEASE_NOTES.md`: Markdown file contaning a collection of all the build notes that have been deployed. For project management reasons this file is kept under version control.

At every interaction the build note file content is added to `RELEASE_NOTES.md` collection and finally used for fill in Crashlytics build's release notes. 

### GIT Checkout

Checkout a branch from project working copy.

# Availabe lanes

The predefined lanes are divided in _public_ and _private_.

The rule of thumb is to keep the public lanes as simple as possible by leveraging all the implementation load to private lanes such that they can be easily re-used.

## Public lanes

### Development

__Description__: Submit a new daily build to Crashlytics.

__Steps__:

* Increment build number
* Download latest provisioning profile for targets specified in `fastlane_configuration.yaml` file.
* Add icon overlay if needed (see `fastlane_configuration.yml`)
* Publish to Crashlytics. By default all Touchwonders team is invited.

### Stable

__Description__: Submit a new sprint-end/weekly build to Crashlytics.

__Steps__: 

* Increment build number
* Download latest provisioning profile for targets specified in `fastlane_configuration.yaml` file.
* Add icon overlay if needed (see `fastlane_configuration.yaml`)
* Publish to Crashlytics. By default all Touchwonders team is invited.

### Release

__Description__: Submit a new app version to AppStore.

__Steps__: 

* Download latest provisioning profile for targets specified in `fastlane_configuration.yaml` file.
* Upload to iTunes Connect.

## Private lanes

### `config_env`

__Description__: Configure the environment to drive required lanes with provided options.

__Steps__:

* Select proper Xcode tool by looking up the `xcode_select` parameter defined in project’s `fastlane_configuration.yaml` file.

### `prepare`

__Description__: Prepare required tools to drive required lanes with provided options.

__Step__:

* Ensure clean `git status`.
* Checkout/Pull latest and greatest from `remote_branch` parameter specified in project’s `fastlane_configuration.yaml` file.
* Cocoapods.

### `get_provisioning_profile`

__Description__: Create/Renew/Download required provisioning profiles for all targets specified in `fastlane_configuration.yaml` file. 

__Step__:

* Download targets provisioning profile. Every targets provides an identifier which is used to create an environment variable containing proper mobile provisioning profile UDID. This is useful in case the UDID is fetched from an environment variable, in your Xcode project’s setting.

### `project_warm_up`

__Description__: Last step before ‘build&archive’ process.

__Step__:

* Add icon overlay if needed.
* Increment build number. 
N.B.: Release lane will __never__ increment project build number.

### `build_and_archive`

__Description__: Build and export IPA for your project. All intermediate and final step result are named after project’s scheme defined in the `fastlane_configuration.yaml`

__Step__:

* Build project by using parameters specified in `fastlane_configuration.yaml` file.
* Export build’s product to IPA.

## `publish`

__Description__: Publish build to Crashlytics by using build notes available in `build_notes.md` file.

__Step__:

* Load build release notes from `build_notes.md` file and updated `RELEASE_NOTES.md` changelog.
* Publish build to Crashlytics. When specified, emails have prevalence over groups notification.

----
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane)
