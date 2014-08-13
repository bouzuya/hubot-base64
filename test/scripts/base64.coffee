{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'base64', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      done()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    beforeEach ->
      @sender = new User 'bouzuya', room: 'hitoridokusho'
      @callback = @sinon.spy()
      @robot.listeners[0].callback = @callback

    describe 'receive "@hubot base64 bouzuya+hubot "', ->
      beforeEach ->
        message = '@hubot base64 bouzuya+hubot '
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'calls with "@hubot base64 bouzuya+hubot"', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is '@hubot base64 bouzuya+hubot '
        assert match[1] is 'bouzuya+hubot'

  describe 'listeners[0].callback', ->
    beforeEach ->
      @base64 = @robot.listeners[0].callback

    describe 'receive "@hubot base64 bouzuya+hubot"', ->
      beforeEach ->
        @send = @sinon.spy()
        @base64
          match: ['@hubot base64 bouzuya+hubot', 'bouzuya+hubot']
          send: @send

      it 'send "Ym91enV5YStodWJvdA=="', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is 'Ym91enV5YStodWJvdA=='
