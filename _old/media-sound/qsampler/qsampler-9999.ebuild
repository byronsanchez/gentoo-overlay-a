# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/qsampler/qsampler-0.2.2.ebuild,v 1.1 2009/12/04 19:01:06 aballier Exp $

EAPI=4
inherit autotools eutils qt4-r2 subversion autotools-utils

DESCRIPTION="A graphical frontend to the LinuxSampler engine"
HOMEPAGE="http://qsampler.sourceforge.net"
ESVN_REPO_URI="https://svn.linuxsampler.org/svn/qsampler/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug +libgig qt5"

DEPEND="media-libs/alsa-lib
	>=media-libs/liblscp-0.5.5
	x11-libs/libX11
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	libgig? ( >=media-libs/libgig-3.2.1 )
	!qt5? (
		dev-qt/qtcore:4
		dev-qt/qtgui:4
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtxml:5
	)"
RDEPEND="${DEPEND}
	>=media-sound/linuxsampler-0.5"



src_prepare() {
	eautoreconf
}

src_configure() {
	if ! use qt5; then
		export QT_SELECT=4
	else
		export QT_SELECT=5
	fi

	local myeconfargs=(
		$(use_enable debug)
		$(use_enable !qt5 qt4)
		$(use_enable qt5)
		$(use_enable libgig)
	)

	autotools-utils_src_configure
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog README TODO
	doman debian/${PN}.1
}
