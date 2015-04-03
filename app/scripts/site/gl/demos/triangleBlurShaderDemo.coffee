THREE = require 'threejs'

EffectComposer = require 'effectcomposer'
TriangleBlur = require 'triangleblur'

DemoInterface = require './DemoInterface'


class TriangleBlurShaderDemo extends DemoInterface


  threeInit: ->
    super
    @__initShader()
    @__createShaderEffects()

  __initShader: ->
    @composer = new EffectComposer( @renderer )
    @composer.addPass( new EffectComposer.prototype.RenderPass( @scene, @camera ) )

  __createShaderEffects: ->
    effect = new EffectComposer.prototype.ShaderPass(new TriangleBlur())
    effect.renderToScreen = true;
    effect.uniforms[ "delta" ].value = new THREE.Vector2(0.2,0.01)
    @composer.addPass(effect)

  __initGeometry: ->
    super
    @__initBoxes()
    #__floorGeometry()

  __initBoxes: ->
    @geometry = new THREE.BoxGeometry( 5, 5, 5 )
    @material = new THREE.MeshLambertMaterial( { color: 0xff00ff, shading: THREE.FlatShading } )
    floorTexture = new THREE.ImageUtils.loadTexture( 'textures/checkerboard.jpg' )
    floorTexture.wrapT = THREE.RepeatWrapping
    floorTexture.wrapS = floorTexture.wrapT
    floorTexture.repeat.set( 2, 10 )
    floorMaterial = new THREE.MeshPhongMaterial( { map: floorTexture, side: THREE.DoubleSide, shading: THREE.FlatShading } )

    @mesh = new THREE.Mesh( @geometry, floorMaterial )
    @mesh.position.y = 10
    @mesh.position.x = -5
    @scene.add(@mesh)
    @sceneObjs.push(@mesh)


    @material2 = new THREE.MeshLambertMaterial( { color: 0xffff00, shading: THREE.FlatShading } )
    @mesh2 = new THREE.Mesh( @geometry, @material2 )
    @mesh2.position.y = 10
    @mesh2.position.x = 5
    @scene.add(@mesh2)
    @sceneObjs.push(@mesh2)

  __initLights: ->
    directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 )
    directionalLight.position.set( -20, -20, -20)
    @scene.add( directionalLight )

    directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 )
    directionalLight.position.set(20,20,20)
    @scene.add( directionalLight )

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

module.exports = TriangleBlurShaderDemo
