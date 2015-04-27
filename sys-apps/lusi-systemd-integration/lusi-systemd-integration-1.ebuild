# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="LuSi systemd integration"
HOMEPAGE="https://github.com/oleid/ebuilds/blob/master/sys-apps/lusi-systemd-integration"

SRC_URI=""

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="sys-apps/systemd"

src_unpack() {
	mkdir $WORKDIR/$P # otherwise install won't work
}

src_install() {
        exeinto /usr/lib/systemd/system-generators/
        doexe ${FILESDIR}/dema-automount-generator
}
