# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 )
inherit flag-o-matic git-2 python-single-r1 waf-utils

DESCRIPTION="The Non Things: Non-DAW, Non-Mixer, Non-Sequencer and Non-Session-Manager"
HOMEPAGE="http://non.tuxfamily.org"
EGIT_REPO_URI="git://git.tuxfamily.org/gitroot/non/non.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="-debug"
PYTHON_REQ_USE="threads(+)"

RDEPEND=">=media-sound/jack-audio-connection-kit-0.103.0
	>=media-libs/liblrdf-0.1.0
	>=media-libs/liblo-0.26
	>=dev-libs/libsigc++-2.2.0
	media-sound/non-session-manager
	"
DEPEND="${RDEPEND}
	x11-libs/ntk
	x11-libs/cairo
	x11-libs/libXft
	media-libs/libpng
	x11-libs/pixman
	x11-libs/libXpm
	virtual/jpeg
	x11-libs/libXinerama
	x11-libs/libxcb
"

src_configure() {
	append-cflags " -std=gnu++11"
	append-cxxflags " -std=gnu++11"
	if use debug
		then waf-utils_src_configure --project=sequencer --enable-debug
		else waf-utils_src_configure --prefix=/usr --project=sequencer
	fi
}

src_compile() {
	waf-utils_src_compile
}

src_install() {
	waf-utils_src_install
}
