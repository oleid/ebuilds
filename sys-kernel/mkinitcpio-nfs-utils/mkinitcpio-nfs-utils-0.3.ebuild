# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: mkinitcpio-0.8.8.ebuild $
EAPI=3
inherit eutils

DESCRIPTION="ipconfig and nfsmount tools for NFS root support in mkinitcpio"
HOMEPAGE="http://www.archlinux.org/"
SRC_URI="ftp://ftp.archlinux.org/other/mkinitcpio/${PN}-${PV}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=sys-kernel/mkinitcpio-18"

RDEPEND="${DEPEND}"

src_prepare() {
   epatch "$FILESDIR/nfsmount-fix-wrong-umount-path.patch"
}

src_install() {
   emake DESTDIR="${D}" install || die "Install Failed"

   # additional files
   install -m755 -t "${D}/usr/lib/initcpio/hooks/" ${FILESDIR}/hooks/*
   install -m755 -t "${D}/usr/lib/initcpio/install/"  ${FILESDIR}/install/*
} 

