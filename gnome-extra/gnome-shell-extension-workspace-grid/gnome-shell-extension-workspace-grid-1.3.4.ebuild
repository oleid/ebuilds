# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="configure your workspaces in a grid for GNOME Shell."
HOMEPAGE="https://github.com/workspace-grid-gnome-shell-extension"

SRC_URI="https://github.com/zakkak/workspace-grid-gnome-shell-extension/releases/download/v${PV}/workspace-grid-for-3.16.zip -> ${P}.zip"

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="app-arch/unzip"
RDEPEND="gnome-base/gnome-shell"

RESTRICT="mirror"

src_unpack() {
        mkdir "${P}" || die
        cd "${P}" && unpack "${A}"
}

src_compile() {
    cd "workspace-grid-gnome-shell-extension-${PV}"
    if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
        emake || die "emake failed"
    fi
}

src_install() {
        cd "workspace-grid-gnome-shell-extension-${PV}"
	insinto /usr/share/gnome-shell/extensions/
	doins -r "workspace-grid@mathematical.coffee.gmail.com"
}
