ThreeJS-Module-Examples
===================

###Starting point for Three JS App.

- These examples serve guide for how to properly include components when using my [boilerplate](https://github.com/caranicas/ThreeJS-Boilerplate) as a starting point for your ThreeJS application

####My Bowerable Components
- [Controls](https://github.com/caranicas/ThreeJS-Controls)
- [Effect Composer](https://github.com/caranicas/ThreeJS-EffectComposer)
- [Shaders](https://github.com/caranicas/ThreeJS-Shaders)

* * *

- I didn't want to make to make a repo for each individual threejs component, but Bower has some limitations in how you can include things so it left me with an inconvenient git structure for both controls and shaders. The Master Branches are essentially Just the readme, and the individual feature branches are where the actual components live. Hopefully In the future I will come up with a more elegant solution but this works for me for the time being.  

####Demo Tech
- [ThreeJS](http://threejs.org/) Web GL Wrapper
- [Stats](https://github.com/mrdoob/stats.js) To make sure you arent chugging along
- [DatGUI](https://github.com/dataarts/dat.gui) Allow you to play with values
- [Physijs](https://github.com/chandlerprall/Physijs) - Not well integrated, had to Double assign the physi object inside my demo to get rid of the window object.And had to include add ammo and the worker file in the actual project (not git ignored) and then use a gulp process to move it where it needs to be to build correctly.

####TODOS
- Better integrate Physijs (potentially fork and make UMD module)
