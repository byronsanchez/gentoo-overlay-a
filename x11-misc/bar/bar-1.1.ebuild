# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot toolchain-funcs eutils

DESCRIPTION="Featherweight lemon-scented bar"
HOMEPAGE="https://github.com/LemonBoy/bar"
GIT_COMMIT=ebb625b52932eedf9efb62bd5c20e2d47b38888f
SRC_URI="https://github.com/LemonBoy/bar/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"

src_compile() {
	make all
	make doc
}

src_install() {
	emake DESTDIR="${D}" install
	doman bar.1
}

