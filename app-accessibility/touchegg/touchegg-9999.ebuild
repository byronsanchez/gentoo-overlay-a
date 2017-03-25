# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 eutils autotools qmake-utils

EGIT_REPO_URI="https://github.com/JoseExposito/touchegg"

DESCRIPTION="Linux multitouch gesture recognizer"
HOMEPAGE="https://github.com/JoseExposito/touchegg"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake PREFIX=/usr
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
	eqmake5
}

