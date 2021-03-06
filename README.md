# Stringy

Handy string conversions

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

#### snakecase

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
1. copy `stringy` executable to `/usr/local/bin/` or wherever you prefer.


## LibStringy

Swift package of handy String extensions.



