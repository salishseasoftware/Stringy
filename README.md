[![Build & Test](https://github.com/salishseasoftware/Stringy/actions/workflows/build+test.yml/badge.svg)](https://github.com/salishseasoftware/Stringy/actions/workflows/build+test.yml)
[![Latest Release](https://img.shields.io/github/release/salishseasoftware/Stringy/all.svg)](https://github.com/salishseasoftware/Stringy/releases)
[![Swift 5.5+](https://img.shields.io/badge/Swift-5.5+-orange.svg)](https://developer.apple.com/swift)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager)
[![License](https://img.shields.io/github/license/salishseasoftware/Stringy)](LICENSE)

# Stringy

Handy string conversions

## Requirements

- Swift 5.5+
- Xcode 13.0+
- macOS 11.0+

## Command Line Tool

A Mac OS command line tool to perform some handy string conversions

### Usage

```
OVERVIEW: Handy string conversions

USAGE: stringy <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  camelcase               Converts strings to camelCase
  snakecase               Converts strings to snake_case.
  kebabcase               Converts strings to kebab-case.

  See 'stringy help <subcommand>' for detailed help.
```

### Subcommands

#### camelcase

```
OVERVIEW: Converts strings to camelCase

E.G. Earth Sun Moon -> earthSunMoon

USAGE: stringy camelcase [--invert] [<strings> ...]

ARGUMENTS:
  <strings>

OPTIONS:
  -i, --invert            Inverts the conversion. 
  -h, --help              Show help information.
```

#### snakecase

```
OVERVIEW: Converts strings to snake_case.

E.G. 'Snakes are slithery' -> 'snakes_are_slithery'

USAGE: stringy snakecase [--invert] [<strings> ...]

ARGUMENTS:
  <strings>

OPTIONS:
  -i, --invert            Inverts the conversion. 
  -h, --help              Show help information.
```

#### kebabcase

```
OVERVIEW: Converts strings to kebab-case.

E.G. 'Words on a stick' -> 'words-on-a-stick'

USAGE: stringy kebabcase [--invert] [<strings> ...]

ARGUMENTS:
  <strings>

OPTIONS:
  -i, --invert            Inverts the conversion. 
  -h, --help              Show help information.
```

### Installation


#### With [`Mint`](https://github.com/yonaskolb/Mint)

```sh
$ mint install salishseasoftware/stringy
```


#### Manually

Clone the repo then:

```
$ make install
```

Or using swift itself:

```
$ swift build -c release
$ cp .build/release/stringy /usr/local/bin/stringy
```

#### With Xcode

Generate the Xcode project:

```
$ swift package generate-xcodeproj
$ open ./Stringy.xcodeproj
```

In Xcode:

1. Product > Archive
1. Distribute Content
1. Built Products
1. copy the `stringy` executable to `/usr/local/bin/`, or wherever you prefer.


## LibStringy

A package of handy `String` and `StringProtocol` extensions.

### String

Some general utility String extensions.

### String+DataDetector

Makes use of `NSDataDetector` to parse known data types from a string.

### String+Error

Extends String to conform to the `Error` protocol.

This allows throwing a simple string. E.G. `throw "Foo"`.

### StringProtocol

Some general utility StringProtocol extensions.

### StringProtocol+Stringy

Some handy conversions.

For example:

- `camelcased()`
- `snakecased()` 
- `kebabcased()`
