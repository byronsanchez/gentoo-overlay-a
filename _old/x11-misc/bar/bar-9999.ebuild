# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="bar is a lightweight bar based entirely on XCB."
HOMEPAGE="https://github.com/krypt-n/bar"
EGIT_REPO_URI="git://github.com/krypt-n/bar"
EGIT_BRANCH="xft-port"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"

src_compile() {
	emake STRIP=/bin/true
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}

