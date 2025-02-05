# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit rpm

DESCRIPTION="CUPS driver for Brother HL2170-W"
HOMEPAGE="http://www.brother-usa.com/printer/modeldetail.aspx?PRODUCTID=HL2170W"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2170W-${PV}-1.i386.rpm"
S="${WORKDIR}/usr/local/Brother/Printer/HL2170W/cupswrapper"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
         >=net-print/lpdfilter-brother-hl2170w-2.0.2"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	sed -n '69,347p;347q' cupswrapperHL2170W-2.0.4 > HL2170W.ppd
	chmod 755 HL2170W.ppd
	mkdir -p "${D}/usr/share/cups/model/"
	cp HL2170W.ppd "${D}/usr/share/cups/model/"
	mkdir -p "${D}/usr/share/ppd"
	cp HL2170W.ppd "${D}/usr/share/ppd"

	sed -n '368,527p;527q' cupswrapperHL2170W-2.0.4 > brlpdwrapperHL2170W
	# Fix unfortunate snafus with \$ and \`
	sed -i 's/\\\$/\$/g' brlpdwrapperHL2170W
	sed -i 's/\\`/`/g' brlpdwrapperHL2170W


	chmod 755 brlpdwrapperHL2170W
	mkdir -p "${D}/usr/lib/cups/filter/"
	cp brlpdwrapperHL2170W "${D}/usr/lib/cups/filter/"
	mkdir -p "${D}/usr/lib64/cups/filter/"
	cp brlpdwrapperHL2170W "${D}/usr/lib64/cups/filter/"

	mkdir -p "${D}/usr/local/Brother/Printer/HL2170W/cupswrapper/"
	cp brcupsconfig4 "${D}/usr/local/Brother/Printer/HL2170W/cupswrapper/brcupsconfig4"
}

pkg_postinst() {
	elog "You may need to run '/etc/init.d/cupsd restart' to use this driver"
}

