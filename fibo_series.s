      area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
       
         mov r0,#0
	 mov r1,#1
	 mov r2,r1
loop add r2,r0,r1
	 mov r0,r1
	 mov r1,r2
	 b loop
	 
stop b stop
endfunc
     end
