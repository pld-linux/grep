#
# Conditional build:
%bcond_without	pcre	# PCRE support
%bcond_without	tests	# don't perform "make check"
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
Version:	3.12
Release:	1
Epoch:		2
License:	GPL v3+
Group:		Applications/Text
Source0:	https://ftp.gnu.org/gnu/grep/%{name}-%{version}.tar.xz
# Source0-md5:	5d9301ed9d209c4a88c8d3a6fd08b9ac
Source1:	http://www.mif.pg.gda.pl/homepages/ankry/man-PLD/%{name}-non-english-man-pages.tar.bz2
# Source1-md5:	1b5e726d0bee53e898531de4a76ad290
Patch0:		%{name}-info.patch
Patch1:		%{name}-pl.po-update.patch
Patch2:		disable-unstable-test.patch
URL:		http://www.gnu.org/software/grep/grep.html
BuildRequires:	autoconf >= 2.64
BuildRequires:	automake >= 1:1.12
BuildRequires:	gettext-tools >= 0.18.2
%{?with_pcre:BuildRequires:	pcre2-8-devel}
BuildRequires:	pkgconfig >= 1:0.9.0
BuildRequires:	tar >= 1:1.22
BuildRequires:	texinfo
BuildRequires:	xz
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
%patch -P0 -p1
%patch -P1 -p1
%patch -P2 -p1

%{__rm} po/stamp-po

%build
%{__gettextize}
%{__aclocal} -I m4
%{__autoconf}
%{__autoheader}
%{__automake}
%configure \
	%{!?with_pcre:--disable-perl-regexp} \
	--disable-silent-rules \
	--without-included-regex
%{__make}

%if %{with tests}
# mksh fails "unset columns" check (bash and pdksh are OK)
%{__make} -j1 check-expensive \
	SHELL=/bin/bash
%endif

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/etc/shrc.d

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT

echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/fgrep.1

bzip2 -dc %{SOURCE1} | tar xf - -C $RPM_BUILD_ROOT%{_mandir}

cat << EOF >$RPM_BUILD_ROOT/etc/shrc.d/grep.sh
#alias grep='/bin/grep --devices=skip --directories=skip --color=auto'
EOF
cat << EOF >$RPM_BUILD_ROOT/etc/shrc.d/grep.csh
#alias grep '/bin/grep --devices=skip --directories=skip --color=auto'
EOF

%find_lang %{name}

rm -f $RPM_BUILD_ROOT%{_infodir}/dir
%{__rm} $RPM_BUILD_ROOT%{_mandir}/README.grep-non-english-man-pages
%{__rm} $RPM_BUILD_ROOT%{_mandir}/ja-grep-nozgrep.diff

%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/postshell
-/usr/sbin/fix-info-dir -c %{_infodir}

%postun -p /sbin/postshell
-/usr/sbin/fix-info-dir -c %{_infodir}

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc AUTHORS ChangeLog NEWS README THANKS TODO
%config(noreplace) %verify(not md5 mtime size) /etc/shrc.d/grep.*sh
%attr(755,root,root) %{_bindir}/egrep
%attr(755,root,root) %{_bindir}/fgrep
%attr(755,root,root) %{_bindir}/grep
%{_mandir}/man1/egrep.1*
%{_mandir}/man1/fgrep.1*
%{_mandir}/man1/grep.1*
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
%{_infodir}/grep.info*
