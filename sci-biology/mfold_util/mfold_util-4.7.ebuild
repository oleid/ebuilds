#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: mfold_util-4.0-r1.ebuild 29 2008-12-17 12:05:44Z triobird $
#####################################################

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

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
	dosym sir_graph /usr/bin/sir_graph_ng	
}
