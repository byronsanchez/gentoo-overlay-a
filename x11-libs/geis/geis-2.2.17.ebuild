# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{3_4,3_5} )

#inherit distutils-r1

DESCRIPTION="An implementation of the GEIS (Gesture Engine Interface and Support) interface."
HOMEPAGE="https://launchpad.net/geis"
SRC_URI="http://launchpad.net/geis/trunk/${PV}/+download/geis-${PV}.tar.xz"

KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-2 LGPL-3"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	x11-libs/grail"

src_prepare() {
	default
	sed -i 's/python3 >= 3.2/python-3.4 >= 3.2/g' configure;
}

