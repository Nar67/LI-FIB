<programa> --> begin <instrucciones> end
<instrucciones> --> <instruccion>
<instrucciones> --> <instruccion> ; <instrucciones>
<instruccion> --> <variable> = <variable> + <variable>
<instruccion> --> if <variable> = <variable> then <instrucciones> else <instrucciones> endif
<variable>--> x
<variable>--> y
<variable>--> z
Tres ejemplos de programas sumbol:
begin x=x+z end
begin x=x+y; z=z+z; x=y+x end
begin x=y+z; if z=z then x=x+z; y=y+z else z=z+y endif; x=x+z