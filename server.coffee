express     = require 'express'
path        = require 'path'

pkg           = require './package.json'
Backend       = require './'

['config', 'resources', 'data'].forEach (key)->
  pkg.config.cms[key] = path.resolve(pkg.config.cms[key])

app = express()
app.use Backend(pkg.config)
server = app.listen pkg.config.server.port, ()->
  console.log "%s started at http://localhost:%s", pkg.name, server.address().port