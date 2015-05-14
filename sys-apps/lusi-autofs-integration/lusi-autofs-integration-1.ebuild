# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="LuSi autofs integration"
HOMEPAGE="https://github.com/oleid/ebuilds/blob/master/sys-apps/lusi-autofs-integration"

SRC_URI=""

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

# that works, the stable version has issues
RDEPEND=">=net-fs/autofs-5.1.1"

src_unpack() {
	mkdir $WORKDIR/$P # otherwise install won't work
}

src_install() {
        exeinto /etc/autofs
        doexe ${FILESDIR}/auto.cluster.sh

	einfo "Generating /etc/autofs/auto.cluster, please wait..."
        sh ${FILESDIR}/auto.cluster.sh > ${D}/etc/autofs/auto.cluster
        mkdir -p ${D}/cluster

	einfo "Please verify /etc/autofs/auto.cluster and add the following line to /etc/autofs/auto.master:"
        einfo "/cluster      /etc/autofs/auto.cluster      --timeout=60 --ghost"
}
