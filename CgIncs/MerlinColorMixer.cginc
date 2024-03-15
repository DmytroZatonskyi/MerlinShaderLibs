//Rename to MerlinColorMixer
#if !defined(MERLINCOLORMIXER_INCLUDED)
#define MERLINCOLORMIXER_INCLUDED

    #include "Constants.cginc"
    
    static const half POINT3 = .3;
    static const half POINT11 = .11;
    static const half POINT59 = .59;
    static const half TWELVE = 12;
    static const half SIXTEEN = 16;
    
    //Normal
    half3 NormalMix(half3 src, half3 dst, half value)
    {
        return lerp(src, dst, value);
    }
    
    
    //Darken
    half3 Darken(half3 src, half3 dst, half value)
    {
        half3 darken = min(src, dst);
        return lerp(src, darken, value);
    }
    
    //Multiply
    half3 Multiply(half3 src, half3 dst, half value)
    {
        half3 multiply = half3(src*dst);
        return lerp(src, multiply, value);
    }
    
    //ColorBurn
    half3 ColorBurn(half3 src, half3 dst, half value)
    {
        half3 colorBurn = ONE - (ONE - dst) / src;
        return lerp(src, colorBurn, value);
    }
    
    //LinearBurn
    half3 LinearBurn(half3 src, half3 dst, half value)
    {
        half3 linearBurn = src + dst - ONE;
        return lerp(src, linearBurn, value);
    }
    
    //DarkerColor
    half3 DarkerColor(half3 src, half3 dst, half value)
    {
        half3 darkerColor = (src.r + src.g + src.b < dst.r + dst.g + dst.b) ? src : dst;
        return lerp(src, darkerColor, value);
    }
    
    //Lighten
    half3 Lighten(half3 src, half3 dst, half value)
    {
        half3 lighten = max(src, dst); 
        return lerp(src, lighten, value);
    }
    
    //Screen
    half3 Screen(half3 src, half3 dst, half value)
    {
        half3 screen = src + dst - src * dst;
        return lerp(src, screen, value);
    }
    
    //ColorDodge
    half3 ColorDodge(half3 src, half3 dst, half value)
    {
        half cdR = dst.r / (ONE - src.r);
        half cdG = dst.g / (ONE - src.g);
        half cdB = dst.b / (ONE - src.b);
        
        half3 colorDodge = half3(cdR, cdG, cdB);
        return lerp(src, colorDodge, value);
    }
    
    //LinearDodge
    half3 LinearDodge(half3 src, half3 dst, half value)
    {
        half3 linearDodge = src + dst;
        return lerp(src, linearDodge, value);
    }
    
    //LighterColor
    half3 LighterColor(half3 src, half3 dst, half value)
    {
        half3 lighterColor = (src.r + src.g + src.b > dst.r + dst.g + dst.b) ? src : dst;
        return lerp(src, lighterColor, value);
    }
    
    //Overlay
    half OverlayCheck(half src, half dst)
    {
        return src < POINT5 ? TWO * src * dst : ONE - TWO * (ONE - src) * (ONE - dst);
    }
    
    half3 Overlay(half3 src, half3 dst, half value)
    {
        half overlayR = OverlayCheck(src.r, dst.r);
        half overlayG = OverlayCheck(src.g, dst.g);
        half overlayB = OverlayCheck(src.b, dst.b);
        
        half3 overlay = half3(overlayR, overlayG, overlayB); 
        return lerp(src, overlay, value);
    }
    
    //SoftLight
    half SoftLightCheck(half src, half dst)
    {
        return (src < POINT5) ? dst - (ONE - TWO * src) * dst * (ONE - dst) 
            : (dst < POINT25) ? dst + (TWO * src - ONE) * dst * ((SIXTEEN * dst - TWELVE) * dst + THREE) 
                         : dst + (TWO * src - ONE) * (sqrt(dst) - dst);
    }
    
    half3 SoftLight(half3 src, half3 dst, half value)
    {
        half softLightR = SoftLightCheck(src.r, dst.r);
        half softLightG = SoftLightCheck(src.g, dst.g);
        half softLightB = SoftLightCheck(src.b, dst.b);
        
        half3 softLight = half3(softLightR, softLightG, softLightB);
        return lerp(src, softLight, value);
    }
    
    //HardLight
    half3 HardLight(half3 src, half3 dst, half value)
    {
        half3 hardLight = (src < POINT5) ? TWO * src * dst : ONE - TWO * (ONE - src) * (ONE - dst);
        return lerp(src, hardLight, value);
    }
    
    //VividLight
    half VividLightCheck(half src, half dst)
    {
        return (src < POINT5) ? TWO * src * dst : ONE - TWO * (ONE - src) * (ONE - dst);
    }
    
    half3 VividLight(half3 src, half3 dst, half value)
    {
        half vividLightR = VividLightCheck(src.r, dst.r);
        half vividLightG = VividLightCheck(src.g, dst.g);
        half vividLightB = VividLightCheck(src.b, dst.b);
        
        half3 vividLight = half3(vividLightR, vividLightG, vividLightB);
        return lerp(src, vividLight, value);
    }
    
    //LinearLight
    half3 LinearLight(half3 src, half3 dst, half value)
    {
        half3 linearLight = TWO * src + dst - ONE;
        return lerp(src, linearLight, value);
    }
    
    //PinLight
    half PinLightCheck(half src, half dst)
    {
        return (TWO * src - ONE > dst) ? TWO * src - ONE : (src < POINT5 * dst) ? TWO * src : dst;  
    }
    
    half3 PinLight(half3 src, half3 dst, half value)
    {
        half pinLightR = PinLightCheck(src.x, dst.x);
        half pinLightG = PinLightCheck(src.y, dst.y);
        half pinLightB = PinLightCheck(src.z, dst.z);
        
        half3 pinLight = half3(pinLightR, pinLightG, pinLightB); 
        return lerp(src, pinLight, value);
    }
    
    //HardMix
    half3 HardMix(half3 src, half3 dst, half value)
    {
        half3 hardMix = floor(src + dst);
        return lerp(src, hardMix, value);
    }
    
    //Difference
    half3 Difference(half3 src, half3 dst, half value)
    {
        half3 difference = abs(dst - src);
        return lerp(src, difference, value);
    }
    
    //Exclusion
    half3 Exclusion(half3 src, half3 dst, half value)
    {
        half3 exclusion = src + dst - 2.0 * src * dst;
        return lerp(src, exclusion, value);
    }
    
    //Substract
    half3 Substract(half3 src, half3 dst, half value)
    {
        half3 substract = src - dst;
        return lerp(src, substract, value);
    }
    
    //Divide
    half3 Divide(half3 src, half3 dst, half value)
    {
        half3 divide = src / dst;
        return lerp(src, divide, value);
    }
    
    //RGB to HSV
    half3 RGB2HSV(half3 color)
    {
        half4 K = half4(ZERO, -ONE / THREE, TWO / THREE, -ONE);
        half4 p = lerp(half4(color.bg, K.wz), half4(color.gb, K.xy), step(color.b, color.g));
        half4 q = lerp(half4(p.xyw, color.r), half4(color.r, p.yzx), step(p.x, color.r));
        
        half d = q.x - min(q.w, q.y);
        return half3(abs(q.z + (q.w - q.y) / (SIX * d + EPSILON_RGB2HSV)), d / (q.x + EPSILON_RGB2HSV), q.x);
    }
    
    //HSV to RGB
    half3 HSV2RGB(half3 color)
    {
        half4 K = half4(ONE, TWO / THREE, ONE / THREE, THREE);
        half3 p = abs(frac(color.rrr + K.xyz) * SIX - K.www);
        return color.b * lerp(K.xxx, clamp(p - K.xxx, ZERO, ONE), color.g);
    }
    
    //Hue
    half3 Hue(half3 src, half3 dst, half value)
    {
        dst = RGB2HSV(dst);
        dst.r = RGB2HSV(src).r;
        half3 hue = HSV2RGB(dst);
        return lerp(src, hue, value);
    }

    //Sturation
    half3 Saturation(half3 src, half3 dst, half value)
    {
        dst = RGB2HSV(dst);
        dst.g = RGB2HSV(src).g;
        half3 saturation = HSV2RGB(dst);
        return lerp(src, saturation, value);
    }
    
    //Color
    half3 Color(half3 src, half3 dst, half value)
    {
        /*
        src = RGB2HSV(src);
        src.b = RGB2HSV(dst).b;
        half3 color = HSV2RGB(src);
        return lerp(src, color, value);
        */
        half dstLum = dot(dst, half3(POINT3, POINT59, POINT11));
        half srcLum = dot(src, half3(POINT3, POINT59, POINT11));
        half lumDIff = srcLum - dstLum;
        half3 luminosity = dst + lumDIff;
        half minLum = min(min(luminosity.x, luminosity.y), luminosity.z);
        half maxLum = max(max(luminosity.x, luminosity.y), luminosity.z);
        
        half3 resultLum;
        if(minLum < ZERO) 
            resultLum = srcLum + ((luminosity - srcLum) * srcLum) / (srcLum - minLum);
        else if(maxLum > ONE) 
            resultLum = srcLum + ((luminosity - srcLum) * (ONE - srcLum)) / (maxLum - srcLum);
        else 
            resultLum = luminosity;
        
        return lerp(src, resultLum, value);
    }
    
    //Luminosity
    half3 Luminosity(half3 src, half3 dst, half value)
    {
        half dstLum = dot(dst, half3(POINT3, POINT59, POINT11));
        half srcLum = dot(src, half3(POINT3, POINT59, POINT11));
        half lumDIff = srcLum - dstLum;
        half3 luminosity = dst + lumDIff;
        half minLum = min(min(luminosity.x, luminosity.y), luminosity.z);
        half maxLum = max(max(luminosity.x, luminosity.y), luminosity.z);
        
        half3 resultLum;
        if(minLum < ZERO) 
            resultLum = srcLum + ((luminosity - srcLum) * srcLum) / (srcLum - minLum);
        else if(maxLum > ONE) 
            resultLum = srcLum + ((luminosity - srcLum) * (ONE - srcLum)) / (maxLum - srcLum);
        else 
            resultLum = luminosity;
        
        return lerp(src, resultLum, value);
    }
    
    //Greyscale
    half3 GreyScale(half3 src, half value)
    {
        half3 grey =  dot(src, half3(0.3, 0.59, 0.11));
        return lerp(src, grey, value);
    } 
    
    half3 Contrast(half3 src, half value)
    {
        return ((src.rgb - 0.5f) * max(value, 0)) + 0.5f;
    }
    
    half3 Mix(half3 src, half3 dst, half value)
    {
        #if _MIXMODE_NORMAL
        return NormalMix(src, dst, value); 
        #elif _MIXMODE_DARKEN
        return Darken(src, dst, value); 
        #elif _MIXMODE_MULTIPLY
        return Multiply(src, dst, value); 
        #elif _MIXMODE_COLORBURN
        return ColorBurn(src, dst, value); 
        #elif _MIXMODE_LINEARBURN
        return LinearBurn(src, dst, value); 
        #elif _MIXMODE_DARKERCOLOR
        return DarkerColor(src, dst, value); 
        #elif _MIXMODE_LIGHTEN
        return Lighten(src, dst, value);
        #elif _MIXMODE_SCREEN
        return Screen(src, dst, value);
        #elif _MIXMODE_COLORDODGE
        return ColorDodge(src, dst, value);   
        #elif _MIXMODE_LINEARDODGE
        return LinearDodge(src, dst, value);  
        #elif _MIXMODE_LIGHTERCOLOR
        return LighterColor(src, dst, value);  
        #elif _MIXMODE_OVERLAY
        return Overlay(src, dst, value);  
        #elif _MIXMODE_SOFTLIGHT
        return SoftLight(src, dst, value); 
        #elif _MIXMODE_HARDLIGHT
        return HardLight(src, dst, value); 
        #elif _MIXMODE_VIVIDLIGHT
        return VividLight(src, dst, value);   
        #elif _MIXMODE_LINEARLIGHT
        return LinearLight(src, dst, value);  
        #elif _MIXMODE_PINLIGHT
        return PinLight(src, dst, value);  
        #elif _MIXMODE_HARDMIX
        return HardMix(src, dst, value);
        #elif _MIXMODE_DIFFERENCE
        return Difference(src, dst, value);    
        #elif _MIXMODE_EXCLUSION
        return Exclusion(src, dst, value);
        #elif _MIXMODE_SUBSTRACT
        return Substract(src, dst, value);    
        #elif _MIXMODE_DIVIDE
        return Divide(src, dst, value);
        #elif _MIXMODE_HUE
        return Hue(src, dst, value);     
        #elif _MIXMODE_COLOR
        return Color(src, dst, value);     
        #elif _MIXMODE_SATURATION
        return Saturation(src, dst, value);
        #elif _MIXMODE_LUMINOSITY
        return Luminosity(src, dst, value);        
        #endif  
    }
    

#endif