# Copyright 2014-2015 Jonathan Vasquez &ltjvasquez1011@gmail.com>
# Ebuild for binary package by Olaf Leidinger &lt;oleid@mescharet.de>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit user systemd

GITHUB_USER="syncthing"
GITHUB_REPO="syncthing"
GITHUB_TAG="${PV}"

NAME="syncthing"
DESCRIPTION="Open Source Continuous File Synchronization"
HOMEPAGE="http://syncthing.net/"

SRC_URI="
	amd64? ( https://github.com/${GITHUB_USER}/${GITHUB_REPO}/releases/download/v${GITHUB_TAG}/$NAME-linux-amd64-v$PV.tar.gz )
	x86?   ( https://github.com/${GITHUB_USER}/${GITHUB_REPO}/releases/download/v${GITHUB_TAG}/$NAME-linux-386-v$PV.tar.gz   )
	arm?   ( https://github.com/${GITHUB_USER}/${GITHUB_REPO}/releases/download/v${GITHUB_TAG}/$NAME-linux-arm-v$PV.tar.gz   )

"

RESTRICT="mirror"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="x86 amd64 arm"

IUSE="doc systemd"

RDEPEND="virtual/libc"

S="${WORKDIR}/${A%.tar.gz}"

configDir="~/.config/syncthing"
config="${configDir}/config.xml"

src_install() {
	exeinto /usr/bin
        doexe syncthing
	dodoc AUTHORS.txt LICENSE.txt README.txt

	use doc && dodoc  FAQ.pdf  Getting-Started.pdf

	if use systemd; then
		local systemdSystemServiceFile="etc/linux-systemd/system/${NAME}@.service"
		local systemdUserServiceFile="etc/linux-systemd/user/${NAME}.service"
		systemd_dounit "${systemdSystemServiceFile}"
		systemd_douserunit "${systemdUserServiceFile}"
	fi
}

pkg_postinst() {
	elog "This is a breaking change release (0.11.X). If you have other devices that are"
	elog "running on 0.10.X, you will need to upgrade them as well since these versions"
	elog "cannot communicate with each other."
	elog ""
	elog "In order to be able to view the Web UI remotely (from another machine),"
	elog "edit your ${config} and change the 127.0.0.1:8080 to 0.0.0.0:8080 in"
	elog "the 'address' section. This file will only be generated once you start syncthing."
	elog ""
	elog "Modify the /etc/conf.d/${PN} file and set the user/group/ and syncthing home directory"
	elog "before launching. Afterwards, you can start ${PN} by doing a: rc-config start ${PN}"
}
