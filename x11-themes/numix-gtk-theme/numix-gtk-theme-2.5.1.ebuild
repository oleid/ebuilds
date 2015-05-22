# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Numix is a modern flat theme with a combination of light and dark elements. It supports Gnome, Unity, XFCE and Openbox"
HOMEPAGE="https://numixproject.org"

SRC_URI="https://github.com/shimmerproject/Numix/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"


RDEPEND="x11-themes/gtk-engines-murrine"

src_unpack() {
	unpack "${A}"
	mv "Numix-master" "${P}"
}

src_install() {
	insinto /usr/share/themes/Numix
	doins -r *
}
