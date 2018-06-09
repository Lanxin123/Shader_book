// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unity Shaders Book/SimpleShader" {
	Properties{
		_Color("Color Tint",Color) = (1.0,1.0,1.0,1.0)
		//添加了可视属性
	}
	SubShader{
		Pass{
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag

		fixed4 _Color;

		struct a2v {

		// : 后是语义 个人怀疑就是位域

		float4 vertex : POSITION;				//POSITION告诉UNITY，用模型空间的顶点坐标填充vert的变量
		float3 normal : NORMAL;				//NORMAL告诉UNITY，用模型空间的法线方向填充normal变量
		float4 texcoord : TEXCOORD0;		//TEXCOORD告诉UNITY，用模型的第一套纹理坐标填充texcoord变量
	};

	struct v2f {
		float4 pos : SV_POSITION;				//SV_POSITION语义告诉Unity，pos里包含了顶点在裁剪空间中的位置信息
		fixed3 color : COLOR0;						//COLOR0可以存储颜色信息
	};

	v2f vert(a2v v) {
		v2f o;
		o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
		o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
		return o;
	}


	/*	float4 vert(float4 v : POSITION) : SV_POSITION{
	return UnityObjectToClipPos(v);
	}
	*/
	fixed4 frag(v2f i) : SV_Target{
		fixed3 c = i.color;
		c *= _Color.rgb;
		return fixed4(c,1.0);
	}

		ENDCG
	}
	}
}

//语义--Unity支持的语义有 POSITION TANGENT NORMAL TEXCOORD0 TEXCOORD1 TEXCOORD2 TEXCOORD3 COLOR等


