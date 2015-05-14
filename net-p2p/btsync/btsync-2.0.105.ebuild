# Copyright (C) 2013 Jonathan Vasquez 
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit systemd user

DESCRIPTION="Automatically sync files via secure, distributed technology."
HOMEPAGE="http://labs.bittorrent.com/experiments/sync.html"
SRC_URI="
	amd64?	( https://download-cdn.getsyncapp.com/${PV}/linux-x64/BitTorrent-Sync_x64.tar.gz   -> ${P}_amd64.tar.gz )
	x86?	( https://download-cdn.getsyncapp.com/${PV}/linux-i386/BitTorrent-Sync_i386.tar.gz -> ${P}_i386.tar.gz )
	arm?	( https://download-cdn.getsyncapp.com/${PV}/linux-arm/BitTorrent-Sync_arm.tar.gz   -> ${P}_arm.tar.gz )"

RESTRICT="mirror strip"
LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="arm amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_PREBUILT="opt/${PN}/${PN}"

S="${WORKDIR}"

pkg_setup() {
	enewgroup btsync
        enewuser btsync -1 -1 /var/lib/btsync btsync
}

src_install() {
	exeinto "/opt/${PN}"
	doexe btsync
	insinto "/etc/${PN}"
	./btsync --dump-sample-config > ${D}/etc/${PN}/config

	doinitd "${FILESDIR}/init.d/${PN}"
	systemd_dounit "${FILESDIR}/system/btsync.service"
	systemd_douserunit "${FILESDIR}/user/btsync.service"

	fowners -R root:btsync /opt/${PN}
	fperms -R 775 /opt/${PN}
}

pkg_postinst() {
ewarn "You have to add your user to the btsync group to use btsync.
Do this by running the following command from a root terminal:

	usermod -a -G btsync your_user

If you are using systemd you should start the following as your user:

	systemctl start --user btsync

You may also tell your system to automatically launch btsync:

	systemctl enable --user btsync

Or you can use the system-wide btsync user:

	systemctl start btsync

You may access the web-GUI at localhost:8888.
 
"
}
