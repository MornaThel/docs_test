MAIN
DEFINE regex util.REGEX
DEFINE match util.MATCH_RESULTS
DEFINE rs STRING
DEFINE r BOOL
DEFINE i, n INTEGER
DEFINE res1 STRING

LET regex =~/(\w+)\s(\w+)/
DISPLAY "regex ",regex

LET r = util.REGEX.match("Test Libraries Test string Test",regex)
DISPLAY r

LET regex =~/(\w+)\s(\w+)/
LET r = util.REGEX.match("Test Libraries",regex)
DISPLAY r

LET regex =~/\s(\w{2,4})(\w)\s/
DISPLAY "regex ",regex

LET res1 = "Test Libraries Tee132est string Tem Test Lib11111raries Te string Temp Test Libraries Teeest string Temp"

WHILE TRUE

CALL util.REGEX.search(res1,regex) RETURNING match

DISPLAY "res1 = ", "|",res1,"|"
#DISPLAY "search res ", match

IF (match) THEN
		DISPLAY "size ", match.size()
		DISPLAY "Prefix		[",i,"] = ", match.prefix()
		DISPLAY "Suffix		[",i,"] = ", match.suffix()
		
		FOR i = 0 TO match.size() - 1
			
			DISPLAY "string		[",i,"] = ", match.str( i )
			DISPLAY "full match 	[",i,"] = ", match.matched( i )
			DISPLAY "position   	[",i,"] = ", match.position( i )
			DISPLAY "lengh 		[",i,"] = ", match.length( i )
			

		END FOR


	#LET res1 = res1.SubString(match.position( 0 ) + match.length( 0 ) +1 , res1.GetLength())
	LET res1 =  match.suffix()
	DISPLAY "res1 = ", "|",res1,"|"

	CALL fgl_getkey()
	
ELSE

	EXIT WHILE
END IF

END WHILE

{LET regex =~/a|e|i|o|u/
let rs = util.REGEX.replace("Test string",regex, "[$&]"); 
DISPLAY rs}

END MAIN
