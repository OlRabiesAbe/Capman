// UNUSED
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float _surfaceWidth;
uniform float _surfaceHeight;

void main()
{
    vec4 c = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if ( mod( floor( v_vTexCoord.y * _surfaceHeight ), 2.0 ) == 0.0 )
	{
		//discard;
		c.rgb = vec3(0.6);
	}
	gl_FragColor = c;
}
