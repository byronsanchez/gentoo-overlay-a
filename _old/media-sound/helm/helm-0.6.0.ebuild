# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils

DESCRIPTION="Open source polyphonic software synthesizer with lots of modulation"
HOMEPAGE="http://tytel.org/helm/"
SRC_URI="https://github.com/mtytel/helm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/alsa-lib
	media-libs/lv2
	virtual/jack
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXext"
DEPEND="${RDEPEND}"

DOCS="README.md"

src_prepare() {
	sed -e 's|/usr/lib/|/usr/'$(get_libdir)'/|' -i Makefile || die
	epatch_user
}

src_compile() {
	emake PREFIX=/usr all
}

src_install() {
	addwrite /usr/share/helm
	dodir /usr/share/helm
	dodir /usr/share/helm/icons
	dodir /usr/share/helm/patches
	default
	make_desktop_entry /usr/bin/helm Helm /usr/share/helm/icons/helm_icon_32_1x.png
}
