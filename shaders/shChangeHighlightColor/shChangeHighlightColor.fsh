//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 highlight_col;
uniform vec4 replace_col;

void main()
{
	vec4 texcol = texture2D( gm_BaseTexture, v_vTexcoord );
	
    gl_FragColor = ((texcol == replace_col) ? highlight_col : texcol);
}