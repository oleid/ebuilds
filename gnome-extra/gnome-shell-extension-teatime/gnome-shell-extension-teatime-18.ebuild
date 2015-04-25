# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Tea steeping timer for GNOME Shell."
HOMEPAGE="https://github.com/oleid/teatime"

SRC_URI="https://extensions.gnome.org/review/download/4734.shell-extension.zip -> ${P}.zip"

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="app-arch/unzip"
RDEPEND="gnome-base/gnome-shell"

src_unpack() {
        mkdir "${P}" || die
        cd "${P}" && unpack "${A}"
}

src_install() {
	insinto /usr/share/gnome-shell/extensions/TeaTime@oleid.mescharet.de
	doins -r *
}
