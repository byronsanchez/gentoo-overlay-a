#@IgnoreInspection BashAddShebang
# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_P=${PN}-src-${PV}

inherit toolchain-funcs eutils

DESCRIPTION="Simple, high-reliability, source control management, and more"
HOMEPAGE="http://www.fossil-scm.org/"
SRC_URI="http://www.fossil-scm.org/fossil/uv/${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="debug fusefs json legacy-mv-rm miniz sqlite +ssl static tcl th1-docs th1-hooks"

DEPEND="
	sys-libs/zlib
	|| ( sys-libs/readline:0 dev-libs/libedit )
	sqlite? ( dev-db/sqlite:3 )
	ssl? ( dev-libs/openssl:0 )
	tcl? ( dev-lang/tcl:0= )
"
RDEPEND="${DEPEND}"

src_prepare() {
	# I decided to no longer maintain this patch since I don't need to mirror to
	# github or bitbucket anymore with proper author attributes. This may have
	# been fixed upstream in some way (eg. setting author fields in fossil ui?)
	# but I haven't confirmed this.
	#
	# - Byron
	#epatch "${FILESDIR}"/${P}-fix-fossil-export.patch
	eapply_user
}

src_configure() {
	# this is not an autotools situation so don't make it seem like one
	# --with-tcl: works
	# --without-tcl: dies
	local myconf="--with-openssl=$(usex ssl auto none)"
	use debug && myconf+=' --fossil-debug'
	use json   && myconf+=' --json'
	use sqlite && myconf+=' --disable-internal-sqlite'
	use static && myconf+=' --static'
	use tcl    && myconf+=' --with-tcl-stubs'

	local u
	for u in legacy-mv-rm miniz th1-docs th1-hooks; do
		use ${u} &&  myconf+=" --with-${u}"
	done

	use fusefs || myconf+=' --disable-fusefs'

	tc-export CC
	./configure ${myconf} || die
}

src_install() {
	dobin fossil
}
