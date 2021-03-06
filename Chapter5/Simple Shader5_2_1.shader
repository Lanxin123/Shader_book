// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with'UnityObjectToClipPos(*)'

Shader "Unity Shaders Book/SimpleShader" {
	SubShader{
		Pass{
			CGPROGRAM
			#pragma vertex vertex     //顶点着色器
			#pragma fragment fragment //片元着色器

			float4 vert(float4 v : POSITION) : SV_POSITION{
				return UnityObjectToClipPos(v);//更改mul(UNITY_MATRIX_MVP,v.vertex)为UnityObjectToClipPos(v)
				//使用v.vertx来访问模型空间的顶点坐标
			}
			
			fixed4 frag() : SV_Target{
				return fixed4(1.0,1.0,1.0,1.0);
			}
				
			ENDCG
		}
	}
}
