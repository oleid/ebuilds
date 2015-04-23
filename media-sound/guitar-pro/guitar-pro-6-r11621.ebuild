# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils
RESTRICT="mirror strip"


DESCRIPTION="Guitar Pro 6"
HOMEPAGE="http://guitar-pro.com"
SRC_URI=""
LICENSE="GuitarPro"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+soundbanks doc system-qt"


MY_GP=opt/GuitarPro6
MY_SB=Banks-r370.gpbank

QA_TEXTRELS="$MY_GP/*"
QA_PRESTRIPPED="$MY_GP/*"
QA_WX_LOAD="$MY_GP/*"

SRC_URI="
	http://download3.guitar-pro.com/0f2e6ccfe2293cee1d8299027dfd5812/5538023e/gp$PV/gp$PV-full-linux-$PR.deb
	soundbanks? ( http://download3.guitar-pro.com/4eca2d7bd63ca87557e6dcb5615b8d55/5538025f/gp$PV/$MY_SB )
	doc? ( http://download3.guitar-pro.com/9ea44addbe11595b137aa931e2a33cb2/5538029f/gp$PV/GP$PV%20Users%20Manual%20EN.pdf )"

RDEPEND="
        x11-libs/gksu
        dev-libs/libxml2[abi_x86_32]
        dev-libs/openssl:0.9.8[abi_x86_32]
        media-libs/portaudio[abi_x86_32]
        media-sound/pulseaudio[abi_x86_32,caps]
        system-qt? (
            dev-qt/qtcore:4[abi_x86_32]
		    dev-qt/qtgui:4[abi_x86_32]
            dev-qt/qtsvg:4[abi_x86_32]
            dev-qt/qtopengl:4[abi_x86_32]
            dev-qt/qtwebkit:4[abi_x86_32]
            dev-qt/qtxmlpatterns:4[abi_x86_32]
        )
        amd64? (
            >=sys-devel/gcc-4.6.0[multilib]
            >=sys-libs/glibc-2.15[multilib]
        )
        "

DEPEND="sys-devel/binutils"

src_unpack() {
    unpack "gp$PV-full-linux-$PR.deb" || die
    mkdir guitar-pro-$PV
    cd guitar-pro-$PV
    unpack ./../data.tar.gz || die
}

src_install() {
    exeinto /$MY_GP
    for fn in GPBankInstaller GPInstaller GPUpdater GPConverter GuitarPro launcher.sh; do
        doexe $MY_GP/$fn
    done

    # remove unwanted libraries
    use system-qt && rm $MY_GP/libQt*
    rm $MY_GP/libxml2*

    for fn in \
        usr/share/pixmaps/guitarpro6.png \
        $MY_GP/lib*.so* \
        $MY_GP/Presets ; do
        insinto /$(dirname "$fn")
        [ -f $fn ] && doins "./$fn" || doins -r "./$fn"
    done

    make_desktop_entry "/$MY_GP/launcher.sh" "Guitar Pro $PV" guitarpro6.png AudioVideo

    # this works only with an working X11 connection
    einfo "Trying to run graphical (ugs) sound bank installer..."
    use soundbanks &&  $MY_GP/GPBankInstaller --silent $DISTDIR/Banks-r370.gpbank $D/$MY_GP
    use doc && cp  "$DISTDIR/GP$PV%20Users%20Manual%20EN.pdf" "$D/$MY_GP/GP$PV Users Manual EN.pdf"
}

pkg_postinst() {
    if use soundbanks ; then
        elog "If the sound bank installation didn't work due to missing X11 connection"
        elog "Please run the following command with root rights:"
        elog
        elog "/opt/GuitarPro6/GPBankInstaller $DISTDIR/$MY_SB /$MY_GP"
        elog
    fi
    use doc && elog "The manual is located in /$MY_GP" && elog
    elog "If Guitar Pro doesn't pick up your GTK+ theme, export GTK2_RC_FILES=\"\$HOME/.gtkrc-2.0\""
}

