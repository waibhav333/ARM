area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
   
       vldr.f32 s15, =10    ;radius_earth
	   vldr.f32 s19, =1    ; 
	   
	   vldr.f32 s20, =5    ; radius_moon
	   vldr.f32 s21, =0.75    ; 
	   
	   
	   vldr.f32 s13, =0.4186
	   
LOOP1  mov r5,#1
	   vldr.f32 s1, =0    ; x=0 
	   vldr.f32 s8, =0    ; x=0 
	   
LOOOP2  

	   vldr.f32 s4, =1 ;
	   vldr.f32 s14, =0
	   vldr.f32 s3, =2    ;
	   vldr.f32 s9, =1  ; 
	   mov  r1,#1
	   mov r2,#0
	   vmul.f32 s2,s1,s1  ; s2 = x.sq
	    
LOOP3  vmul.f32 s1,s1,s2    ; x3,x5,x7,x9..
	   vmul.f32 s9,s9,s2    ; x2,x4,x6,x8..
	   add r1,r1,#1
	   vadd.f32 s4,s4,s3 ; increment by 2 (1, 3, 5...)
	   vadd.f32 s14,s14,s3 ; increment by 2 (2, 4, 6...)
	   
	   vdiv.f32 s5, s1, s4
	   vdiv.f32 s10, s9, s14
	   
	   and r2,r1,#1
	   cmp r2,#0
	   ITE EQ 
	   vsubeq.f32 s6,s6,s5 ; 
	   vaddne.f32 s7,s7,s5 ;
	   and r2,r1,#1
	   cmp r2,#0
	   ITE EQ 
	   vsubeq.f32 s16,s16,s10 ;  
	   vaddne.f32 s17,s17,s10 ; 
	   cmp r1,#5      ; 
	   bne LOOP3

       vadd.f32 s8,s8,s7  ; 
	   vadd.f32 s8,s8,s6  ; 
       vldr.f32 s18, =1
       vadd.f32 s18,s18,s17  ; 
	   vadd.f32 s18,s18,s16  ; 

       vmul.f32 s33,s15,s18  ; x_earth
	   vmul.f32 s23,s15,s8  ; y_earth

       vmul.f32 s37,s19,s18  ; x_earth
	   vmul.f32 s27,s19,s8  ; y_moon
       
	   vaddne.f32 s1,s1,s13 
           vaddne.f32 s8,s8,s13  	   
	   vadd.f32 s15,s15,s19
	   vadd.f32 s20,s20,s21
	   add r5,r5,#1       
	   cmp r5,#16
	   bne LOOP2	   
	   
	   vcmp s1,#6.28
	   beq LOOP1
	   

stop b stop
endfunc
     end
