# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit waf-utils python-single-r1

MY_P=triceratops-lv2-v${PV}
DESCRIPTION="Triceratops is a polyphonic subtractive synthesizer plugin for use with the LV2 architecture"
HOMEPAGE="http://sourceforge.net/projects/triceratops/"
SRC_URI="mirror://sourceforge/triceratops/${MY_P}.tar.gz"

S=${WORKDIR}/${MY_P}

LICENSE="CCPL-Attribution-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/lv2"
DEPEND="${RDEPEND}
	>=dev-cpp/gtkmm-2.24"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_install() {
	waf-utils_src_install
	dodoc README
}
