function _init()
    --player
        x=0
        y=121
        ps=63
        f=false	
    
    --enemy	
        ex=121
        ey=0
        es=62
        ef=true 
    end
    
    function _update()
     
     if (y<120) animation()
     if (y>120) ps=63 
        
        if (x>127) x=0
        if (ex>127) ex=0
        if (x<0) x=127
        if (ex<0) ex=127
        
        if (y>120) y=120
        if (y<0) y=0
        
        flying()
        
        animation_enemy()
        flying_enemy()
        
    end
    
    function animation() 
    
        ps=ps-16
        if (ps<30) ps=46
        
    end
    
    function animation_enemy()
    
        es=es-16
        if (es<28) es=44
        
    end
    
    function flying()
    
        if (btn(0))	x-=1.5 f=true 
     if (btn(1)) x+=1.5	f=false
     if (btn(2)) y-=1.5
        if (btn(3)) y+=1.5 
                
        if (btn(0) and btn(2)) x-=1 y-=0.25 f=true
        if (btn(0) and btn(3)) x-=1 y+=0.25 f=true ps=47 
        if (btn(1) and btn(3)) x+=1 y+=0.25 f=false	ps=47
        if (btn(1) and btn(2)) x+=1 y-=0.25 f=false
            
    end
    
    function flying_enemy() 
    
        if (x>ex) ex+=1.5
        if (y>ey) ey+=1.5
        if (x<ex) ex-=1.5
        if (y<ey) ey-=1.5
     
     --+2 accounts for glitch y tracking
        --player sometimes below by only 1 pixel
        --and enemy does not glide
        
        if (x>ex and y>ey+2) es=45 
        if (x<ex and y>ey+2) es=45 
     
        if (x<ex) ef=true
        if (x>ex) ef=false
        
    end	
        
    
    function _draw()
        cls()
    --map(0,0)
        spr(ps,x,y,1,1,f)
        spr(es,ex,ey,1,1,ef)
    end
    
    
    
    
    
    
    
