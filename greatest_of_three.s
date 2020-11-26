     area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
       
      
         mov r0,#8
	 mov r1,#20
	 mov r2,#4
	 cmp r1,r0
	 movge r3,r1
	 movle r3,r0
	 cmp r3,r2
	 movle r3,r2	   

stop b stop
endfunc
     end
