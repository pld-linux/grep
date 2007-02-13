#
# Conditional build:
%bcond_with	pcre	# with PCRE support
#
Summary:	GNU grep Utilities
Summary(de.UTF-8):	GNU-Version der Pattern-Matching-Utilities
Summary(es.UTF-8):	Utilitarios grep GNU
Summary(fr.UTF-8):	Utilitaires grep de GNU
Summary(ja.UTF-8):	GNU grep の日本語対応版です.
Summary(pl.UTF-8):	GNU grep
Summary(pt_BR.UTF-8):	Utilitários grep GNU
Summary(ru.UTF-8):	Утилиты поиска по шаблонам GNU grep
Summary(tr.UTF-8):	Dosyalarda katar arama aracı
Summary(uk.UTF-8):	Утиліти пошуку по шаблонам GNU grep
Name:		grep
Version:	2.5.1a
Release:	2
Epoch:		2
License:	GPL
Group:		Applications/Text
Source0:	ftp://ftp.gnu.org/gnu/grep/%{name}-%{version}.tar.gz
# Source0-md5:	71db1cb262c27f02461c4bca514591ce
Source1:	http://www.mif.pg.gda.pl/homepages/ankry/man-PLD/%{name}-non-english-man-pages.tar.bz2
# Source1-md5:	1b5e726d0bee53e898531de4a76ad290
Patch0:		%{name}-info.patch
Patch1:		%{name}-egrep.patch
Patch2:		%{name}-locale-names.patch
URL:		http://www.gnu.org/software/grep/grep.html
BuildRequires:	autoconf
BuildRequires:	automake
BuildRequires:	gettext-devel
BuildRequires:	libtool
%{?with_pcre:BuildRequires:	pcre-devel}
BuildRequires:	texinfo
%{?with_pcre:Requires:	pcre}
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_bindir		/bin
%define		_exec_prefix	/

%description
The GNU versions of commonly used grep utilities. Grep searches one or
more input files for lines which contain a match to a specified
pattern and then prints the matching lines. GNU's grep utilities
include grep, egrep and fgrep.

%description -l de.UTF-8
Die GNU-Versionen der häufig benutzten grep-Utilities. Grep durchsucht
eine oder mehrere Eingabedateien nach Zeilen, die auf ein angegebenes
Muster passen, und zeigt dann die entsprechenden Zeilen an. GNUs grep
enthält grep, egrep und fgrep.

%description -l es.UTF-8
Esta es la implementación GNU del popular utilitario grep. Permite la
localización rápida de strings en archivos texto.

%description -l fr.UTF-8
Ceci est l'implémentation par GNU du populaire l'utilitaire grep su
Unix. Il permet de localiser rapidement des chaînes de caractéres dans
les fichiers.

%description -l ja.UTF-8
GNU プロジェクトによる grep, egrep, fgrep (以下単に grep) をマルチバ
イトパッチ(mb1.04)によって日本語対応にしたものです.

%description -l pl.UTF-8
GNU grep jest implementacją popularnego programu uniksowego `grep'.
Grep jest jednym z podstawowych narzędzi, korzysta z niego prawie
każdy skrypt shella.

%description -l pt_BR.UTF-8
Esta é a implementação GNU do popular utilitário grep. Permite a
localização rápida de strings em arquivos texto.

%description -l ru.UTF-8
Это реализация GNU утилиты grep, предназначенной для быстрого поиска
по образцу в текстовых файлах.

%description -l tr.UTF-8
Bu, bütün Unix'lerde bulunan ve yaygın olarak kullanılan grep aracının
GNU sürümüdür. Metin dosyaları içinde bulunan katarları aramada
kullanılır.

%description -l uk.UTF-8
Це GNU реалізація популярної утиліти grep, призначеної для швидкого
пошуку по шаблону в текстових файлах.

%prep
%setup -q
%patch0 -p1
%patch1 -p1
%patch2 -p1

rm -f m4/{header,init}.m4

# hack: AC_FUNC_STRERROR_R from strerror_r.m4 must override autoconf's version
# (it contains HAVE_WORKING_STRERROR_R define, needed with glibc 2.x, as
#  glibc version returns pointer to string and doesn't seem to store string in
#  supplied buffer(???))
cat m4/strerror_r.m4 >> acinclude.m4
touch m4/{header,init}.m4

# there is nb.po included, but more outdated than no.po (only no was in LINGUAS)
mv -f po/{no,nb}.po

%build
%{__libtoolize}
%{__aclocal} -I m4
%{__automake}
%{__autoconf}
%ifarch sparc sparc64
CPPFLAGS=""
export CPPFLAGS
%endif
%configure \
	%{!?with_pcre:--disable-perl-regexp} \
	--without-included-regex \
	--enable-nls
%{__make}

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/etc/env.d

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT

echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/fgrep.1

bzip2 -dc %{SOURCE1} | tar xf - -C $RPM_BUILD_ROOT%{_mandir}

cat << EOF >$RPM_BUILD_ROOT/etc/env.d/GREP_OPTIONS
#GREP_OPTIONS="--binary-files=without-match --directories=skip --color=auto"
EOF

%find_lang %{name}

rm -f $RPM_BUILD_ROOT%{_infodir}/dir
rm -f $RPM_BUILD_ROOT%{_mandir}/README.grep-non-english-man-pages
rm -f $RPM_BUILD_ROOT%{_mandir}/ja-grep-nozgrep.diff

%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/postshell
-/usr/sbin/fix-info-dir -c %{_infodir}
-/sbin/env-update -u

%postun -p /sbin/postshell
-/usr/sbin/fix-info-dir -c %{_infodir}
-/sbin/env-update -u

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc NEWS README ChangeLog TODO
%config(noreplace,missingok) %verify(not md5 mtime size) /etc/env.d/*
%attr(755,root,root) %{_bindir}/*
%{_mandir}/man1/*
%lang(cs) %{_mandir}/cs/man1/*
%lang(de) %{_mandir}/de/man1/*
%lang(es) %{_mandir}/es/man1/*
%lang(fi) %{_mandir}/fi/man1/*
%lang(fr) %{_mandir}/fr/man1/*
%lang(hu) %{_mandir}/hu/man1/*
%lang(it) %{_mandir}/it/man1/*
%lang(ja) %{_mandir}/ja/man1/*
%lang(nl) %{_mandir}/nl/man1/*
%lang(pl) %{_mandir}/pl/man1/*
%{_infodir}/*info*
