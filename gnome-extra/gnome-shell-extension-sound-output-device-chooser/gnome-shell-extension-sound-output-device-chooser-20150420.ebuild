# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Shows a list of sound output devices (similar to gnome sound settings) in the status menu below the volume slider"
_GIT_NAME="gse-sound-output-device-chooser"
HOMEPAGE="https://github.com/kgshank/$_GIT_NAME"
SRC_URI="https://github.com/kgshank/$_GIT_NAME/archive/master.zip -> ${P}.zip"


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
	cd "${_GIT_NAME}-master" || die
	insinto /usr/share/gnome-shell/extensions/sound-output-device-chooser@kgshank.net
	doins -r *
}
