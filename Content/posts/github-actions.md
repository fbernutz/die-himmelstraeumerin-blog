---
date: 2020-01-12 10:00
description: The last days, I migrated some of my open source repositories from Travis CI to GitHub Actions. I only used Travis for running tests or linter, nothing too complicated.
tags: post, github-actions, open-source, CI
---
# Migration from Travis CI to GitHub Actions

The last days, I migrated some of my open source repositories from [Travis CI](https://travis-ci.org/) to [GitHub Actions](https://github.com/features/actions). 

I only used Travis for running tests or linter, nothing too complicated.

## Running Tests in iOS Repositories

Most of my `.travis.yml` files looked similar to the code snippet below. I want to run two commands in the CI (with fastlane):

- `bundle exec fastlane test`
- `bundle exec fastlane snapshot_test`

```
language: swift
osx_image: xcode11.2
cache:
  - bundler
install:
  - bundle install
  - pod install --repo-update

jobs:
  include:
    - script: bundle exec fastlane test
      name: Unit Tests
    - script: bundle exec fastlane snapshot_test
      name: Snapshot Tests
```

The first lines are setup code, like specifying the Xcode version or which dependencies have to be installed.

### How to migrate to GitHub Actions? 

There are two steps for this: 

1. Add Workflow
2. Delete `.travis.yml`

#### 1. Add Workflow

To migrate this to GitHub Actions, I started with tapping on the "Actions" tap in the repository. 

<img src="../../images/github-actions/github-actions-tab.png" alt="A screenshot of the tabs in a repository of GitHub, where "Actions" is highlighted." />

It will create a new file for you `.github/workflows/<name>.yml` with a editor. On the left there is a preview of the most important documentations to understand the syntax and a link to featured marketplace actions. 

<img src="../../images/github-actions/github-actions-editor.png" alt="A screenshot of the GitHub Actions editor." />

This editor is helpful (sometimes), because it checks for valid syntax, but it can also be a pain. When you want to add a new line between existing code there are some autocompletion actions and it adds some syntax for you. I'm always suprised when this happens. 

The following code snippet shows what you have to define when you want to have the same functionality from the Travis setup. 

```
name: CI

on:
  push:
    branches:
    - master
  pull_request:
    branches:
    - master

jobs:
  unit_tests:
    name: Unit Tests
    runs-on: macOS-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v1

    - name: Install Gem Dependencies
      run: bundle install
        
    - name: Install CocoaPods Dependencies
      run: pod install --repo-update

    - name: Run UnitTests
      run: bundle exec fastlane test

  snapshot_tests:
    name: Snapshot Tests
    runs-on: macOS-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v1

    - name: Install Gem Dependencies
      run: bundle install

    - name: Install CocoaPods Dependencies
      run: pod install --repo-update

    - name: Run SnapshotTests
      run: bundle exec fastlane snapshot_test
```

Sadly there is nothing like a `install` phase (yet?), which I know from Travis or Gitlab CI. So, there is some duplicated code in here for installing the dependencies for each job. But there is a solution for it. You can create a "Install Dependency" job and the other jobs then wait for this to finish but I didn't try it out yet. I found this in the [GitHub Community Forum](https://github.community/t5/GitHub-Actions/the-same-dependency-in-all-workflows-jobs/td-p/37266) where I discovered some useful hints and tips. 

#### 2. Delete `.travis.yml`

And when you have added the jobs in the new file, you can delete your `.travis.yml` file and you are already finished. I highly recommend to try this out in a branch 😉 

### Benefits from GitHub Actions

#### All jobs are visible

When you add a new pull request for the migration, you'll see, that all jobs are directly displayed in the pull request.

<img src="../../images/github-actions/checks.png" alt="Two screenshots, one where you can only see one check (from Travis CI) and one where you can see three checks which ran with GitHub Actions." /> 

#### Speed

When using Travis CI, the jobs had to be in queue for some time before they started, like 5 to 10 minutes. This seems to happen instantly with GitHub Actions, I didn't wait for 30 seconds to see that the jobs have already started. So, instead of waiting ~12 minutes for all jobs to finish with Travis CI, I now wait ~4 minutes. This is such a huge difference!

#### Marketplace

There is a ton of community work available to use. You can browse through the [marketplace](https://github.com/marketplace?type=actions) and you can imagine to automate everything, you could ever think of. Maybe I'm exaggerating, but this was my first impression. 

There is a repository called "[Awesome Actions](https://github.com/sdras/awesome-actions)" where some (obviously) awesome actions are collected.

#### MacStadium

When running jobs with `macos-latest`, GitHub uses [MacStadium](https://www.macstadium.com/) to host the macOS runners as stated in their [documentation](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/virtual-environments-for-github-hosted-runners). This also saves some time when there is no waiting time for starting virtual machines. 

## Additions

### Run CI from forks

When you use the "Actions" tab to create a new workflow the default for the trigger is `on: [push]`. I thought, this is perfect for my use cases, but when someone forked the repository and creates a pull request, no CI is running automatically. So, I used `on: [push, pull_request]` as trigger, but then the jobs are running twice when creating a pull request. The solution is this: 

```
on:
push:
  branches:
  - master
pull_request:
  branches:
  - master
```

Found in the [GitHub Community Forum](https://github.community/t5/GitHub-Actions/How-to-trigger-an-action-on-push-or-pull-request-but-not-both/td-p/35805) 

### Pin Xcode Version 

It's also possible to pin the Xcode version. Add the following code above `jobs`.

```
env:
  DEVELOPER_DIR: /Applications/Xcode_11.3.app/Contents/Developer
```

Found in the [GitHub Community Forum](https://github.community/t5/GitHub-Actions/Selecting-an-Xcode-version/m-p/32340#M1092)

### Pin macOS version

Currently, it's only possible to use the `macos_latest` tag to specify that you need a Mac to run your jobs. The tag currently specifies to use `macOS 10.15`. When you have to use another macOS version, it's not possible to specify an explicit version. But maybe the solution for this is to use [self-hosted runners](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/about-self-hosted-runners) which sounds interesting, but also a bit overhead for these simple tasks which I need the CI for. 

---

Migrations from repositories: 

- [PR – Cineaste App (iOS)](https://github.com/spacepandas/cineaste-ios/pull/131)
- [PR – Mood Tracker (Android)](https://github.com/fbernutz/mood-tracker-android/pull/2)
- [PR – CriticalMaps (iOS)](https://github.com/criticalmaps/criticalmaps-ios/pull/219)
