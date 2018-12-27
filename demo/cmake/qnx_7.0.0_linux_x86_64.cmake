SET(CMAKE_SYSTEM_PROCESSOR "x86_64")
SET(CMAKE_SYSTEM_NAME QNX)

IF(CMAKE_HOST_LINUX)
  SET(HOST_EXECUTABLE_SUFFIX "")
ENDIF(CMAKE_HOST_LINUX)

FIND_PATH(QNX_HOST
  NAME usr/bin/qcc${HOST_EXECUTABLE_SUFFIX}
  PATHS $ENV{QNX_HOST}
  NO_CMAKE_PATH
  NO_CMAKE_ENVIRONMENT_PATH
)
  
FIND_PATH(QNX_TARGET
  NAME usr/include/errno.h
  PATHS $ENV{QNX_TARGET}
  NO_CMAKE_PATH
  NO_CMAKE_ENVIRONMENT_PATH
)

IF(CMAKE_HOST_LINUX)
  FIND_PATH(QNX_CONFIGURATION
    NAME /etc/qnx/bin/qnxactivate
    PATHS $ENV{QNX_CONFIGURATION}
    "$ENV{QNX_HOST}/usr/bin/qconfig"
    NO_CMAKE_PATH
    NO_CMAKE_ENVIRONMENT_PATH
 )
ENDIF(CMAKE_HOST_LINUX)

SET(ENV{QNX_HOST} ${QNX_HOST})
SET(ENV{QNX_TARGET} ${QNX_TARGET})
IF(CMAKE_HOST_LINUX)
  SET(ENV{QNX_CONFIGURATION} ${QNX_CONFIGURATION})
  SET(ENV{PATH} "$ENV{PATH};${QNX_HOST}/usr/bin")
ENDIF(CMAKE_HOST_LINUX)

SET(CMAKE_MAKE_PROGRAM "${QNX_HOST}/usr/bin/make${HOST_EXECUTABLE_SUFFIX}"    CACHE PATH "QNX Make Program")
SET(CMAKE_SH           "${QNX_HOST}/usr/bin/sh${HOST_EXECUTABLE_SUFFIX}"      CACHE PATH "QNX shell Program")
SET(CMAKE_AR           "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-ar${HOST_EXECUTABLE_SUFFIX}"      CACHE PATH "QNX ar Program")
SET(CMAKE_RANLIB       "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-ranlib${HOST_EXECUTABLE_SUFFIX}"      CACHE PATH "QNX ranlib Program")
SET(CMAKE_NM           "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-nm${HOST_EXECUTABLE_SUFFIX}"      CACHE PATH "QNX nm Program")
SET(CMAKE_OBJCOPY      "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-objcopy${HOST_EXECUTABLE_SUFFIX}" CACHE PATH "QNX objcopy Program")
SET(CMAKE_OBJDUMP      "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-objdump${HOST_EXECUTABLE_SUFFIX}" CACHE PATH "QNX objdump Program")
SET(CMAKE_LINKER       "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-ld"     CACHE PATH "QNX Linker Program")
SET(CMAKE_STRIP        "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-strip${HOST_EXECUTABLE_SUFFIX}"   CACHE PATH "QNX Strip Program")

SET(CMAKE_C_COMPILER ${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-gcc${HOST_EXECUTABLE_SUFFIX})
SET(CMAKE_C_FLAGS_DEBUG "-g")
SET(CMAKE_C_FLAGS_MINSIZEREL "-Os -DNDEBUG")
SET(CMAKE_C_FLAGS_RELEASE "-O3 -DNDEBUG")
SET(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g")

SET(CMAKE_CXX_COMPILER ${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-c++${HOST_EXECUTABLE_SUFFIX})
SET(CMAKE_CXX_FLAGS_DEBUG "-g")
SET(CMAKE_CXX_FLAGS_MINSIZEREL "-Os -DNDEBUG")
SET(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG")
SET(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")

SET(CMAKE_FIND_ROOT_PATH ${QNX_TARGET}) 
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
