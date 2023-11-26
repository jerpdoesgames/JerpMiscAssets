# OBS ShaderFilter Plus filters

Shaders to cover some basic effects for the [OBS ShaderFilter Plus](https://obsproject.com/forum/resources/obs-shaderfilter-plus.929) plugin for OBS 25+.  The plugin hasn't been updated in at least a couple of years as of this writing and the examples are pretty sparse.  There do happen to be some pending pull requests that may be worth looking into.

## simple-drop-shadow.hlsl

Really basic Drop Shadow based on a more complex [drop shadow by Alex Anderson](https://gist.github.com/Andersama/133d87cb1584d4b5d0ba4d367468dd2b#file-mrt-drop-shadow-hlsl-L8).  Their version doesn't doesn't work directly with the plugin so I've just made a stripped down version of it for now.  Doesn't support blurring - just a basic flat shadow.

Can define:
* Color
* X offset
* Y offset
* Opacity
* Can toggle whether to use premultiplied alpha