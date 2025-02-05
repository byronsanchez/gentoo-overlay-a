# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_{5,6,7} pypy{1_9,2_0} )

inherit distutils-r1

DESCRIPTION="Enterprise scalable realtime graphing"
HOMEPAGE="http://graphite.wikidot.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-python/pycairo[${PYTHON_USEDEP}]
dev-python/django[${PYTHON_USEDEP}]
dev-python/django-tagging[${PYTHON_USEDEP}]
dev-python/twisted-core[${PYTHON_USEDEP}]
net-zope/zope-interface[${PYTHON_USEDEP}]
media-libs/fontconfig
dev-python/carbon[${PYTHON_USEDEP}]
"

src_prepare() {
	rm setup.cfg
	distutils-r1_src_prepare
}


