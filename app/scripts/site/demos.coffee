
Backbone   = require 'backbone'

module.exports = Backbone.Model.extend

  defaults:
    data:[
      {
        'url':'/basic'
        'name':'basic'
        'demoClass':require './gl/demos/basicdemo.coffee'
      },
      {
        'url':'/shiftshader'
        'name':'shiftshader'
        'demoClass':require  './gl/demos/shiftshaderdemo.coffee'
      },
      {
        'url':'/dotshader'
        'name':'dotshader'
        'demoClass':require  './gl/demos/dotshaderdemo.coffee'
      },
      {
        'url':'/mirrorshader'
        'name':'mirrorshader'
        'demoClass':require './gl/demos/mirrorshaderdemo.coffee'
      },
      {
        'url':'/digitalglitch'
        'name':'digitalglitch'
        'demoClass':require './gl/demos/digitalglitch.coffee'
      },
      {
        'url':'/physi'
        'name':'physi'
        'demoClass':require './gl/demos/physidemo.coffee'
      },
      {
        'url':'/goblin'
        'name':'goblin'
        'demoClass':require './gl/demos/goblindemo.coffee'
      },
      {
        'url':'/colorify'
        'name':'colorify'
        'demoClass':require './gl/demos/colorifyShaderDemo.coffee'
      },
      {
        'url':'/bleach'
        'name':'bleach'
        'demoClass':require './gl/demos/bleachBypassShaderDemo.coffee'
      },
      {
        'url':'/horizontalBlur'
        'name':'horizontalBlur'
        'demoClass':require './gl/demos/horizontalBlurShaderDemo.coffee'
      },
      {
        'url':'/verticalBlur'
        'name':'verticalBlur'
        'demoClass':require './gl/demos/verticalBlurShaderDemo.coffee'
      },
      {
        'url':'/triangleBlur'
        'name':'triangleBlur'
        'demoClass':require './gl/demos/triangleBlurShaderDemo.coffee'
      }



    ]
