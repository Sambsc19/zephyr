if(CONFIG_BOOTLOADER_MCUBOOT)
board_runner_args(stm32cubeprogrammer "--port=swd" "--reset-mode=hw")
else()
board_runner_args(stm32cubeprogrammer "--erase" "--port=swd" "--reset-mode=hw")
endif()

board_runner_args(openocd --target-handle=_CHIPNAME.cpu0)

include(${ZEPHYR_BASE}/boards/common/stm32cubeprogrammer.board.cmake)
# FIXME: openocd runner not yet available.
include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
