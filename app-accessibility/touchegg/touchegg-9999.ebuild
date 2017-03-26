# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit bash-completion-r1 flag-o-matic git-2 toolchain-funcs qmake-utils

DESCRIPTION="Linux multitouch gesture recognizer"
HOMEPAGE="https://github.com/JoseExposito/touchegg"
SRC_URI=""
EGIT_REPO_URI="git://github.com/JoseExposito/touchegg.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="x11-libs/libXext
x11-libs/libXtst
x11-libs/libX11
dev-qt/qtcore:4
dev-qt/qtgui:4
x11-libs/geis"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_compile() {
	eqmake4
	emake PREFIX="${D}/usr"
}

src_install() {
	emake PREFIX="${D}/usr" DESTDIR="${D}" INSTALL_ROOT="${D}" install
}

