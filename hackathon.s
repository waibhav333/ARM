area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
   
       vldr.f32 s15, =10    ; spiral1_rad=10
	   vldr.f32 s19, =1    ; incremet_by=2
	   
	   vldr.f32 s20, =5    ; spiral2_rad=5
	   vldr.f32 s21, =0.75    ; incremet_by=1
	   
	   
	   vldr.f32 s13, =0.4186
	   
start  mov r3,#1
	   vldr.f32 s1, =0    ; (theta)
	   vldr.f32 s8, =0    ; (theta)
	   
loop1  

	   vldr.f32 s4, =1
	   vldr.f32 s14, =0
	   vldr.f32 s3, =2    ; increment by 2
	   
	   vldr.f32 s9, =1  ; for cos
	   
	   mov  r1,#1
	   mov r2,#0
	   
	   
	   vmul.f32 s2,s1,s1  ; x2
	    
repeat vmul.f32 s1,s1,s2    ; x3,x5,x7,x9..
	   vmul.f32 s9,s9,s2    ; x2,x4,x6,x8..
	   
	   add r1,r1,#1
	   vadd.f32 s4,s4,s3
	   vadd.f32 s14,s14,s3
	   
	   vdiv.f32 s5, s1, s4
	   vdiv.f32 s10, s9, s14
	   
	   and r2,r1,#1
	   cmp r2,#0
	   ITE EQ 
	   vsubeq.f32 s6,s6,s5 ; if odd then -x3/3 -x7/7 
	   vaddne.f32 s7,s7,s5 ; else  x5/5 +x9/9
	   
	   and r2,r1,#1
	   cmp r2,#0
	   ITE EQ 
	   vsubeq.f32 s16,s16,s10 ; if odd then -x3/3 -x7/7 
	   vaddne.f32 s17,s17,s10 ; else  x5/5 +x9/9
	   
	   cmp r1,#5      ; 
	   bne repeat
	   
	   
	   vadd.f32 s8,s8,s7  ; 
	   vadd.f32 s8,s8,s6  ; sin value in s8
  
       vldr.f32 s18, =1

       vadd.f32 s18,s18,s17  ; 
	   vadd.f32 s18,s18,s16  ; cos value in s18


;spiral_1 coordinates
       vmul.f32 s33,s15,s18  ; x1= r1.cos
	   vmul.f32 s23,s15,s8  ; y1= r1.sin
      
;spiral_2 coordinates
       vmul.f32 s37,s19,s18  ; x2= r2.cos
	   vmul.f32 s27,s19,s8  ; y2= r2.sin
       
	   
	   vaddne.f32 s1,s1,s13 
       vaddne.f32 s8,s8,s13  	   
	   
	   vadd.f32 s15,s15,s19
	   vadd.f32 s20,s20,s21
	   
	   
	   add r3,r3,#1
	   	   
	   vcmp s1,#6.28
	   beq start
	   
	   cmp r3,#16
	   bne loop1

stop b stop
endfunc
     end
