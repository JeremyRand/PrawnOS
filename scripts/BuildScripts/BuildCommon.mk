ifndef BUILD_COMMON_MK
BUILD_COMMON_MK := 1

#Place all shared make vars below
#=========================================================================================
### MISC GLOBALS
KVER=5.4.29
# Otherwise errors are ignored when output is piped to tee:
SHELL := /bin/bash -o pipefail

### PRAWNOS CORE DIRECTORIES
PRAWNOS_BUILD := $(PRAWNOS_ROOT)/build

PRAWNOS_SCRIPTS := $(PRAWNOS_ROOT)/scripts

PRAWNOS_KERNEL := $(PRAWNOS_ROOT)/kernel

PRAWNOS_INITRAMFS := $(PRAWNOS_ROOT)/initramfs

PRAWNOS_FILESYSTEM := $(PRAWNOS_ROOT)/filesystem

### BUILD DIRS

PRAWNOS_BUILD_LOGS := $(PRAWNOS_BUILD)/logs
PRAWNOS_BUILD_DEBOOTSTRAP_APT_CACHE := $(PRAWNOS_BUILD)/debootstrap-apt-cache
PRAWNOS_BUILD_CHROOT_APT_CACHE := $(PRAWNOS_BUILD)/chroot-apt-cache


### PRAWNOS IMAGES
ifeq ($(DEBIAN_SUITE),)
DEBIAN_SUITE := buster
endif
ifeq ($(PRAWNOS_SUITE),)
PRAWNOS_SUITE := Shiba
endif
ifeq ($(PRAWNOS_DISTRO_MORPH),)
PRAWNOS_DISTRO_MORPH := debian
endif

PRAWNOS_IMAGE := $(PRAWNOS_ROOT)/PrawnOS-$(PRAWNOS_SUITE)-c201.img
PRAWNOS_IMAGE_BASE := $(PRAWNOS_IMAGE)-BASE

### BUILD SCRIPTS
PRAWNOS_BUILD_SCRIPTS := $(PRAWNOS_SCRIPTS)/BuildScripts

PRAWNOS_FILESYSTEM_SCRIPTS := $(PRAWNOS_BUILD_SCRIPTS)/FilesystemScripts
PRAWNOS_FILESYSTEM_SCRIPTS_BUILD := $(PRAWNOS_FILESYSTEM_SCRIPTS)/buildFilesystem.sh

PRAWNOS_KERNEL_SCRIPTS := $(PRAWNOS_BUILD_SCRIPTS)/KernelScripts
PRAWNOS_KERNEL_SCRIPTS_BUILD := $(PRAWNOS_KERNEL_SCRIPTS)/buildKernel.sh
PRAWNOS_KERNEL_SCRIPTS_MENUCONFIG := $(PRAWNOS_KERNEL_SCRIPTS)/crossMenuConfig.sh
PRAWNOS_KERNEL_SCRIPTS_PATCH := $(PRAWNOS_KERNEL_SCRIPTS)/patchKernel.sh
PRAWNOS_KERNEL_SCRIPTS_BUILD_ATH9K := $(PRAWNOS_KERNEL_SCRIPTS)/buildAth9k.sh

PRAWNOS_IMAGE_SCRIPTS := $(PRAWNOS_BUILD_SCRIPTS)/ImageScripts
PRAWNOS_IMAGE_SCRIPTS_INSTALL_KERNEL := $(PRAWNOS_IMAGE_SCRIPTS)/installKernelToFs.sh

PRAWNOS_INITRAMFS_SCRIPTS := $(PRAWNOS_BUILD_SCRIPTS)/InitramfsScripts
PRAWNOS_INITRAMFS_SCRIPTS_BUILD := $(PRAWNOS_INITRAMFS_SCRIPTS)/buildInitramFs.sh

PRAWNOS_PACKAGE_SCRIPTS := $(PRAWNOS_BUILD_SCRIPTS)/PackageScripts
PRAWNOS_PACKAGE_SCRIPTS_INSTALL := $(PRAWNOS_PACKAGE_SCRIPTS)/installPackage.sh
PRAWNOS_PACKAGE_SCRIPTS_PBUILD := $(PRAWNOS_PACKAGE_SCRIPTS)/pbuildPackage.sh
PRAWNOS_PACKAGE_SCRIPTS_UPLOAD := $(PRAWNOS_PACKAGE_SCRIPTS)/uploadPackage.sh

### INSTALL SCRIPTS
PRAWNOS_INSTALL_SCRIPTS := $(PRAWNOS_SCRIPTS)/InstallScripts

### SHARED SCRIPTS
PRAWNOS_SHARED_SCRIPTS := $(PRAWNOS_SCRIPTS)/Shared

PRAWNOS_SHARED_SCRIPTS_PACKAGE_LISTS := $(PRAWNOS_SHARED_SCRIPTS)/package_lists.sh

### FILESYSTEM RESOURCES
PRAWNOS_FILESYSTEM_RESOURCES := $(PRAWNOS_FILESYSTEM)/resources
PRAWNOS_FILESYSTEM_PACKAGES := $(PRAWNOS_FILESYSTEM)/packages


### PBUILDER RESOURCES
PBUILDER_DIR := $(PRAWNOS_FILESYSTEM_RESOURCES)//pbuilder
PBUILDER_CHROOT := $(PRAWNOS_BUILD)/prawnos-pbuilder-armhf-base.tgz
PBUILDER_RC := $(PBUILDER_DIR)/prawnos-pbuilder.rc
PBUILDER_HOOKS := $(PBUILDER_DIR)/hooks

PBUILDER_VARS := $(PBUILDER_CHROOT) $(PBUILDER_RC) $(PBUILDER_HOOKS)

### LOCAL APT RESOURCES
PRAWNOS_LOCAL_APT_REPO := $(PRAWNOS_BUILD)/prawnos-local-apt-repo
PRAWNOS_LOCAL_APT_SOURCE := "deb [trusted=yes] file://$(PRAWNOS_LOCAL_APT_REPO) ./"

PRAWNOS_LOCAL_APT_VARS := $(PRAWNOS_LOCAL_APT_REPO) $(PRAWNOS_LOCAL_APT_SOURCE)

### KERNEL
PRAWNOS_KERNEL_BUILD := $(PRAWNOS_BUILD)/linux-$(KVER)

### INITRAMFS
PRAWNOS_INITRAMFS_IMAGE := $(PRAWNOS_BUILD)/PrawnOS-initramfs.cpio.gz

### ATH9K
PRAWNOS_ATH9K_BUILD := $(PRAWNOS_BUILD)/open-ath9k-htc-firmware

#=========================================================================================


#Place all shared make rules below
#=========================================================================================
$(PRAWNOS_BUILD): $(PRAWNOS_BUILD_LOGS) $(PRAWNOS_BUILD_DEBOOTSTRAP_APT_CACHE) $(PRAWNOS_BUILD_CHROOT_APT_CACHE)

$(PRAWNOS_BUILD_LOGS):
	mkdir -p $(PRAWNOS_BUILD_LOGS)

$(PRAWNOS_BUILD_DEBOOTSTRAP_APT_CACHE):
	mkdir -p $(PRAWNOS_BUILD_DEBOOTSTRAP_APT_CACHE)

$(PRAWNOS_BUILD_CHROOT_APT_CACHE):
	mkdir -p $(PRAWNOS_BUILD_CHROOT_APT_CACHE)

#=========================================================================================

endif # BUILD_COMMON_MK
