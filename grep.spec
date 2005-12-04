#
# Conditional build:
%bcond_with	pcre	# with PCRE support
#
Summary:	GNU grep Utilities
Summary(de):	GNU-Version der Pattern-Matching-Utilities
Summary(es):	Utilitarios grep GNU
Summary(fr):	Utilitaires grep de GNU
Summary(ja):	GNU grep の日本語対応版です.
Summary(pl):	GNU grep
Summary(pt_BR):	Utilit�rios grep GNU
Summary(ru):	�塢棉壅 佻瓶冒 佻 杼駄藁鼠 GNU grep
Summary(tr):	Dosyalarda katar arama arac�
Summary(uk):	�塢巳塢 佻柎釦 佻 杼駄藁鼠 GNU grep
Name:		grep
Version:	2.5.1a
Release:	1
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

%description -l de
Die GNU-Versionen der h�ufig benutzten grep-Utilities. Grep durchsucht
eine oder mehrere Eingabedateien nach Zeilen, die auf ein angegebenes
Muster passen, und zeigt dann die entsprechenden Zeilen an. GNUs grep
enth�lt grep, egrep und fgrep.

%description -l es
Esta es la implementaci�n GNU del popular utilitario grep. Permite la
localizaci�n r�pida de strings en archivos texto.

%description -l fr
Ceci est l'impl�mentation par GNU du populaire l'utilitaire grep su
Unix. Il permet de localiser rapidement des cha�nes de caract�res dans
les fichiers.

%description -l ja
GNU プロジェクトによる grep, egrep, fgrep (以下単に grep) をマルチバ
イトパッチ(mb1.04)によって日本語対応にしたものです.

%description -l pl
GNU grep jest implementacj� popularnego programu uniksowego `grep'.
Grep jest jednym z podstawowych narz�dzi, korzysta z niego prawie
ka�dy skrypt shella.

%description -l pt_BR
Esta � a implementa艫o GNU do popular utilit�rio grep. Permite a
localiza艫o r�pida de strings em arquivos texto.

%description -l ru
�塹 凖遡冨礎頻 GNU 孕斌不� grep, 侑田料變挿杜力� 通� 泰嘖厦馬 佻瓶冒
佻 和卅效� � 堙睦塹忸� 徳別組.

%description -l tr
Bu, b�t�n Unix'lerde bulunan ve yayg�n olarak kullan�lan grep arac�n�n
GNU s�r�m�d�r. Metin dosyalar� i�inde bulunan katarlar� aramada
kullan�l�r.

%description -l uk
稘 GNU 凖遡�攸脱� 佻侖妄厠炉 孕斌υ� grep, 侑冨料淌力� 通� 柧苗墨馬
佻柎釦 佻 杼駄藁� � 堙睦塹徂� 徳別組.

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

%clean
rm -rf $RPM_BUILD_ROOT

%post
[ ! -x /usr/sbin/fix-info-dir ] || /usr/sbin/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%postun
[ ! -x /usr/sbin/fix-info-dir ] || /usr/sbin/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc NEWS README ChangeLog TODO
%attr(644,root,root) %config(noreplace,missingok) %verify(not md5 mtime size) /etc/env.d/*
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
