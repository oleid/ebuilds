# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="simple lto plugin wrappers for nm, ar and ranlib"
HOMEPAGE="https://github.com/oleid/ebuilds/blob/master/sys-devel/ltowrapper"

SRC_URI=""

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="sys-devel/gcc"

src_unpack() {
	mkdir $WORKDIR/$P # otherwise install won't work
}

src_install() {
        exeinto /usr/local/bin/
        doexe ${FILESDIR}/*
}
