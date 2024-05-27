# SPDX-License-Identifier: Apache-2.0

board_runner_args(stm32cubeprogrammer "--erase" "--port=swd" "--reset-mode=hw")
board_runner_args(openocd --target-handle=_CHIPNAME.cpu0)

if(CONFIG_STM32_MEMMAP)
board_runner_args(stm32cubeprogrammer "--port=swd" "--reset-mode=hw")
board_runner_args(stm32cubeprogrammer "--hex-file=${ZEPHYR_BASE}/build/zephyr/zephyr.hex")
board_runner_args(stm32cubeprogrammer "--extload=MX66UW1G45G_STM32H7S78-DK.stldr")
else()
board_runner_args(stm32cubeprogrammer "--erase" "--port=swd" "--reset-mode=hw" )
endif()

include(${ZEPHYR_BASE}/boards/common/stm32cubeprogrammer.board.cmake)
# FIXME: openocd runner not yet available.
include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
