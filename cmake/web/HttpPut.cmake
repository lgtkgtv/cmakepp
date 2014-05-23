
function(HttpPut response url content)
	message(DEBUG LEVEL 8 "HttpPut called for '${url}'")
	message(PUSH)
	set(tmpfile)
	if(NOT EXISTS "${content}")
		file_make_temporary( "${content}")
		ans(tmpfile)
		set(content "${tmpfile}")
	endif()

	file(UPLOAD "${content}" "${url}" LOG log ${ARGN})
	if(tmpfile)
		file(REMOVE ${tmpfile})
	endif()

	ParseHttpResponse(res "${log}")
	set(${response} ${res} PARENT_SCOPE)
	message(DEBUG LEVEL 8 FORMAT "HttpPut returned response code: {res.code}" )
	message(POP)
endfunction()