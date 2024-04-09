# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $ bspwm-9999

EAPI=5

inherit bash-completion-r1 flag-o-matic git-2 toolchain-funcs

DESCRIPTION="Small X utility to perform elementary actions on windows"
HOMEPAGE="https://github.com/baskerville/xdo"
SRC_URI=""
EGIT_REPO_URI="git://github.com/baskerville/xdo.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/libxcb
	x11-libs/xcb-util-wm"
RDEPEND="${DEPEND}"

src_compile() {
	emake CC="$(tc-getCC)" PREFIX=/usr
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
}

