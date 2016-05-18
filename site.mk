##	gluon site.mk makefile example

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
#		The gluon-mesh-batman-adv-* package must come first because of the dependency resolution

GLUON_SITE_PACKAGES := \
	gluon-mesh-batman-adv-15 \
	gluon-alfred \
	gluon-autoupdater \
	gluon-config-mode-core \
	gluon-config-mode-hostname \
	gluon-config-mode-autoupdater \
	gluon-config-mode-mesh-vpn \
	gluon-config-mode-geo-location \
	gluon-config-mode-contact-info \
	gluon-ebtables-filter-multicast \
	gluon-ebtables-filter-ra-dhcp \
	gluon-luci-admin \
	gluon-luci-autoupdater \
	gluon-luci-portconfig \
	gluon-luci-wifi-config \
	gluon-next-node \
	gluon-mesh-vpn-fastd \
	gluon-radvd \
	gluon-respondd \
	gluon-setup-mode \
	gluon-status-page \
	gluon-v14tov15-helper \
	iwinfo \
	iptables \
	haveged

# add offline ssid only if the target has wifi device
ifeq ($(GLUON_TARGET),ar71xx-generic)
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer
endif

ifeq ($(GLUON_TARGET),ar71xx-nand)
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer
endif

ifeq ($(GLUON_TARGET),mpc85xx-generic)
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer
endif

# RaspberryPi Model 1B
ifeq ($(GLUON_TARGET),brcm2708-bcm2708)
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer \
	kmod-ath \
	kmod-ath9k-common \
	kmod-ath9k-htc \
	kmod-cfg80211 \
	kmod-crypto-aes \
	kmod-crypto-arc4 \
	kmod-gpio-button-hotplug \
	kmod-mac80211 \
	swconfig \
	iw \
	kmod-usb-core \
	kmod-usb2 \
	kmod-usb-hid \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-dm9601-ether \
	kmod-rtlwifi-usb \
	kmod-rtlwifi
endif

# add network drivers and usb stuff only to x86-generic
# (where disk space probably doesn't matter)
ifeq ($(GLUON_TARGET),x86-generic)
GLUON_SITE_PACKAGES += \
	kmod-usb-core \
	kmod-usb2 \
	kmod-usb-hid \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-dm9601-ether \
	kmod-sky2 \
	kmod-r8169 \
	kmod-forcedeth \
	kmod-8139too
endif

##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := v2016.1-1

##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= de en fr
