Summary:     GNU grep Utilities
Summary(fr): Utilitaires grep de GNU
Summary(pl): GNU grep 
Summary(tr): Dosyalarda katar arama aracý
Name:        grep
Version:     2.2
Release:     3
Copyright:   GPL
Group:       Utilities/Text
Source:      ftp://prep.ai.mit.edu/pub/gnu/%{name}-%{version}.tar.gz
Buildroot:   /tmp/%{name}-%{version}-root

%description
This is the GNU implementation of the popular `grep' *nix
utility.  It allows for the fast locating of strings in text files.

%description -l de
Dies ist die GNU-Implementierung des beliebten *nix-Dienstprogramms
'grep'. Damit können schnell Zeichenketten in Textdateien finden.

%description -l fr
Ceci est l'implémentation par GNU du  populaire l'utilitaire grep 
su *nix. Il permet de localiser rapidement des chaînes de caractéres
dans les fichiers.

%description -l pl 
GNU grep jest implementacj± popularnego programu unixowego `grep'.
Grep jest jednym z podstawowych narzêdzi, korzysta z niego prawie
ka¿dym skrypt shella. 

%description -l tr
Bu, bütün Unix'lerde bulunan ve yaygýn olarak kullanýlan grep aracýnýn GNU
sürümüdür. Metin dosyalarý içinde bulunan katarlarý aramada kullanýlýr.

%prep
%setup -q

%build
CFLAGS=$RPM_OPT_FLAGS ./configure --prefix=/usr --exec-prefix=/
make 
strip src/grep

%install
rm -rf $RPM_BUILD_ROOT
make prefix=$RPM_BUILD_ROOT/usr exec_prefix=$RPM_BUILD_ROOT install
ln -sf /bin/grep $RPM_BUILD_ROOT/bin/fgrep
ln -sf /bin/grep $RPM_BUILD_ROOT/bin/egrep
echo .so grep.1 > $RPM_BUILD_ROOT/usr/man/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT/usr/man/man1/fgrep.1

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644, root, root, 755)
%doc NEWS README ChangeLog
%attr(755, root, root) /bin/*
%attr(644, root,  man) /usr/man/man1/*

%lang(de) /usr/share/locale/de/LC_MESSAGES/grep.mo
%lang(es) /usr/share/locale/es/LC_MESSAGES/grep.mo
%lang(fr) /usr/share/locale/fr/LC_MESSAGES/grep.mo
%lang(ko) /usr/share/locale/ko/LC_MESSAGES/grep.mo
%lang(nl) /usr/share/locale/nl/LC_MESSAGES/grep.mo
%lang(no) /usr/share/locale/no/LC_MESSAGES/grep.mo
%lang(pl) /usr/share/locale/pl/LC_MESSAGES/grep.mo
%lang(ru) /usr/share/locale/ru/LC_MESSAGES/grep.mo
%lang(sl) /usr/share/locale/sl/LC_MESSAGES/grep.mo
%lang(sv) /usr/share/locale/sv/LC_MESSAGES/grep.mo

%changelog
* Tue Oct 06 1998 Wojtek ¦lusarczyk <wojtek@shadow.eu.org>
  [2.2-3]
- added pl translation,
- minor modification of the spec file.

* Sat May 09 1998 Prospector System <bugs@redhat.com>
- translations modified for de, fr, tr

* Fri May 01 1998 Cristian Gafton <gafton@redhat.com>
- updated to 2.2

* Thu Oct 16 1997 Donnie Barnes <djb@redhat.com>
- updated from 2.0 to 2.1
- spec file cleanups
- added BuildRoot

* Mon Jun 02 1997 Erik Troan <ewt@redhat.com>
- built against glibc
