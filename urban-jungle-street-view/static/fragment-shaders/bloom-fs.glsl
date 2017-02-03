varying vec2 vUv;
uniform sampler2D tDiffuse;

void main()
{
   vec4 sum = vec4(0);
   vec2 texcoord = vUv;
  
   for( int i= -4 ;i < 4; i++)
   {
        for ( int j = -3; j < 3; j++)
        {
            sum += texture2D(tDiffuse, texcoord + vec2(j, i)*0.004) * 0.25;
        }
   }
       if (texture2D(tDiffuse, texcoord).r < 0.3)
    {
       gl_FragColor = sum*sum*0.012 + texture2D(tDiffuse, texcoord);
    }
    else
    {
        if (texture2D(tDiffuse, texcoord).r < 0.5)
        {
            gl_FragColor = sum*sum*0.009 + texture2D(tDiffuse, texcoord);
        }
        else
        {
            gl_FragColor = sum*sum*0.0075 + texture2D(tDiffuse, texcoord);
        }
    }
}