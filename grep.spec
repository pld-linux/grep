Summary:	GNU grep Utilities
Summary(de):	GNU-Version der Pattern-Matching-Utilities
Summary(fr):	Utilitaires grep de GNU
Summary(pl):	GNU grep 
Summary(tr):	Dosyalarda katar arama aracý
Name:		grep
Version:	2.4.1
Release:	1
License:	GPL
Group:		Utilities/Text
Group(fr):	Utilitaires/Texte
Group(pl):	Narzêdzia/Tekst
Source0:	ftp://alpha.gnu.org/gnu/%{name}/%{name}-%{version}.tar.gz
Source1:	grep.1.pl
Patch0:		grep-info.patch
Prereq:		/usr/sbin/fix-info-dir
Buildroot:	/tmp/%{name}-%{version}-root

%define		_bindir		/bin
%define		_exec_prefix	/

%description
The GNU versions of commonly used grep utilities.  Grep searches one or
more input files for lines which contain a match to a specified pattern and
then prints the matching lines. GNU's grep utilities include grep, egrep
and fgrep.

%description -l de
Die GNU-Versionen der häufig benutzten grep-Utilities. Grep durchsucht eine
oder mehrere Eingabedateien nach Zeilen, die auf ein angegebenes Muster
passen, und zeigt dann die entsprechenden Zeilen an. GNUs grep enthält
grep, egrep und fgrep.

%description -l fr
Ceci est l'implémentation par GNU du  populaire l'utilitaire grep su *nix.
Il permet de localiser rapidement des chaînes de caractéres dans les
fichiers.

%description -l pl 
GNU grep jest implementacj± popularnego programu unixowego `grep'. Grep
jest jednym z podstawowych narzêdzi, korzysta z niego prawie ka¿dy skrypt
shella.

%description -l tr
Bu, bütün Unix'lerde bulunan ve yaygýn olarak kullanýlan grep aracýnýn GNU
sürümüdür. Metin dosyalarý içinde bulunan katarlarý aramada kullanýlýr.

%prep
%setup  -q
%patch0 -p1

%build
gettextize --force --copy
autoconf

%ifarch sparc sparc64
CPPFLAGS=""
export CPPFLAGS
%endif
LDFLAGS="-s"; export LDFLAGS
%configure

make

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_mandir}/pl/man1

make install DESTDIR=$RPM_BUILD_ROOT

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/grep.1

echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/fgrep.1

echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/pl/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/pl/man1/fgrep.1

gzip -9nf $RPM_BUILD_ROOT{%{_infodir}/*info*,%{_mandir}/{man1/*,pl/man1/*}} \
	NEWS README ChangeLog TODO

%find_lang %{name}

%clean
rm -rf $RPM_BUILD_ROOT

%post
%{_sbindir}/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%postun
%{_sbindir}/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc {NEWS,README,ChangeLog,TODO}.gz

%attr(755,root,root) %{_bindir}/*
%{_mandir}/man1/*
%lang(pl) %{_mandir}/pl/man1/*
%{_infodir}/*info*
