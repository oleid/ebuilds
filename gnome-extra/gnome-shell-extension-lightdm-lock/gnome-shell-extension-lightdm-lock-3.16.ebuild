# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Lock GNOME Shell on lightdm"
HOMEPAGE="https://github.com/Antergos/antergos-packages/blob/master/gnome-shell-extension-lockscreen-lightdm"

SRC_URI=""

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="gnome-base/gnome-shell"

src_unpack() {
	mkdir $WORKDIR/$P # otherwise install won't work
}

src_install() {
        insinto /usr/share/gnome-shell/extensions/lockscreen@dev.antergos.com
        doins ${FILESDIR}/extension.js ${FILESDIR}/metadata.json
}
