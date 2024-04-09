# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 )
inherit git-2 python-single-r1 waf-utils

DESCRIPTION="The Non Things: Non-DAW, Non-Mixer, Non-Sequencer and Non-Session-Manager"
HOMEPAGE="http://non.tuxfamily.org"
EGIT_REPO_URI="git://git.tuxfamily.org/gitroot/non/non.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"
PYTHON_REQ_USE="threads(+)"

RDEPEND=">=dev-libs/libsigc++-2.2.0
	>=media-libs/liblo-0.26
	>=media-libs/liblrdf-0.1.0
	>=media-sound/jack-audio-connection-kit-0.103.0"
DEPEND="${RDEPEND}
	media-libs/libpng
	virtual/jpeg
	x11-libs/cairo
	x11-libs/libxcb
	x11-libs/libXft
	x11-libs/libXinerama
	x11-libs/libXpm
	x11-libs/ntk
	x11-libs/pixman"

#pkg_setup(){
##	python_set_active_version 2
#	python_pkg_setup
#}

src_configure() {
	local mywafconfargs="--project=session-manager"
	use debug && mywafconfargs+=" --enable-debug"
	waf-utils_src_configure ${mywafconfargs}
}
