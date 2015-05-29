# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Shows a list of sound output devices (similar to gnome sound settings) in the status menu below the volume slider"
_GIT_NAME="gse-sound-output-device-chooser"
HOMEPAGE="https://github.com/kgshank/$_GIT_NAME"

EGIT_REPO_URI="https://github.com/kgshank/${_GIT_NAME}.git"

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="gnome-base/gnome-shell"


src_install() {
	local ID="sound-output-device-chooser@kgshank.net"
	insinto /usr/share/gnome-shell/extensions/$ID
	doins -r $ID/*
}
