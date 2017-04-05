# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="LFO-driven, midi-mangling arpeggiator"
HOMEPAGE="http://www.mucoder.net/en/hypercyclic"
SRC_URI="http://www.mucoder.net/en/hypercyclic/v0105/download/544/hypercyclic-1.5.544-linux-64bit.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND=""

S="${WORKDIR}"

src_compile(){
	einfo "nothing to compile"
}

src_install(){
	insinto  /usr/lib/lxvst
	doins -r *.so

	dobin hypercyclic
}

