##############################################################################
## Copyright (c) 2018-2019, Lawrence Livermore National Security, LLC.
##
## Produced at the Lawrence Livermore National Laboratory
##
## LLNL-CODE-758885
##
## All rights reserved.
##
## This file is part of Comb.
##
## For details, see https://github.com/LLNL/Comb
## Please also see the LICENSE file for MIT license.
##############################################################################

if (ENABLE_MPI)
  if(MPI_FOUND)
    message(STATUS "MPI Enabled")
  else()
    message(FATAL_ERROR "MPI NOT FOUND")
  endif()
endif()


if (ENABLE_OPENMP)
  if(OPENMP_FOUND)
    message(STATUS "OpenMP Enabled")
  else()
    message(FATAL_ERROR "OpenMP NOT FOUND")
  endif()
endif()


if (ENABLE_CUDA)
  if(CUDA_FOUND)
    message(STATUS "Cuda Enabled")
  else()
    message(FATAL_ERROR "Cuda NOT FOUND")
  endif()
endif()


if (ENABLE_GPUMP)
  message(STATUS "FindGPUMP.camke ${PROJECT_SOURCE_DIR}/cmake")
  set (CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake;${CMAKE_MODULE_PATH}")
  find_package(gpump REQUIRED)

  if (GPUMP_FOUND)
    message(STATUS "GPUMP Enabled")
    message(STATUS "GPUMP  Compile Flags:  ${GPUMP_CXX_COMPILE_FLAGS}")
    message(STATUS "GPUMP  Include Path:   ${GPUMP_INCLUDE_PATH}")
    message(STATUS "GPUMP  Link Flags:     ${GPUMP_CXX_LINK_FLAGS}")
    message(STATUS "GPUMP  Libraries:      ${GPUMP_CXX_LIBRARIES}")
    message(STATUS "GPUMP  Device Arch:    ${GPUMP_ARCH}")
  else()
    message(FATAL_ERROR "gpump NOT FOUND")
  endif()

  # register GPUMP with blt
  blt_register_library(NAME gpump
                       INCLUDES ${GPUMP_CXX_INCLUDE_PATH}
                       LIBRARIES ${GPUMP_CXX_LIBRARIES}
                       COMPILE_FLAGS ${GPUMP_CXX_COMPILE_FLAGS}
                       LINK_FLAGS    ${GPUMP_CXX_LINK_FLAGS}
                       DEFINES USE_GPUMP)
endif()
