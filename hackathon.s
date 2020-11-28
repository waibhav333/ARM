     area     appcode, CODE, READONLY
     IMPORT printMsg
	 IMPORT printComma
	 IMPORT printNextline
     IMPORT printMessage
     export __main
	 ENTRY 
__main  function		 
       
	    VLDR.F32   s18, = 100 ; centre_earth
		VLDR.F32   s19, = 10 ; radius_earth
        VLDR.F32   s20, = 0 ; x_earth
        VLDR.F32   s21, = 0 ; y_earth		
		        
		VLDR.F32   s22, = 500 ; centre_MOON
		VLDR.F32   s23, = 50 ; radius_MOON
        VLDR.F32   s24, = 0 ; x_moon
        VLDR.F32   s25, = 0 ; y_moon
 		
		VLDR.F32   s17, = 0.314 ; change_radian 
		VLDR.F32   s26, = 2 ; change_radius
		
		mov r7,#50
		mov r8,#0

reset_0m mov r8,#0
        VLDR.F32 s13, = 0 ; radian
  
spiralm  
   
        VMOV.f32   s7,s13;
        VLDR.F32   s2, = 1 ;initial value taken 1
		VLDR.F32   s1, = 1 
        VLDR.F32   s5, = 1; constant taken 1 
		VLDR.F32   s6, = 2 ;initial value taken 1
        VLDR.F32   s8, = 0;
		
	    MOV R5 , #8 ;
            VMUL.F32 s2 , s7, s7 ; s2=s7*s7;x^2
loop1m        
            VMUL.F32 s7 , s2, s7 ; s7=s2*s7;x^3
            VADD.f32 s1 , s1 , s6 ;  s1=s1+s6 s1 =3 
           
		   
		   VMOV.F32 s9,s1;
		   VMOV.F32 s4,s7;		   
loop2m      VDIV.F32  s4 , s4, s9 ;s4=s2/s1
		   VSUB.f32 s9,s9,s5;
		   vcmp.f32 s9,s5
           VMRS APSR_nzcv,FPSCR;
           BNE  loop2m
		   
           VSUB.f32 s8, s8, s4 ;s8= -x3 - x7 
	   
           VMUL.f32 s7 , s2 ,s7  ; x5 
           VADD.f32 s1 , s1 , s6 ;  5 

           VMOV.F32 s9,s1;
		   VMOV.F32 s4,s7;
loop3m      VDIV.F32  s4 , s4, s9 ;x5/5!
		   VSUB.f32 s9,s9,s5;
		   vcmp.f32 s9,s5
           VMRS APSR_nzcv,FPSCR;
           BNE  loop3m
		   
          
           VADD.f32 s8, s8, s4 ; +x5 + x9
	   

        SUB R5 ,R5 , #1 ;
	    CMP R5 , #1 ;
		BNE loop1m
		VADD.f32 s14,s13,s8;
		
		
		VMOV.F32   s7,s13;
        VLDR.F32   s2, = 1 ;initial value taken 1
	    VLDR.F32   s1, = 0;
		VLDR.F32   s8, = 0;
		VLDR.F32   s4, = 0;
				
	    MOV R5 , #8 ;
            VMUL.f32 s2 , s7, s7; x^2
            VMOV.F32 s7,s5; s5=1
loop1_cm        
            VMUL.F32 s7 , s2, s7 ; x^2
            VADD.f32 s1 , s1 , s6 ;  s6=2
           
		   
            VMOV.F32 s9,s1;
	        VMOV.F32 s4,s7;	
	   
loop2_cm      VDIV.F32  s4 , s4, s9 ; x2/2!
	         VSUB.f32 s9,s9,s5 ;
	         vcmp.f32 s9,s5
             VMRS APSR_nzcv,FPSCR;
             BNE  loop2_cm
		   
             VSUB.f32 s8, s8, s4 ; -x2 -x6 
	   
             VMUL.f32 s7 , s2 ,s7  ; x4
             VADD.f32 s1 , s1 , s6 ;  4 

             VMOV.F32 s9,s1;
	         VMOV.F32 s4,s7;
loop3_cm      VDIV.F32  s4 , s4, s9 ;x4/4!
	         VSUB.f32 s9,s9,s5;
	         vcmp.f32 s9,s5
             VMRS APSR_nzcv,FPSCR;
             BNE  loop3_cm
		   
          
             VADD.f32 s8, s8, s4 ; +x4 + x8
	   

        SUB R5 ,R5 , #1 ;
	    CMP R5 , #1 ;
		BNE loop1_cm
		VADD.f32 s15,s5,s8;
		
		vadd.f32 s13,s13,s17  ; increase_radian
		vadd.f32 s23,s23,s26  ; increase_radius
		
		vmul.f32 s27,s23,s15  ; rcos_moon
		vadd.f32 s24,s27,s22  ; x_moon
		vmov.f32 r0,s24
		bl printMsg
		bl printComma
		
		vmul.f32 s28,s23,s14
		vadd.f32 s25,s28,s22  ; y_moon
        vmov.f32 r0,s25
		bl printMsg
		bl printNextline
		
		sub r7,r7,#1
		
		add r8,r8,#1
		cmp r8,#20
		BEQ reset_0m
	
		cmp r7,#0
		bne spiralm
		
	;////////////////////////////////////////////	
		
		mov r7,#81
		mov r8,#0

reset_0 mov r8,#0
        VLDR.F32 s13, = 0 ; radian
  
spiral  
   
        VMOV.f32   s7,s13;
        VLDR.F32   s2, = 1 ;initial value taken 1
		VLDR.F32   s1, = 1 
        VLDR.F32   s5, = 1; constant taken 1 
		VLDR.F32   s6, = 2 ;initial value taken 1
        VLDR.F32   s8, = 0;
		
	    MOV R5 , #8 ;
            VMUL.F32 s2 , s7, s7 ; s2=s7*s7;x^2
loop1        
            VMUL.F32 s7 , s2, s7 ; s7=s2*s7;x^3
            VADD.f32 s1 , s1 , s6 ;  s1=s1+s6 s1 =3 
           
		   
		   VMOV.F32 s9,s1;
		   VMOV.F32 s4,s7;		   
loop2      VDIV.F32  s4 , s4, s9 ;s4=s2/s1
		   VSUB.f32 s9,s9,s5;
		   vcmp.f32 s9,s5
           VMRS APSR_nzcv,FPSCR;
           BNE  loop2
		   
           VSUB.f32 s8, s8, s4 ;s8= -x3 - x7 
	   
           VMUL.f32 s7 , s2 ,s7  ; x5 
           VADD.f32 s1 , s1 , s6 ;  5 

           VMOV.F32 s9,s1;
		   VMOV.F32 s4,s7;
loop3      VDIV.F32  s4 , s4, s9 ;x5/5!
		   VSUB.f32 s9,s9,s5;
		   vcmp.f32 s9,s5
           VMRS APSR_nzcv,FPSCR;
           BNE  loop3
		   
          
           VADD.f32 s8, s8, s4 ; +x5 + x9
	   

        SUB R5 ,R5 , #1 ;
	    CMP R5 , #1 ;
		BNE loop1
		VADD.f32 s14,s13,s8;
		
		
		VMOV.F32   s7,s13;
        VLDR.F32   s2, = 1 ;initial value taken 1
	    VLDR.F32   s1, = 0;
		VLDR.F32   s8, = 0;
		VLDR.F32   s4, = 0;
				
	    MOV R5 , #8 ;
            VMUL.f32 s2 , s7, s7; x^2
            VMOV.F32 s7,s5; s5=1
loop1_c        
            VMUL.F32 s7 , s2, s7 ; x^2
            VADD.f32 s1 , s1 , s6 ;  s6=2
           
		   
            VMOV.F32 s9,s1;
	        VMOV.F32 s4,s7;	
	   
loop2_c      VDIV.F32  s4 , s4, s9 ; x2/2!
	         VSUB.f32 s9,s9,s5 ;
	         vcmp.f32 s9,s5
             VMRS APSR_nzcv,FPSCR;
             BNE  loop2_c
		   
             VSUB.f32 s8, s8, s4 ; -x2 -x6 
	   
             VMUL.f32 s7 , s2 ,s7  ; x4
             VADD.f32 s1 , s1 , s6 ;  4 

             VMOV.F32 s9,s1;
	         VMOV.F32 s4,s7;
loop3_c      VDIV.F32  s4 , s4, s9 ;x4/4!
	         VSUB.f32 s9,s9,s5;
	         vcmp.f32 s9,s5
             VMRS APSR_nzcv,FPSCR;
             BNE  loop3_c
		   
          
             VADD.f32 s8, s8, s4 ; +x4 + x8
	   

        SUB R5 ,R5 , #1 ;
	    CMP R5 , #1 ;
		BNE loop1_c
		VADD.f32 s15,s5,s8;
		
		vadd.f32 s13,s13,s17  ; increase_radian
		vadd.f32 s19,s19,s26  ; increase_radius
		
		vmul.f32 s27,s19,s15  ; rcos_earth
		vmul.f32 s28,s19,s14  ; rsin_earth
		
		vadd.f32 s20,s18,s27  ; x_earth
		vmov.f32 r0,s20
		bl printMsg
		bl printComma
		
		vadd.f32 s21,s18,s28  ; y_earth
		vmov.f32 r0,s21
		bl printMsg
		bl printNextline

		sub r7,r7,#1
		
		add r8,r8,#1
		cmp r8,#20
		BEQ reset_0
	
		cmp r7,#0
		bne spiral
	 
stop b stop
endfunc
     end
		 
	
