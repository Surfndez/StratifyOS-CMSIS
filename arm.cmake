
set(SOURCE_DIR ${CMAKE_SOURCE_DIR}/CMSIS_5/CMSIS/DSP/Source)

#Add sources to the project
set(FOLDER_LIST 
    BasicMathFunctions  
    CommonTables  
		ComplexMathFunctions
		ControllerFunctions
    FastMathFunctions  
		FilteringFunctions
		MatrixFunctions
    StatisticsFunctions  
    SupportFunctions  
    TransformFunctions  
)
foreach(FOLDER ${FOLDER_LIST})
    set(SOURCES_PREFIX ${SOURCE_DIR}/${FOLDER})
    add_subdirectory(${SOURCES_PREFIX})
    list(APPEND SOURCELIST ${SOURCES})
endforeach()

set(SOS_LIB_SOURCELIST ${SOURCELIST} ${CMAKE_SOURCE_DIR}/arm_dsp_api.h ${CMAKE_SOURCE_DIR}/arm_dsp_api.c ${CMAKE_SOURCE_DIR}/arm_dsp_api_declaration.h)

# Linking with the kernel
set(SOS_LIB_TYPE release)
set(SOS_LIB_INCLUDE_DIRECTORIES ${SOURCE_DIR}/../Include ${TOOLCHAIN_INC_DIR}/mcu/arch/cmsis)
set(SOS_LIB_OPTION kernel)
set(SOS_LIB_DEFINITIONS -DSOS_ARM_DSP_FFT_MAX_SIZE=65536)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

# Linking with the kernel -- FFT size limits 512
set(SOS_LIB_TYPE release)
set(SOS_LIB_INCLUDE_DIRECTORIES ${SOURCE_DIR}/../Include ${TOOLCHAIN_INC_DIR}/mcu/arch/cmsis)
set(SOS_LIB_OPTION kernel_fft_512)
set(SOS_LIB_DEFINITIONS -DSOS_ARM_DSP_FFT_MAX_SIZE=512)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

# Linking with the kernel -- FFT size limits 256
set(SOS_LIB_TYPE release)
set(SOS_LIB_INCLUDE_DIRECTORIES ${SOURCE_DIR}/../Include ${TOOLCHAIN_INC_DIR}/mcu/arch/cmsis)
set(SOS_LIB_OPTION kernel_fft_256)
set(SOS_LIB_DEFINITIONS -DSOS_ARM_DSP_FFT_MAX_SIZE=256)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

# Linking with the kernel -- FFT size limits 128
set(SOS_LIB_TYPE release)
set(SOS_LIB_INCLUDE_DIRECTORIES ${SOURCE_DIR}/../Include ${TOOLCHAIN_INC_DIR}/mcu/arch/cmsis)
set(SOS_LIB_OPTION kernel_fft_128)
set(SOS_LIB_DEFINITIONS -DSOS_ARM_DSP_FFT_MAX_SIZE=128)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

# Linking with the kernel -- FFT size limits 64
set(SOS_LIB_TYPE release)
set(SOS_LIB_INCLUDE_DIRECTORIES ${SOURCE_DIR}/../Include ${TOOLCHAIN_INC_DIR}/mcu/arch/cmsis)
set(SOS_LIB_OPTION kernel_fft_64)
set(SOS_LIB_DEFINITIONS -DSOS_ARM_DSP_FFT_MAX_SIZE=64)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

# Link within an app
set(SOS_LIB_OPTION "")
set(SOS_LIB_TYPE release)
set(SOS_LIB_BUILD_FLAGS -mlong-calls)
set(SOS_LIB_DEFINITIONS -DSOS_ARM_DSP_FFT_MAX_SIZE=65536)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

install(DIRECTORY ${SOURCE_DIR}/../Include/ DESTINATION ${TOOLCHAIN_INC_DIR}/mcu/arch/cmsis)
install(FILES ${CMAKE_SOURCE_DIR}/arm_dsp_api.h ${CMAKE_SOURCE_DIR}/arm_dsp_api_declaration.h DESTINATION include)

