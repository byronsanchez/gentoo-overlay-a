# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
MY_P=${P}-linux

DESCRIPTION="One more PNG-optimizer"
HOMEPAGE="http://www.jonof.id.au/kenutils"
SRC_URI="http://static.jonof.id.au/dl/kenutils/${P}-linux.tar.gz"
RESTRICT="mirror"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=sys-libs/glibc-2.9"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	if use amd64;
	then
		dobin ${WORKDIR}/${P}-linux/x86_64/${PN}
	else
		dobin ${WORKDIR}/${P}-linux/i386/${PN}
	fi

	[[ -d "/usr/share/doc/${PN}" ]] || dodir "/usr/share/${PN}" || die "failed to create USRSHARE"
	insinto "/usr/share/doc/${PN}"
	dodoc ${WORKDIR}/${P}-linux/readme.txt
}
