Shader "Hidden/ClearStencil"
{
    SubShader
    {
        // No culling or depth
        Tags { "RenderType"="Opauqe" "Queue"="Geometry-2" }
        Cull Back
        ZWrite Off
        //ZTest Always
        ColorMask 0
        
        Stencil
        {
            Ref 255
            Comp Always
            Pass Replace
        }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return half4(1,1,1,1);
            }
            ENDCG
        }
    }
}
