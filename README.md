Linux on the STM32F429I Discovery board with Buildroot
======================================================

The project is a set of patches and configuration files to build a bootloader and a Linux based system image with a minimal root file system for the great [STM32F429I Discovery board](http://www.st.com/en/evaluation-tools/32f429idiscovery.html).

Build
-----

Let's download, extract and patch Buildroot:

`$ make bootstrap`


Then build:

`$ make build`


Run
---

Write U-Boot, the kernel and the root file system in the internal flash:

`$ make flash`

U-Boot is configured to run the kernel in XIP mode directly from the internal flash. The root file system is in a MTD partition also in the internal flash.

![alt text](doc/stm32f429i-disco_linux.jpg)

Changelog
---------

* next
  * Buildroot 2018.02
  * GCC 6.4.0
  * AFBoot-STM32 0.1
  * Linux 4.15.7
  * Busybox 1.27.2
  * Console on USART1 (pins PA9/PA10)

* 0.1
  * Buildroot 2016.08.1
  * GCC 4.4.1 (external)
  * U-Boot 2010.03
  * Linux 2.6.33
  * Busybox 1.25.0
  * OpenOCD 0.10.0
  * Console on USART3 (pins PC10/PC11)

Boot log
--------

```
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.15.7 (***) (***) #23 PREEMPT Tue Mar 13 20:25:51 CET 2018
[    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F429i-DISCO board
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2032
[    0.000000] Kernel command line: root=/dev/ram
[    0.000000] Dentry cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Memory: 7784K/8192K available (1201K kernel code, 127K rwdata, 404K rodata, 63K init, 114K bss, 408K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x00000000 - 0x00001000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x00000000 - 0xffffffff   (4095 MB)
[    0.000000]     lowmem  : 0x90000000 - 0x90800000   (   8 MB)
[    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (1606 kB)
[    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (  12 kB)
[    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 128 kB)
[    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 115 kB)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  Tasks RCU enabled.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] interrupt-controller@40013c00: bank0, External IRQs available:0x7fffff
[    0.000000] clocksource: arm_system_timer: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 331816030 ns
[    0.000000] ARM System timer initialized as clocksource
[    0.000000] /soc/timer@40000c00: STM32 clockevent driver initialized (32 bits)
[    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836475000000ns
[    0.080000] Calibrating delay loop... 118.68 BogoMIPS (lpj=593408)
[    0.090000] pid_max: default: 4096 minimum: 301
[    0.090000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.090000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.090000] Hierarchical SRCU implementation.
[    0.100000] devtmpfs: initialized
[    0.150000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.150000] pinctrl core: initialized pinctrl subsystem
[    0.200000] stm32f429-pinctrl soc:pin-controller: GPIOA bank added
[    0.200000] stm32f429-pinctrl soc:pin-controller: GPIOB bank added
[    0.200000] stm32f429-pinctrl soc:pin-controller: GPIOC bank added
[    0.200000] stm32f429-pinctrl soc:pin-controller: GPIOD bank added
[    0.210000] stm32f429-pinctrl soc:pin-controller: GPIOE bank added
[    0.210000] stm32f429-pinctrl soc:pin-controller: GPIOF bank added
[    0.210000] stm32f429-pinctrl soc:pin-controller: GPIOG bank added
[    0.210000] stm32f429-pinctrl soc:pin-controller: GPIOH bank added
[    0.210000] stm32f429-pinctrl soc:pin-controller: GPIOI bank added
[    0.210000] stm32f429-pinctrl soc:pin-controller: GPIOJ bank added
[    0.220000] stm32f429-pinctrl soc:pin-controller: GPIOK bank added
[    0.220000] stm32f429-pinctrl soc:pin-controller: Pinctrl STM32 initialized
[    0.250000] stm32-dma 40026000.dma-controller: STM32 DMA driver registered
[    0.260000] stm32-dma 40026400.dma-controller: STM32 DMA driver registered
[    0.270000] clocksource: Switched to clocksource arm_system_timer
[    0.710000] workingset: timestamp_bits=30 max_order=11 bucket_order=0
[    0.740000] random: fast init done
[    0.790000] io scheduler noop registered (default)
[    0.790000] io scheduler mq-deadline registered
[    0.790000] io scheduler kyber registered
[    0.790000] STM32 USART driver initialized
[    0.800000] 40011000.serial: ttyS0 at MMIO 0x40011000 (irq = 32, base_baud = 5625000) is a stm32-usart
[    1.160000] console [ttyS0] enabled
[    1.160000] stm32_rtc 40002800.rtc: rtc core: registered 40002800.rtc as rtc0
[    1.180000] stm32_rtc 40002800.rtc: Date/Time must be initialized
[    1.180000] i2c /dev entries driver
[    1.200000] input: gpio_keys as /devices/platform/gpio_keys/input/input0
[    1.210000] stm32_rtc 40002800.rtc: setting system clock to 2000-01-01 02:11:28 UTC (946692688)
[    1.220000] Freeing unused kernel memory: 12K
[    1.220000] This architecture does not have kernel memory protection.


BusyBox v1.27.2 (2018-03-13 19:50:58 CET) hush - the humble shell
Enter 'help' for a list of built-in commands.

/ #
```

