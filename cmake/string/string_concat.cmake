function(string_concat)
  #string(CONCAT ans ${ARGN})
  string(REPLACE ";" "" ans "${ARGN}")
  return_ref(ans)
endfunction()