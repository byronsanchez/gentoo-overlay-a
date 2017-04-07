# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="An open source cross-platform drum plugin and stand-alone application"
HOMEPAGE="http://www.drumgizmo.org"
SRC_URI="http://www.drumgizmo.org/releases/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT=0
KEYWORDS="~amd64"
IUSE="+gui cli debug +lv2 cpu_flags_x86_sse cpu_flags_x86_sse2 cpu_flags_x86_sse3 +libsamplerate zita"
REQUIRED_USE="^^ ( libsamplerate zita )"

RDEPEND="lv2? ( media-libs/lv2 )
	cli? ( media-libs/libsmf )
	zita? ( media-libs/zita-resampler )
	libsamplerate? ( media-libs/libsamplerate )
	x11-libs/libX11
	>=media-libs/libsndfile-1.0.21
	>=media-libs/libpng-1.2
	dev-libs/expat"
DEPEND="${RDEPEND}"

src_configure() {

	local myconf

	if use libsamplerate ; then
		myconf="${myconf} --enable-resampler=src"
	else
		myconf="${myconf} --enable-resampler=zita"
	fi

	econf 	$(use_enable gui gui x11) \
		$(use_enable lv2) \
		$(use_enable cli) \
		$(use_with debug) \
		$(use_enable cpu_flags_x86_sse sse 1) \
		$(use_enable cpu_flags_x86_sse2 sse 2) \
		$(use_enable cpu_flags_x86_sse3 sse 3) \
		${myconf}
}
