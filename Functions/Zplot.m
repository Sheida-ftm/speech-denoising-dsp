function img = Zplot(Z_matrix)





lenx    = size(Z_matrix , 1);
leny    = size(Z_matrix , 2);
ColorMset   = zeros(lenx , leny , 3);


abs_Z_matrix    = abs(Z_matrix);

hue     = angle(Z_matrix) / (2*pi);
hue     = -min(min(hue))+hue;

ColorMset(: , : , 1)    = hue;

%loop to limit absolute value of function from 0 to 2pi
abs_Z_matrix(abs_Z_matrix > 2*pi)   = 2*pi;

ColorMset(: , : , 2) = abs(sin(pi*sqrt(abs_Z_matrix)));
ColorMset(: , : , 2) = 1 - (1 - ColorMset(: , : , 2)).^3; 

ColorMset(: , : , 3) = abs(cos(pi*sqrt(abs_Z_matrix)));
ColorMset(: , : , 3) = 1 - (1 - ColorMset(: , : , 3)).^3; 
ColorMset(: , : , 3) = (0.6 + ColorMset(: , : , 3) * 0.4);


h_wait=waitbar(0,'Please  wait...');
for mm=1:lenx
    for nn=1:leny
        a       = ColorMset(mm , nn , 1);
        sat     = ColorMset(mm , nn , 2);
        val     = ColorMset(mm , nn , 3);
        
        zo      = floor(6*a);
        rough   = (zo);
        f       = a*6 - zo;
        p       = val*(1 - sat);
        q       = val*(1 - sat * f);
        t       = val*(1 - sat * (1 - f));
        
        switch (rough)
            case 0
                r   = val; 
                g   = t; 
                b   = p;
                
            case 1
                r   = q; 
                g   = val; 
                b   = p;
                
            case 2
                r   = p; 
                g   = val; 
                b   = t;
                
            case 3
                r   = p; 
                g   = q; 
                b   = val;
                
            case 4
                r   = t; 
                g   = p; 
                b   = val;
                
            case 5
                r   = val;
                g   = p; 
                b   = q;
        end
        
        
        co  = (256*r);
        if (co>255)
            co  = 255;
        end
        colors(mm , nn , 1)     = co;
        
        co  = (256*g);
        if (co>255)
            co  = 255;
        end
        colors(mm , nn , 2)     = co;
        
        co  = (256*b);
        if (co>255)
            co  = 255;
        end
        colors(mm , nn , 3)     = co;
        
    end
    waitbar(mm/lenx , h_wait);
end

close(h_wait);

colors_uint8    = uint8(colors);
imshow(colors_uint8)
if nargout==1
    img     = colors_uint8;
end

%function end