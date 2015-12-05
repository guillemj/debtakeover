Name: debtakeover
Summary: Convert a running system to Debian
Version: 0.8
Release: 1
License: GPL
Group: System Environment/Base
Packager: Guillem Jover <guillem@debian.org>
Vendor: Hadrons.org
URL: https://www.hadrons.org/~guillem/debian/debtakeover
Source: %{name}-%{version}.tgz
Requires: debootstrap, binutils, wget, gzip, xz, bzip2
Provides: debian
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-root

%description
The debtakeover package will allow you to purify your RPM based
distribution, and convert it to Debian.

%prep
%setup -q

%install
mkdir -p $RPM_BUILD_ROOT/root/%{name}
install -m644 * $RPM_BUILD_ROOT/root/%{name}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%attr(755,root,root) /root/%{name}/%{name}
%defattr(-,root,root)
/root/%{name}/*

%changelog
* Sun Nov 15 2015 Guillem Jover <guillem@debian.org>
- Add xz to Requires.

* Wed Apr 27 2005 Guillem Jover <guillem@debian.org>
- Initial spec file.
