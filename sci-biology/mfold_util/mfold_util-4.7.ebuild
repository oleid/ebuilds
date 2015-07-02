# Ebuild adapted from:
# https://github.com/lvming/gentoo-overlay/tree/master/sci-biology/mfold_util

inherit eutils

DESCRIPTION="mfold utilities."
HOMEPAGE="http://www.bioinfo.rpi.edu/applications/mfold/"
SRC_URI="http://mfold.rit.albany.edu/download/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
RESTRICT="mirror"

RDEPEND="
	media-libs/freeglut
	virtual/jpeg
	media-libs/libpng
	media-libs/gd
"
DEPEND="${RDEPEND}"

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
	dosym sir_graph /usr/bin/sir_graph_ng
}
