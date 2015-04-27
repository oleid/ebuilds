# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_4 )

inherit distutils-r1

DESCRIPTION="Quantum Toolbox in Python"
HOMEPAGE="http://qutip.org"
SRC_URI="http://qutip.org/downloads/${PV}/${P}.tar.gz"

LICENSE="AURA"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}] 
	sci-libs/scipy
	dev-python/matplotlib
	dev-python/cython
	"

python_test() {
	"${PYTHON}" -c " from qutip import *" || die
}
