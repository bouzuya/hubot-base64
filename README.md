# hubot-base64

A Hubot script that encode to base64

## Installation

    $ npm install git://github.com/bouzuya/hubot-base64.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-base64.git#TAG'

## Sample Interaction

    bouzuya> hubot help base64
    hubot> hubot base64 <text> - encode to base64

    bouzuya> hubot base64 bouzuya+hubot
    hubot> Ym91enV5YStodWJvdA==

See [`src/scripts/base64.coffee`](src/scripts/base64.coffee) for full documentation.

## License

MIT

## Development

### Run test

    $ npm test

### Run robot

    $ npm run robot


## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]

[travis]: https://travis-ci.org/bouzuya/hubot-base64
[travis-badge]: https://travis-ci.org/bouzuya/hubot-base64.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-base64
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-base64.png
