varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float texelSize;
uniform float time;

void main()
{
    vec4 temp = vec4(0.1, 0.1, 0.1, 0.1) * texture2D( gm_BaseTexture, v_vTexcoord ) * (mod(v_vTexcoord.y, texelSize*2.0) * 1.0/texelSize);
    gl_FragColor = temp;
}