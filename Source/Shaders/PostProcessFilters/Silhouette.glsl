uniform sampler2D depthTexture;

varying vec2 v_textureCoordinates;

float linearDepth(float depth)
{
    float far = czm_currentFrustum.y;
    float near = czm_currentFrustum.x;
    return (2.0 * near) / (far + near - depth * (far - near));
}

void main(void)
{
    float depth = texture2D(depthTexture, v_textureCoordinates).r;
    depth = linearDepth(depth);
    gl_FragColor = czm_packDepth(depth);
}
