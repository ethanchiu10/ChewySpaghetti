express     = require 'express'
path        = require 'path'
CMS         = require 'imag-cms'

exports = module.exports = (config)->
  app = express()
  cms = new CMS( config.cms )
  app.use express.static( path.join __dirname, "app" )
  app.use '/backend', cms.express()

  cms.bootstrap (err) ->
    return if err
    cms.allow "anonymous", ["characters"], ["read"], (err) ->
      return if err
      cms.deny "anonymous", ["characters"], [
        "create"
        "update"
        "remove"
      ], (err) ->
        return if err
  app