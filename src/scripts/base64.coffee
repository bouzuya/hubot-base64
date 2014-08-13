# Description
#   A Hubot script that encode to base64
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot base64 <text> - encode to base64
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->

  robot.respond /base64\s+(.+?)\s*$/i, (res) ->
    text = res.match[1]
    buffer = new Buffer text, 'utf-8'
    res.send buffer.toString('base64')
