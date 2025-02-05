# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="A simple scriptable popup dialog to run on X."
HOMEPAGE="https://github.com/emgram769/lighthouse"
SRC_URI=""
EGIT_REPO_URI="https://github.com/emgram769/lighthouse.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/libX11
x11-libs/libxcb
x11-libs/cairo"
RDEPEND="${DEPEND}"

src_install() {
	dobin lighthouse
	dodoc README.md config/lighthouse/{lighthouserc,cmd.py}
}

pkg_postinst() {
	echo
	elog "Example configuration files have been installed at"
	elog "${ROOT}usr/share/doc/${PF}"
	elog "${P} uses ~/.config/lighthouse/lighthouserc"
	elog "as user configuration file."
	echo
}

