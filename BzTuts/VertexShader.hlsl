struct VS_INPUT
{
	float4 pos : POSITION;
	float4 color: COLOR;
};

struct VS_OUTPUT
{
	float4 pos: SV_POSITION;
	float4 color: COLOR;
};

cbuffer ConstantBuffer : register(b0)
{
	float4x4 wvpMat;
};

VS_OUTPUT main(VS_INPUT input)
{
	VS_OUTPUT output;
	//output.pos = float4(input.pos, 1.0f);
	output.pos = mul(input.pos, wvpMat);
	//output.pos.w = 1.0f;
	output.color = input.color;
	return output;
}

