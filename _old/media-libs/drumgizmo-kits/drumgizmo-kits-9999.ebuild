# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# NOTE: I wrote this ebuild for convenience. As far as I know, drumgizmo does 
# not "hook into" the installation path for this ebuild. I just install it there 
# arbitrarily and select drumkits manually from that location in the drumgizmo 
# ui interface.
#
# - Byron

DESCRIPTION="free drumkits for drumgizmo"
HOMEPAGE="http://www.drumgizmo.org/wiki/doku.php?id=kits"
SRC_URI="
		http://downloads.muldjord.com/DRSKit2_0_1.zip
		http://downloads.muldjord.com/MuldjordKit2.zip
		http://www.drumgizmo.org/kits/aasimonster-2.0.zip
		http://www.drumgizmo.org/kits/ShittyKit.zip
		http://www.drumgizmo.org/kits/sommerhack-kit.zip
	 "

# Each kit has it's own CC license; please look at the homepage for more details
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND=">=media-sound/drumgizmo-0.9.5"

S="${WORKDIR}"

src_unpack(){
    mkdir "${S}"/extract
	cp "${DISTDIR}"/*.zip "${S}"/extract

	for f in "${S}"/extract/*.zip;
	do
		unzip "${f}" -d "${S}"/extract
	done

	rm "${S}"/extract/*.zip
}

src_compile(){
	einfo "nothing to compile"
}

src_install(){
	insinto  /usr/share/drumgizmo/drumkits/
	doins -r extract/*
}
