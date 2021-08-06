Shader "Hidden/ScopeStencil"
{
    SubShader
    {
        // No culling or depth
        Tags { "RenderType"="Opauqe" "Queue"="Geometry-1" }
        Cull Off
        ZWrite Off
        ZTest Always
        ColorMask 0
        
        Stencil
        {
            Ref 100
            Comp Always
            Pass replace
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
