FILESEXTRAPATHS:prepend := "${THISDIR}/linux-variscite:"

# basler patchset
SRC_URI:append = "\
    file://0001-imx8mm-imx8mq-make-sensor-controls-available-in-mx6s.patch \
    file://0002-imx8mm-imx8mq-added-SRGGB8-format-support.patch \
    file://0003-imx8mq-rxhs-settle-and-send-level-value-is-now-optin.patch \
    file://0004-imx8mm-imx8mq-increase-max-video-memory-from-64-to-1.patch \
    file://0005-imx8mm-imx8mq-imx8mp-implement-cache-invalidation-fo.patch \
    file://0006-imx8mm-imx8mq-handle-subdev-unbind.patch \
    file://0007-imx8mm-imx8mq-media-csi-Add-support-for-RAW10.patch \
    file://0008-imx8mm-imx8mq-media-mxc-mipi_csi-Add-UYVY8_2X8.patch \
    file://0009-imx8mq-media-mxc-capture-Enable-two_8bit_sensor_mode.patch \
    file://0010-imx8mm-media-mxc-Enable-dual-pixel-mode-for-YUV422.patch \
    file://0015-imx8mm-imx8mq-mxc-capture-Add-debug-event-interrupt-.patch \
    file://0016-imx8mm-imx8mq-mxc-Fix-MASK_OPTION-in-CSICR18-to-avoi.patch \
    file://0018-imx8mm-imx8mq-media-mxc-change-mx6s_fmt.bpp-to-bits-.patch \
    file://0019-imx8mm-media-mxc-add-support-for-YUV420-NV12.patch \
"

# Override/extend machine configurations

# imx8mp-var-dart
KERNEL_DEVICETREE:append:imx8mp-var-dart = " \
	freescale/imx8mp-var-dart-dt8mcustomboard-basler-isi0.dtb \
	freescale/imx8mp-var-dart-dt8mcustomboard-legacy-basler-isi0.dtb \
	freescale/imx8mp-var-som-symphony-basler-isi0.dtb \
"

KERNEL_DEVICETREE:append:imx8mm-var-dart = " \
	freescale/imx8mm-var-dart-dt8mcustomboard-basler.dtb \
	freescale/imx8mm-var-dart-dt8mcustomboard-legacy-basler.dtb \
	freescale/imx8mm-var-som-symphony-basler.dtb \
	freescale/imx8mm-var-som-symphony-legacy-basler.dtb \
"

KERNEL_DEVICETREE:append:imx8mq-var-dart = " \
	freescale/imx8mq-var-dart-dt8mcustomboard-sd-hdmi-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-sd-lvds-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-sd-lvds-hdmi-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-wifi-hdmi-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-wifi-lvds-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-wifi-lvds-hdmi-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-dp-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-hdmi-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds-dp-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds-hdmi-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-dp-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-hdmi-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds-dp-basler.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds-hdmi-basler.dtb \
"

# imx8mp-var-dart make added devicetree default
pkg_postinst:kernel-devicetree:append:imx8mp-var-dart () {
        cd $D/boot
        mv imx8mp-var-dart-dt8mcustomboard.dtb imx8mp-var-dart-dt8mcustomboard-ov5640.dtb
        ln -fs imx8mp-var-dart-dt8mcustomboard-basler-isi0.dtb imx8mp-var-dart-dt8mcustomboard.dtb
        mv imx8mp-var-dart-dt8mcustomboard-legacy.dtb imx8mp-var-dart-dt8mcustomboard-legacy-ov5640.dtb
        ln -fs imx8mp-var-dart-dt8mcustomboard-legacy-basler-isi0.dtb imx8mp-var-dart-dt8mcustomboard-legacy.dtb
        mv imx8mp-var-som-symphony.dtb imx8mp-var-som-symphony-ov5640.dtb
        ln -fs imx8mp-var-som-symphony-basler-isi0.dtb imx8mp-var-som-symphony.dtb
}

pkg_postinst:kernel-devicetree:append:imx8mm-var-dart () {
	cd $D/boot
	mv imx8mm-var-dart-dt8mcustomboard.dtb imx8mm-var-dart-dt8mcustomboard-ov5640.dtb
	ln -fs imx8mm-var-dart-dt8mcustomboard-basler.dtb imx8mm-var-dart-dt8mcustomboard.dtb
	mv imx8mm-var-dart-dt8mcustomboard-legacy.dtb imx8mm-var-dart-dt8mcustomboard-legacy-ov5640.dtb
	ln -fs imx8mm-var-dart-dt8mcustomboard-legacy-basler.dtb imx8mm-var-dart-dt8mcustomboard-legacy.dtb
	mv imx8mm-var-som-symphony.dtb imx8mm-var-som-symphony-ov5640.dtb
	ln -fs imx8mm-var-som-symphony-basler.dtb imx8mm-var-som-symphony.dtb
	mv imx8mm-var-som-symphony-legacy.dtb imx8mm-var-som-symphony-legacy-ov5640-.dtb
	ln -fs imx8mm-var-som-symphony-legacy-basler.dtb imx8mm-var-som-symphony-legacy.dtb
}

pkg_postinst:kernel-devicetree:append:imx8mq-var-dart () {
	cd $D/boot
	ln -fs ${DEFAULT_DTB_PREFIX}-${DEFAULT_DTB}-basler.dtb ${DEFAULT_DTB_PREFIX}.dtb
	ln -fs ${DEFAULT_DTB_PREFIX}-legacy-${DEFAULT_DTB}-basler.dtb ${DEFAULT_DTB_PREFIX}-legacy.dtb
}
