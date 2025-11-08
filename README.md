# Counter

![Coverage](badges/coverage_badge.svg)

A simple Flutter MVVM counter application using Provider for state management.

## Table of Contents

- [Install](#install)
- [Hooks](#hooks)
- [Usage](#usage)
- [Testing](#testing)

## Install

Clone the repository and install dependencies:

```shell
git clone https://github.com/jeancdc/counter.git
cd counter
flutter pub get
```

## Hooks

This project uses a post-commit hook to generate a coverage badge.
Set up the core hooks path:
```shell
git config core.hooksPath hooks
```

## Usage

Run the app in debug mode:

```shell
flutter run
```

Build a release version:

```shell
flutter build apk
```

## Testing

Run unit and widget tests with coverage:

```
flutter test --coverage
```
