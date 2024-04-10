# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#
# Source: https://github.com/shimataro/portage-overlay/tree/master/net-im/caprine

EAPI=8

inherit unpacker gnome2-utils xdg-utils

DESCRIPTION="Elegant Facebook Messenger desktop app"
HOMEPAGE="https://sindresorhus.com/caprine/"
SRC_URI="
	amd64? ( https://github.com/sindresorhus/${PN}/releases/download/v${PV}/${PN}_${PV}_amd64.deb -> ${P}-amd64.deb )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

#	gnome-base/gconf
RDEPEND="
	app-crypt/libsecret
"

S=${WORKDIR}

src_install () {
	dodir /
	cd "${ED}" || die
	unpacker

    # decompress pre-compressed file to make QA check happy
    find "${S}"/usr/share/doc/caprine -name '*.gz' -exec gunzip {} \;
	dodoc -r "${S}"/usr/share/doc/caprine/*
	rm -rf "${ED}"/usr/share/doc/caprine

	dosym -r /opt/Caprine/${PN} /usr/bin/${PN}
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
