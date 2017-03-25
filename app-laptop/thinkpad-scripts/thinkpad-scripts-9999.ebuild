# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{3_4,3_5} )

inherit distutils-r1 git-r3

DESCRIPTION="Screen rotation, docking and other scripts for ThinkPad® X220 and X230 Tablet"
HOMEPAGE="http://martin-ueding.de/en/projects/thinkpad-scripts/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/martin-ueding/thinkpad-scripts"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

S="${S}"

src_compile() {
	emake PREFIX=/usr
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
	make_session_desktop bspwm /usr/bin/bspwm

	dodoc COPYING.rst README.rst CHANGELOG.rst

	local libdir=$(get_libdir)

	"${PYTHON}" setup.py install \
			--root="${D}" \
			--prefix="${EPREFIX}/usr" \
			--libdir="${EPREFIX}/usr/${libdir}" \
			--staging-root="${ED}usr" \
			--staging-libdir="${ED}usr/${libdir}" || die

}

