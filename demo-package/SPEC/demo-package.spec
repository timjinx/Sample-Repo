%define name demo-package
%define version 0.0.1
%define release 1

Summary: Doesn't do much
Name: %{name}
Version: %{version}
Release: %{release}
Source0: %{name}-%{version}.tgz
License: GPL
Group: System Environment/Kernel
BuildRoot: %{_tmppath}/%{name}-%{version}-buildroot
BuildRequires: glibc-devel gcc-c++
BuildArch: x86_64
Url: http://www.oracle.com/
Provides: %{name} = %{version}-%{release}
%define debug_package %{nil}

%description
Does nothing, makes a dummy program called p1

##########################################################################################
# BUILD-TIME SCRIPTS
##########################################################################################

%prep
true "=================================================================================="
true "BEG Build preprocess"
%setup -q

%pre

%build

%install
true "=================================================================================="
true "BEG Installation"

rm -rf %{buildroot}
mkdir -p %{buildroot}
# cd %{buildroot}
mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/%{_mandir}/man9/
install -s -m 755 p1/p1 %{buildroot}/usr/bin/p1
install -s -m 755 p2/p2 %{buildroot}/usr/bin/p2
install -s -m 755 p3/p3 %{buildroot}/usr/bin/p3
cp p1/p1.man  %{buildroot}/%{_mandir}/man9/p1.man
cp p2/p2.man  %{buildroot}/%{_mandir}/man9/p2.man
cp p3/p3.man  %{buildroot}/%{_mandir}/man9/p3.man

%post

%postun

%clean
rm -rf %{buildroot}

%files
%attr(0755,root,root) /usr/bin/p1
%attr(0755,root,root) /usr/bin/p2
%attr(0755,root,root) /usr/bin/p3
%attr(0755,root,root) %{_mandir}/man9/p1.man.gz
%attr(0755,root,root) %{_mandir}/man9/p2.man.gz
%attr(0755,root,root) %{_mandir}/man9/p3.man.gz

%changelog
* Wed Sep 13 2017 Tim Jinkerson <tim.jinkerson@oracle.com>
- initial build of a program that does nothing
