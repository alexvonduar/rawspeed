include(CheckCXXCompilerFlag)

if(1)
  MESSAGE("-- Checking for -march=native support")
  CHECK_CXX_COMPILER_FLAG("-march=native" MARCHNATIVE)
  if(MARCHNATIVE)
    set(MARCH "-march=native")
  else()
    MESSAGE("-- Checking for -mtune=native support")
    CHECK_CXX_COMPILER_FLAG("-mtune=native" MTUNENATIVE)
    if(MTUNENATIVE)
      set(MARCH "-mtune=native")
    else()
      MESSAGE("-- Checking for -mtune=generic support")
      CHECK_CXX_COMPILER_FLAG("-mtune=generic" MTUNEGENERIC)
      if(MTUNEGENERIC)
        set(MARCH "-mtune=generic")
      else()
        message(WARNING "Do not know which -march/-mtune to pass! Resulting binaries may be broken!")
      endif()
    endif()
  endif()
else()
  MESSAGE("-- Checking for -mtune=generic support")
  CHECK_CXX_COMPILER_FLAG("-mtune=generic" MTUNEGENERIC)
  if(MTUNEGENERIC)
    set(MARCH "-mtune=generic")
  else()
    message(WARNING "Do not know which -march/-mtune to pass! Resulting binaries may be broken!")
  endif()
endif()

ADD_DEFINITIONS(${MARCH})
