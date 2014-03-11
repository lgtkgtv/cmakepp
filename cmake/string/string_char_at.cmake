# returns the character @ index of input string
function(string_char_at result index input)
	string(LENGTH "${input}" len )
	if(${len} EQUAL 0)
		return_value(NOTFOUND)
	endif()
	if(${index} LESS 0)
		math(EXPR index "${len} - 1 ${index}")
	endif()
	string(SUBSTRING "${input}" ${index} 1 char)
	return_value(${char})
endfunction()