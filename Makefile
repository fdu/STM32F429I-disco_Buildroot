url_buildroot = https://buildroot.org/downloads/buildroot-2016.08.1.tar.gz
archive_buildroot = buildroot.tar.gz
system_image = stm32f769i-disco_system.uImage
dir_download = downloads
dir_configs = configs
dir_buildroot = buildroot

bootstrap:
	mkdir -p $(dir_download)
	mkdir -p $(dir_buildroot)
	wget -O $(dir_download)/$(archive_buildroot) $(url_buildroot)
	tar zxvf $(dir_download)/$(archive_buildroot) -C $(dir_buildroot) --strip-components=1
	cd $(dir_buildroot) && patch -p0 < ../patches/buildroot.001_quickfix_elf2flt_passed_to_linker 
	cd $(dir_buildroot) && patch -p0 < ../patches/buildroot.002_openocd_version_0_10_0
	cd $(dir_buildroot) && patch -p0 < ../patches/buildroot.003_openocd_hash
	cp $(dir_configs)/buildroot $(dir_buildroot)/.config

build:
	make -j10 -C $(dir_buildroot)
	cat $(dir_buildroot)/output/build/linux-master/arch/arm/boot/tempfile $(dir_buildroot)/output/images/xipImage > $(dir_buildroot)/output/images/xipImage.bin
	$(dir_buildroot)/output/build/uboot-master/tools/mkimage -x -A arm -O linux -T kernel -C none -a 0x08020040 -e 0x08020041 -n "Linux-2.6.33-arm1" \
		 -d $(dir_buildroot)/output/images/xipImage.bin $(dir_buildroot)/output/images/xipuImage.bin

flash:
	cd $(dir_buildroot)/output/build/host-openocd-0.10.0/tcl && ../../../host/usr/bin/openocd \
	-f board/stm32f429discovery.cfg \
	-c "init" \
	-c "reset init" \
	-c "flash probe 0" \
	-c "flash info 0" \
	-c "flash write_image erase ../../../images/u-boot.bin 0x08000000" \
	-c "flash write_image erase ../../../images/xipuImage.bin 0x08020000" \
	-c "flash write_image erase ../../../images/rootfs.romfs 0x08120000" \
	-c "reset run" -c shutdown

clean:
	rm -rf $(dir_buildroot) $(dir_download)
