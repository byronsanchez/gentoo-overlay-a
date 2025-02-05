# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

if [[ "${PV}" = "9999" ]]; then
	inherit git-r3
	AUTOTOOLS_AUTORECONF="1"
fi
inherit fdo-mime qmake-utils autotools-utils

DESCRIPTION="An old-school all-digital drum-kit sampler synthesizer with stereo fx"
HOMEPAGE="http://drumkv1.sourceforge.net/"

RESTRICT="mirror"

if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="git://git.code.sf.net/p/${PN}/code"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~ppc ~x86"
fi

IUSE="alsa debug jack jackmidi jacksession lv2 nsm osc qt5"
REQUIRED_USE="
	|| ( jack lv2 )
	jack? ( || ( alsa jackmidi ) )
	jackmidi? ( jack )
	jacksession? ( jack )"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	media-libs/libsndfile
	alsa? ( media-libs/alsa-lib )
	jack? ( media-sound/jack-audio-connection-kit )
	lv2? ( media-libs/lv2 )
	osc? ( media-libs/liblo )
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
DEPEND="${RDEPEND}"

AUTOTOOLS_IN_SOURCE_BUILD="1"

myqmake() {
	if ! use qt5; then
		eqmake4 "${@}"
	else
		eqmake5 "${@}"
	fi
}

src_configure() {
	use jack && myqmake "${PN}_jack.pro" -o "${PN}_jack.mak"
	if use lv2; then
		myqmake "${PN}_lv2.pro" -o "${PN}_lv2.mak"
	fi

	if ! use qt5; then
		export QT_SELECT=4
	else
		export QT_SELECT=5
	fi

	local myeconfargs=(
		$(use_enable alsa alsa-midi)
		$(use_enable debug)
		$(use_enable jack)
		$(use_enable jackmidi jack-midi)
		$(use_enable jacksession jack-session)
		$(use_enable lv2)
		$(use_enable osc liblo)
		$(use_enable nsm)
		$(use_enable !qt5 qt4)
		$(use_enable qt5)
	)

	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install INSTALL_ROOT="${D}"
}

pkg_postinst() {
	fdo-mime_mime_database_update
}

pkg_postrm() {
	fdo-mime_mime_database_update
}
