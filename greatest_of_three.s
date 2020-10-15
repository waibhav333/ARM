     AREA     appcode2, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
         mov r0,#2
	 mov r1,#4
	 mov r2,#8
	 cmp r1,r0
	 movge r3,r1
	 cmp r3,r2
	 ITE GT
	 movgt r3,r3
	 movle r3,r2
	 
stop	B stop; stop program	 
		 
     ENDFUNC
     END
