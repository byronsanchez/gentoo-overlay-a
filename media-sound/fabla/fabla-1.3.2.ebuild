# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Fabla is an open-source LV2 drum sampler plugin instrument."
HOMEPAGE="http://openavproductions.com/fabla/"
SRC_URI="https://github.com/openAVproductions/openAV-Fabla/archive/release-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="media-libs/lv2
		media-libs/libsndfile
		x11-libs/ntk
		x11-libs/cairo
		dev-cpp/cairomm"
DEPEND="${RDEPEND}"

DOCS="README.md LICENSE CHANGELOG"

