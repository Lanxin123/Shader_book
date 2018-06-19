
Shader "Custom/Eye" {
	Properties{
		_MainTex("Base", 2D) = "white"
	}
		SubShader{
		Pass{
		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"
		sampler2D _MainTex;
	float4 _MainTex_ST;
	struct v2f {
		float4  pos : SV_POSITION;
		float2  uv : TEXCOORD0;
	};
	v2f vert(appdata_base v)
	{
		v2f o;
		o.pos = mul(UNITY_MATRIX_MVP,v.vertex);
		o.uv = mul(UNITY_MATRIX_MV,v.vertex);
		return o;
	}
	float4 frag(v2f i) : COLOR
	{
		float4 texCol = tex2D(_MainTex,i.uv);
		return outp;
	}
		ENDCG
	}
	}
}
//RIP，下面的语法已经被删除了

//Shader "Texgen" {
//	Properties{
//		_MainTex("Base", 2D) = "white" { TexGen EyeLinear }
//	}
//		SubShader{
//		Pass{
//		SetTexture[_MainTex]{ combine
//		texture }
//	}
//	}
//}