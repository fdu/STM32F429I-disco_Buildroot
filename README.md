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

Changelog
---------

* 0.1
  * Buildroot 2016.08.1
  * GCC 4.4.1 (external)
  * U-Boot 2010.03
  * Linux 2.6.33
  * Busybox 1.25.0
  * OpenOCD 0.10.0
