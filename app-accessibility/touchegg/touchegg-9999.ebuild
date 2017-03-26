# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 eutils autotools qmake-utils qt4-r2

EGIT_REPO_URI="https://github.com/JoseExposito/touchegg"

DESCRIPTION="Linux multitouch gesture recognizer"
HOMEPAGE="https://github.com/JoseExposito/touchegg"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-accessibility/geis
x11-libs/libXext
x11-libs/libXtst
x11-libs/libX11
dev-qt/qtcore:4
dev-qt/qtgui:4
x11-libs/utouch-geis"
RDEPEND="${DEPEND}"

src_compile() {
	eqmake4
	emake PREFIX=/usr
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
}

