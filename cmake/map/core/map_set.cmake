# set a value in the map
function(map_set this key )
  #tick()
  set(property_ref "${this}.${key}")
  get_property(has_key GLOBAL PROPERTY "${property_ref}" SET)
	if(NOT has_key)
		set_property(GLOBAL APPEND PROPERTY "${this}" "${key}")
	endif()
	# set the properties value
	set_property(GLOBAL PROPERTY "${property_ref}" "${ARGN}")
endfunction()

function(map_remove map key)
  map_has("${map}" "${key}")
  map_set("${map}" "${key}")
  ans(has_key)
  if(NOT has_key)
    return(false)
  endif()
  get_property(keys GLOBAL PROPERTY "${map}")
  list(REMOVE_ITEM keys "${key}")
  set_property(GLOBAL PROPERTY "${map}" "${keys}")
  return(true)
endfunction()