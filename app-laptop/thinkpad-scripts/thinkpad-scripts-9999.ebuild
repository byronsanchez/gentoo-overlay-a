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

DEPEND="dev-python/configparser
sys-devel/gettext
dev-python/setuptools
dev-python/sphinx
sys-power/acpi
sys-power/acpid
media-sound/alsa-utils
virtual/udev
x11-apps/xinput
x11-apps/xrandr"
RDEPEND="${DEPEND}"

S="${S}"

src_compile() {
	emake PREFIX=/usr
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install

	### Install the C mods
	./setup.py install --root "${D}" || die "Failed to install thinkpad-scripts"

}

pkg_postinst() {
	udevadm hwdb --update
}


