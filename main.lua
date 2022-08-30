function _init()
--player
	x=0
	y=121
	ps=63
	f=false	
	score=0
	ss=9--score sprite in single digitsplace
	tens=-1--tens place	sprite
	huns=-1--hundreds

--enemy	
	ex=121
	ey=0
	es=62
	ef=true 
	
	peppers={}
	for i=1,200 do
		local rd_pep={
			sp=17,
			x=flr(rnd(16))*8,
			y=flr(rnd(16))*8,
			}
			add(peppers,rd_pep)	
		end
 for i=1,4 do
		local gr_pep={
			sp=18,
			x=flr(rnd(16))*8,
			y=flr(rnd(16))*8,
			}
			add(peppers,gr_pep)	
		end
	for i=1,4 do
		local or_pep={
			sp=19,
			x=flr(rnd(16))*8,
			y=flr(rnd(16))*8,
			}
			add(peppers,or_pep)	
		end	
	for i=1,4 do
		local ye_pep={
			sp=20,
			x=flr(rnd(16))*8,
			y=flr(rnd(16))*8,
			}
			add(peppers,ye_pep)	
		end	

	palt(14,true)
	palt(0,false)
	
end

function _update()
 
 if (y<119) animation() animation_enemy()
 if (y>119 and (btn(0) or btn(1))) walking() 
 	
	if (x>127) x=0
	if (ex>127) ex=0
	if (x<0) x=127
	if (ex<0) ex=127
	
	if (y>120) y=120
	if (y<0) y=0	
		
	flying()
	
 if (y>119 and (x>ex or x<ex)) walking_enemy()
	
 flying_enemy()
 
	for pepper in all (peppers) do
	 if (pepper.x<=x+4 and pepper.x>=x-4) 
	 and (pepper.y<=y+4 and pepper.y>=y-4) then	  
			score+=1
			score_keep()
			del(peppers,pepper)	
			sfx(1) 
	end
	end
	
end --fxn

function animation() 

	ps=ps-16
	if (ps<30) ps=46
	
end

function animation_enemy()

	es=es-16
	if (es<28) es=44

end


function flying()

	if (btn(0))	x-=2 f=true 
 if (btn(1)) x+=2 f=false
 if (btn(2)) y-=2
	if (btn(3)) y+=2
				
	if (btn(0) and btn(2)) x-=0.5 y-=0.5 f=true
	if (btn(0) and btn(3)) x-=0.5 y+=0.5 f=true ps=47 
	if (btn(1) and btn(3)) x+=0.5 y+=0.5 f=false	ps=47
	if (btn(1) and btn(2)) x+=0.5 y-=0.5 f=false
		
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

function walking() 

	ps=ps-0.35
	if (ps<62) ps=63

end

function walking_enemy() 

	es=es-0.35
	if (es<60) es=61

end

function score_keep()--fuck	
	if (score<=9)	ss=score-1
	if (score>9) ss=score%10-1 --should cover all single digits places
	if (score%10==0 and score<99) tens+=1 ss=9
	if (score%100==0) huns+=1 tens=9 ss=9
	if (score%100>=1 and score>99) tens=((flr(score/10))%10)-1  
end

function draw_peppers()
	for pepper in all (peppers) do 
		spr(pepper.sp,pepper.x,pepper.y)
	end
end	


function _draw()
	cls()
	spr(ps,x,y,1,1,f)
	spr(es,ex,ey,1,1,ef)
	draw_peppers()

	--static score sprites
	spr(4,0,1)
	spr(10,8,1)
	spr(9,16,1)
	spr(11,24,1)
	spr(12,32,1)
	spr(13,39,1)
	
	--dymamic score sprites
	spr(ss,59,1)
	spr(tens,52,1)
	spr(huns,45,1)		
end







    
    
    
    
    
