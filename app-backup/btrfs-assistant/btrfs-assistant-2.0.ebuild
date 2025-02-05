#Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# Source: https://github.com/microcai/gentoo-zh/tree/master/app-backup/btrfs-assistant

EAPI=8

inherit xdg cmake optfeature

SRC_URI="https://gitlab.com/btrfs-assistant/btrfs-assistant/-/archive/${PV}/${P}.tar.bz2"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="A GUI management tool to make managing a Btrfs filesystem easier."
HOMEPAGE="https://gitlab.com/btrfs-assistant/btrfs-assistant"

LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

DEPEND="
	dev-qt/qtbase:6
	dev-qt/qtsvg:6
	dev-qt/qttools:6[linguist]
"
BDEPEND="${DEPEND}"
RDEPEND="
	media-fonts/noto
	sys-auth/polkit
	sys-fs/btrfs-progs
	${DEPEND}
"

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "auto snapshot" app-backup/snapper
	optfeature "auto balance and defrag" sys-fs/btrfsmaintenance
}
