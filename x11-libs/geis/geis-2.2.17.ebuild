# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit base autotools

DESCRIPTION="An implementation of the GEIS (Gesture Engine Interface and Support) interface."
SRC_URI="http://launchpad.net/geis/trunk/${PV}/+download/geis-${PV}.tar.xz"
HOMEPAGE="https://launchpad.net/geis"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-2 LGPL-3"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	x11-libs/grail"

src_prepare() {
	sed -i 's/python >= 2.7/python-2.7 >= 2.7/g' configure;
	chmod +x ./autogen.sh
	./autogen.sh
}
