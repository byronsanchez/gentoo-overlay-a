# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit linux-info git-r3 cmake-utils

DESCRIPTION="An LV2 sampler plugin that (currently) plays hydrogen drum kits"
HOMEPAGE="https://github.com/nicklan/drmr"
EGIT_REPO_URI="git://github.com/nicklan/drmr"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

