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
  * Buildroot 2023.05-rc3
  * GCC 11.4
  * AFBoot-STM32 0.1
  * Linux 6.1.27
  * Busybox 1.36
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
.[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.1.27 (raphael@archlinux) (arm-buildroot-uclinux-uclibcgnueabi-gcc.br_real (Buildroot 0.1-7-g1dc037d) 11.4.0, GNU ld (GNU Binutils) 2.38) #2 PREEMPT Thu Jun  8 1
9:54:53 CEST 2023
[    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F429i-DISCO board
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000090000000-0x00000000907fffff]
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2032
[    0.000000] Kernel command line: root=/dev/ram
[    0.000000] Dentry cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 7876K/8192K available (938K kernel code, 69K rwdata, 216K rodata, 71K init, 45K bss, 316K reserved, 0K cma-reserved)
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] /soc/interrupt-controller@40013c00: bank0
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] clocksource: arm_system_timer: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 355517175 ns
[    0.000000] ARM System timer initialized as clocksource
[    0.000010] sched_clock: 32 bits at 84MHz, resolution 11ns, wraps every 25565281274ns
[    0.000155] timers@40000c00: STM32 sched_clock registered
[    0.000266] Switching to timer-based delay loop, resolution 11ns
[    0.000347] timers@40000c00: STM32 delay timer registered
[    0.000453] clocksource: timers@40000c00: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 22753100554 ns
[    0.000641] /soc/timers@40000c00: STM32 clockevent driver initialized (32 bits)
[    0.002754] Calibrating delay loop (skipped), value calculated using timer frequency.. 168.00 BogoMIPS (lpj=84000)
[    0.002929] pid_max: default: 4096 minimum: 301
[    0.003381] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.003668] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.015060] rcu: Hierarchical SRCU implementation.
[    0.015120] rcu:     Max phase no-delay instances is 400.
[    0.019019] devtmpfs: initialized
[    0.243998] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.244483] pinctrl core: initialized pinctrl subsystem
[    0.350709] platform 40016800.display-controller: Fixed dependency cycle(s) with /soc/spi@40015000/display@1
[    0.406702] stm32f429-pinctrl soc:pinctrl@40020000: GPIOA bank added
[    0.412418] stm32f429-pinctrl soc:pinctrl@40020000: GPIOB bank added
[    0.415936] stm32f429-pinctrl soc:pinctrl@40020000: GPIOC bank added
[    0.421591] stm32f429-pinctrl soc:pinctrl@40020000: GPIOD bank added
[    0.430693] stm32f429-pinctrl soc:pinctrl@40020000: GPIOE bank added
[    0.436473] stm32f429-pinctrl soc:pinctrl@40020000: GPIOF bank added
[    0.442529] stm32f429-pinctrl soc:pinctrl@40020000: GPIOG bank added
[    0.445984] stm32f429-pinctrl soc:pinctrl@40020000: GPIOH bank added
[    0.454344] stm32f429-pinctrl soc:pinctrl@40020000: GPIOI bank added
[    0.457810] stm32f429-pinctrl soc:pinctrl@40020000: GPIOJ bank added
[    0.463540] stm32f429-pinctrl soc:pinctrl@40020000: GPIOK bank added
[    0.463797] stm32f429-pinctrl soc:pinctrl@40020000: Pinctrl STM32 initialized
[    0.619408] stm32-dma 40026000.dma-controller: STM32 DMA driver registered
[    0.656488] stm32-dma 40026400.dma-controller: STM32 DMA driver registered
[    0.666048] clocksource: Switched to clocksource timers@40000c00
[    0.714860] workingset: timestamp_bits=30 max_order=11 bucket_order=0
[    1.058737] STM32 USART driver initialized
[    1.077250] 40011000.serial: ttySTM0 at MMIO 0x40011000 (irq = 47, base_baud = 5250000) is a stm32-usart
[    1.628508] printk: console [ttySTM0] enabled
[    1.650713] random: crng init done
[    1.667247] stm32_rtc 40002800.rtc: registered as rtc0
[    1.672882] stm32_rtc 40002800.rtc: setting system clock to 2000-01-01T00:00:00 UTC (946684800)
[    1.684021] stm32_rtc 40002800.rtc: Date/Time must be initialized
[    2.017266] Freeing unused kernel image (initmem) memory: 24K
[    2.023450] This architecture does not have kernel memory protection.
[    2.030413] Run /init as init process
[    2.034430]   with arguments:
[    2.037742]     /init
[    2.040193]   with environment:
[    2.043613]     HOME=/
[    2.046278]     TERM=linux
seedrng: can't determine pool size, assuming 256 bits: No such file or directory
Saving 256 bits of creditable seed for next boot

Welcome to Buildroot
buildroot login:
```
