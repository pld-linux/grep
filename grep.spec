Summary:	GNU grep Utilities
Summary(fr):	Utilitaires grep de GNU
Summary(pl):	GNU grep 
Summary(tr):	Dosyalarda katar arama arac�
Name:		grep
Version:	2.2
Release:	5
Copyright:	GPL
Group:		Utilities/Text
Group(pl):	Narz�dzia/Tekst
Source:		ftp://prep.ai.mit.edu/pub/gnu/%{name}-%{version}.tar.gz
Buildroot:	/tmp/buildroot-%{name}-%{version}-root

%description
This is the GNU implementation of the popular `grep' *nix
utility.  It allows for the fast locating of strings in text files.

%description -l de
Dies ist die GNU-Implementierung des beliebten *nix-Dienstprogramms
'grep'. Damit k�nnen schnell Zeichenketten in Textdateien finden.

%description -l fr
Ceci est l'impl�mentation par GNU du  populaire l'utilitaire grep 
su *nix. Il permet de localiser rapidement des cha�nes de caract�res
dans les fichiers.

%description -l pl 
GNU grep jest implementacj� popularnego programu unixowego `grep'.
Grep jest jednym z podstawowych narz�dzi, korzysta z niego prawie
ka�dym skrypt shella. 

%description -l tr
Bu, b�t�n Unix'lerde bulunan ve yayg�n olarak kullan�lan grep arac�n�n GNU
s�r�m�d�r. Metin dosyalar� i�inde bulunan katarlar� aramada kullan�l�r.

%prep
%setup -q

%build
CFLAGS=$RPM_OPT_FLAGS LDFLAGS="-s" \
./configure \
	--prefix=/usr \
	--exec-prefix=/
make 

%install
rm -rf $RPM_BUILD_ROOT

make \
    prefix=$RPM_BUILD_ROOT/usr \
    exec_prefix=$RPM_BUILD_ROOT \
    install

ln -sf /bin/grep $RPM_BUILD_ROOT/bin/fgrep
ln -sf /bin/grep $RPM_BUILD_ROOT/bin/egrep

echo .so grep.1 > $RPM_BUILD_ROOT/usr/man/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT/usr/man/man1/fgrep.1

gzip -9nf $RPM_BUILD_ROOT/usr/man/man1/*
bzip2 -9 NEWS README ChangeLog

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc {NEWS,README,ChangeLog}.bz2

%attr(755,root,root) /bin/*
%attr(644,root, man) /usr/man/man1/*

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
* Fri Dec 11 1998 Tomasz K�oczko <kloczek@rudy.mif.pg.gda.pl>
  [2.2-4]
- added gzipping man pages,
- added using LDFLAGS="-s" to ./configure enviroment.

* Tue Oct 06 1998 Wojtek �lusarczyk <wojtek@shadow.eu.org>
  [2.2-3]
- added pl translation,
- minor modification of the spec file.
- build against GNU libc-2.1,
- start at invalid RH spec file.
