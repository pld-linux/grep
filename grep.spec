Summary:	GNU grep Utilities
Summary(fr):	Utilitaires grep de GNU
Summary(pl):	GNU grep 
Summary(tr):	Dosyalarda katar arama aracý
Name:		grep
Version:	2.3
Release:	5
Copyright:	GPL
Group:		Utilities/Text
Group(pl):	Narzêdzia/Tekst
Source0:	ftp://prep.ai.mit.edu/pub/gnu/%{name}-%{version}.tar.gz
Source1:	grep.1.pl
Patch0:		grep-info.patch
Prereq:		/sbin/install-info
Buildroot:	/tmp/%{name}-%{version}-root

%description

This is the GNU implementation of the popular `grep' *nix utility. It
allows for the fast locating of strings in text files.

%description -l de
Dies ist die GNU-Implementierung des beliebten *nix-Dienstprogramms 'grep'.
Damit können schnell Zeichenketten in Textdateien finden.

%description -l fr
Ceci est l'implémentation par GNU du  populaire l'utilitaire grep su *nix.
Il permet de localiser rapidement des chaînes de caractéres dans les
fichiers.

%description -l pl 
GNU grep jest implementacj± popularnego programu unixowego `grep'. Grep jest
jednym z podstawowych narzêdzi, korzysta z niego prawie ka¿dy skrypt shella.

%description -l tr
Bu, bütün Unix'lerde bulunan ve yaygýn olarak kullanýlan grep aracýnýn GNU
sürümüdür. Metin dosyalarý içinde bulunan katarlarý aramada kullanýlýr.

%prep
%setup  -q
%patch0 -p1

%build
autoconf && %configure
#%configure \
#	--prefix=%{_prefix} \
#	--exec-prefix=/
make

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_mandir}/pl/man1

make \
    bindir=$RPM_BUILD_ROOT/bin \
    infodir=$RPM_BUILD_ROOT%{_infodir} \
    mandir=$RPM_BUILD_ROOT%{_mandir} \
    prefix=$RPM_BUILD_ROOT%{_prefix} \
    install install-strip

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/grep.1

echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/fgrep.1

echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/pl/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/pl/man1/fgrep.1

gzip -9nf $RPM_BUILD_ROOT{%{_infodir}/*info*,%{_mandir}/{man1/*,pl/man1/*}} \
	NEWS README ChangeLog TODO

%find_lang grep

%clean
rm -rf $RPM_BUILD_ROOT

%post
/sbin/install-info %{_infodir}/grep.info.gz /etc/info-dir

%preun
if [ "$1" = "0" ]; then
	/sbin/install-info --delete %{_infodir}/grep.info.gz /etc/info-dir
fi

%files -f grep.lang
%defattr(644,root,root,755)
%doc {NEWS,README,ChangeLog,TODO}.gz

%attr(755,root,root) /bin/*
%{_mandir}/man1/*
%lang(pl) %{_mandir}/pl/man1/*
%{_infodir}/*info*

%changelog
* Fri May 21 1999 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [2.3-4]
- added more macros.

* Wed Apr 28 1999 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [2.3-3]
- added el .mo file,
- added pl man page for grep,
- added info pages for grep.

* Tue Apr 27 1999 Piotr Czerwiñski <pius@pld.org.pl>
  [2.2-6]
- changed Buildroot to /tmp/%%{name}-%%{version}-root,
- gzipping documentation,
- removed man group from man pages,
- replacements in %files,
- minor changes,
- recompiled on rpm 3.

* Fri Dec 11 1998 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [2.2-4]
- added gzipping man pages,
- added using LDFLAGS="-s" to ./configure enviroment.

* Tue Oct 06 1998 Wojtek ¦lusarczyk <wojtek@shadow.eu.org>
  [2.2-3]
- added pl translation,
- minor modification of the spec file.
- build against GNU libc-2.1,
- start at RH spec file.
