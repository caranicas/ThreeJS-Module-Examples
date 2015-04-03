THREE = require 'threejs'

EffectComposer = require 'effectcomposer'
BleachBypass = require 'bleachbypass'

DemoInterface = require './DemoInterface'

class BleachBypassShaderDemo extends DemoInterface


  threeInit: ->
    super
    @__initShader()
    @__createShaderEffects()

  __initShader: ->
    console.log('composer', EffectComposer)
    @composer = new EffectComposer( @renderer )
    @composer.addPass( new EffectComposer.prototype.RenderPass( @scene, @camera ) )

  __createShaderEffects: ->
    effect = new EffectComposer.prototype.ShaderPass( new BleachBypass())
    effect.uniforms[ 'opacity' ].value = 1

    effect.renderToScreen = true
    @composer.addPass( effect )

  __initGeometry: ->
    super
    @__initBoxes()
    @__floorGeometry()

  __initBoxes: ->
    @geometry = new THREE.BoxGeometry( 5, 5, 5 )
    @material = new THREE.MeshLambertMaterial( { color: 0xffffff, shading: THREE.FlatShading } )
    @mesh = new THREE.Mesh( @geometry, @material )
    @mesh.position.y = 10
    @mesh.position.x = -5
    @scene.add(@mesh)
    @sceneObjs.push(@mesh)

    @material2 = new THREE.MeshLambertMaterial( { color: 0xff00ff, shading: THREE.FlatShading } )
    @mesh2 = new THREE.Mesh( @geometry, @material2 )
    @mesh2.position.y = 10
    @mesh2.position.x = 5
    @scene.add(@mesh2)
    @sceneObjs.push(@mesh2)

  __initLights: ->
    AmbientLight = new THREE.AmbientLight( 0xff00ff, 0.5 )
    @scene.add( AmbientLight )


  __floorGeometry: ->
    @floorTexture = new THREE.ImageUtils.loadTexture( 'textures/checkerboard.jpg' )
    @floorTexture.wrapT = THREE.RepeatWrapping
    @floorTexture.wrapS = @floorTexture.wrapT
    @floorTexture.repeat.set( 10, 10 )
    floorMaterial = new THREE.MeshPhongMaterial( { map: @floorTexture, side: THREE.DoubleSide, shading: THREE.FlatShading } )
    floorGeometry = new THREE.PlaneGeometry(100, 100, 10, 10)
    floor = new THREE.Mesh(floorGeometry, floorMaterial)
    floor.position.y = -0.5
    floor.rotation.x = Math.PI / 2
    @scene.add(floor)


  # if I don't reimplement loop then the basic implementation of render gets called,
  # not the shader implementation so i need to do this.
  loop:->
    requestAnimationFrame =>
       @loop()
    @update()
    @render()

  render: ->
    @stats.begin()
    @composer.render()
    @stats.end()

  update: ->
    for mesh in @sceneObjs
      mesh.rotation.x += 0.01
      mesh.rotation.y += 0.02

module.exports = BleachBypassShaderDemo
