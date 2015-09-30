EAPI=5

inherit user

NAME="luxmark"
DESCRIPTION="Open Source Continuous File Synchronization"
HOMEPAGE="http://luxmark.net/"

SRC_URI="
	amd64? ( http://www.luxrender.net/release/luxmark/v${PV}/luxmark-linux64-v${PV}.tar.bz2  )
"

RESTRICT="mirror"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"

IUSE=""

RDEPEND="virtual/opencl"

S="${WORKDIR}/luxmark-v${PV}"

src_install() {
        local INST_ROOT="/opt/${PN}"
        exeinto /usr/bin
        doexe "${FILESDIR}/luxmark"

        exeinto ${INST_ROOT}
        doexe luxmark
	doexe luxmark.bin
	doexe slg4

        # install libs
        cp -R "${S}/lib" "${D}/${INST_ROOT}"

        # copy scenes
        cp -R "${S}/scenes" "${D}/${INST_ROOT}"
}

