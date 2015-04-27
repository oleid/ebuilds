# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Zoom gnome-shell using Alt+Wheel"
HOMEPAGE="https://github.com/tobiasquinn/gnome-shell-mousewheel-zoom/tree/precise-gsettings"

SRC_URI="${P}.tar.gz"

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="gnome-base/gnome-shell"

src_unpack() {
        mkdir "${P}" || die
        cd "${P}" && unpack "${A}"
}

src_install() {
	cd gnome-shell-mousewheel-zoom
	dobin mousewheelzoom.py
        insinto /usr/share/applications
	doins mousewheelzoom.py.desktop
}
