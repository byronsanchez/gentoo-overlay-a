# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="DrumGizmo is an open source, multichannel, multilayered, cross-platform drum plugin and stand-alone application"
HOMEPAGE="http://www.drumgizmo.org"
SRC_URI="http://www.${PN}.org/releases/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="alsa jack jackmidi wav smf lv2 -vst -samplerate zita-resampler -opengl"

REQUIRED_USE="?? ( samplerate zita-resampler )
              jackmidi? ( jack )"

RDEPEND="lv2? ( media-libs/lv2 )
		jack? ( media-sound/jack-audio-connection-kit )
		samplerate? ( media-libs/libsamplerate )
		zita-resampler? ( media-libs/zita-resampler )
		wav? ( media-libs/libsndfile )
		alsa? ( media-libs/alsa-lib )
		smf? ( media-libs/libsmf )
		vst? ( >=media-libs/vst-sdk-2.4 )
		opengl? ( media-libs/pugl )
		x11-libs/libX11
		dev-libs/expat
		media-libs/libpng"
DEPEND="${RDEPEND}
		virtual/pkgconfig"

DOCS="README COPYING AUTHORS ChangeLog"

src_configure() {
	econf \
	$(use_enable lv2) \
	$(use_enable vst) \
	$(usex samplerate --enable-resampler=src) \
	$(usex zita-resampler --enable-resampler=zita) \
	$(use_enable alsa output-alsa) \
	$(use_enable jack output-jackaudio) \
	$(use_enable jackmidi input-jackmidi) \
	$(use_enable wav output-wavfile) \
	$(use_enable smf input-midifile) \
	$(usex opengl --enable-gui=pugl --enable-gui=x11) \
	--disable-sse
}
