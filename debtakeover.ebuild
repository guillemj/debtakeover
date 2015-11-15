# Copyright 2008 Guillem Jover <guillem@debian.org>
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Convert a running system to Debian"
HOMEPAGE="http://www.hadrons.org/~guillem/debian/debtakeover/"
SRC_URI="http://www.hadrons.org/~guillem/debian/debtakeover/${PN}-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 ppc-macos ppc-od \
	  s390 sh sparc x86 x86-fbsd x86-obsd x86-od"

RDEPEND="dev-util/debootstrap
	 sys-devel/binutils
	 net-misc/wget
	 app-arch/bzip2"

src_unpack()
{
  unpack ${P}.tgz
}

src_install()
{
  dodir "/root/${P}"
  cp * "${D}/root/${P}/" || die "cp failed"
}
