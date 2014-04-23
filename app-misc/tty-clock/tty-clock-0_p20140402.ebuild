# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot toolchain-funcs eutils

DESCRIPTION="analog clock in ncurses"
HOMEPAGE="https://github.com/xorg62/tty-clock"
GIT_COMMIT=4e6b4cae8aad23bd52ab17134ea32ef5619fcfb0
SRC_URI="https://github.com/xorg62/tty-clock/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	tc-export CC
}

src_install() {
	emake \
		DESTDIR="${D}" \
		install
	dodoc README
}
