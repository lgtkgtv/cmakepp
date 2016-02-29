macro(arguments_foreach __arg_begin __arg_end __arg_callable)
  if(${__arg_end} GREATER ${__arg_begin})
    callable_function("${__arg_callable}")
    ans(__arg_callable)
    math(EXPR __last_arg_index "${__arg_end} - 1")
    set(__arg_res)   
    eval("
      macro(__arguments_foreach_func)
        foreach(i RANGE ${__arg_begin} ${__last_arg_index} )        
          ${__arg_callable}(\"\${ARGV\${i}}\")
          list(APPEND __arg_res \"\${__ans}\")
        endforeach()
      endmacro()
      ")
    __arguments_foreach_func("${__arg_begin}" "${__arg_end}")
    set(__ans "${__arg_res}")
  else()
    set(__ans)
  endif()
endmacro()