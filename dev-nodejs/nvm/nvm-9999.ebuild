# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Node Version Manager"
HOMEPAGE="https://github.com/creationix/nvm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
inherit git-2

DEPEND=""
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://github.com/creationix/${PN}.git"
EGIT_BRANCH="master"

src_prepare() {
	if [ -d "$NVM_TARGET" ]; then
		die "nvm is already installed in $NVM_TARGET"
	fi

}

