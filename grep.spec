# _with_pcre - PCRE support
Summary:	GNU grep Utilities
Summary(de):	GNU-Version der Pattern-Matching-Utilities
Summary(es):	Utilitarios grep GNU
Summary(fr):	Utilitaires grep de GNU
Summary(ja):	GNU grep ¤ÎÆüËÜ¸ìÂÐ±þÈÇ¤Ç¤¹. 
Summary(pl):	GNU grep
Summary(pt_BR):	Utilitários grep GNU
Summary(ru):	õÔÉÌÉÔÙ ÐÏÉÓËÁ ÐÏ ÛÁÂÌÏÎÁÍ GNU grep
Summary(tr):	Dosyalarda katar arama aracý
Summary(uk):	õÔÉÌ¦ÔÉ ÐÏÛÕËÕ ÐÏ ÛÁÂÌÏÎÁÍ GNU grep
Name:		grep
Version:	2.5.1
Release:	4
Epoch:		2
License:	GPL
Group:		Applications/Text
Source0:	ftp://ftp.gnu.org/gnu/%{name}/%{name}-%{version}.tar.gz
# Source0-md5: ae69f8112cdc63615cefe944f38bbee7
Source1:	http://www.mif.pg.gda.pl/homepages/ankry/man-PLD/%{name}-non-english-man-pages.tar.bz2
# Source1-md5: 21c03a584dcb47224f9f1a7e4e049b89
Patch0:		%{name}-info.patch
Patch1:		%{name}-e%{name}.patch
%{?_with_pcre:BuildRequires:	pcre-devel}
%{?_with_pcre:Requires:	pcre}
BuildRequires:	gettext-devel
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_bindir		/bin
%define		_exec_prefix	/

%description
The GNU versions of commonly used grep utilities. Grep searches one or
more input files for lines which contain a match to a specified
pattern and then prints the matching lines. GNU's grep utilities
include grep, egrep and fgrep.

%description -l de
Die GNU-Versionen der häufig benutzten grep-Utilities. Grep durchsucht
eine oder mehrere Eingabedateien nach Zeilen, die auf ein angegebenes
Muster passen, und zeigt dann die entsprechenden Zeilen an. GNUs grep
enthält grep, egrep und fgrep.

%description -l es
Esta es la implementación GNU del popular utilitario grep. Permite la
localización rápida de strings en archivos texto.

%description -l fr
Ceci est l'implémentation par GNU du populaire l'utilitaire grep su
Unix. Il permet de localiser rapidement des chaînes de caractéres dans
les fichiers.

%description -l ja
GNU ¥×¥í¥¸¥§¥¯¥È¤Ë¤è¤ë grep, egrep, fgrep (°Ê²¼Ã±¤Ë grep) ¤ò¥Þ¥ë¥Á¥Ð
¥¤¥È¥Ñ¥Ã¥Á(mb1.04)¤Ë¤è¤Ã¤ÆÆüËÜ¸ìÂÐ±þ¤Ë¤·¤¿¤â¤Î¤Ç¤¹. 

%description -l pl
GNU grep jest implementacj± popularnego programu uniksowego `grep'.
Grep jest jednym z podstawowych narzêdzi, korzysta z niego prawie
ka¿dy skrypt shella.

%description -l pt_BR
Esta é a implementação GNU do popular utilitário grep. Permite a
localização rápida de strings em arquivos texto.

%description -l ru
üÔÏ ÒÅÁÌÉÚÁÃÉÑ GNU ÕÔÉÌÉÔÙ grep, ÐÒÅÄÎÁÚÎÁÞÅÎÎÏÊ ÄÌÑ ÂÙÓÔÒÏÇÏ ÐÏÉÓËÁ
ÐÏ ÏÂÒÁÚÃÕ × ÔÅËÓÔÏ×ÙÈ ÆÁÊÌÁÈ.

%description -l tr
Bu, bütün Unix'lerde bulunan ve yaygýn olarak kullanýlan grep aracýnýn
GNU sürümüdür. Metin dosyalarý içinde bulunan katarlarý aramada
kullanýlýr.

%description -l uk
ãÅ GNU ÒÅÁÌ¦ÚÁÃ¦Ñ ÐÏÐÕÌÑÒÎÏ§ ÕÔÉÌ¦ÔÉ grep, ÐÒÉÚÎÁÞÅÎÏ§ ÄÌÑ Û×ÉÄËÏÇÏ
ÐÏÛÕËÕ ÐÏ ÛÁÂÌÏÎÕ × ÔÅËÓÔÏ×ÉÈ ÆÁÊÌÁÈ.

%prep
%setup  -q
%patch0 -p1
%patch1 -p1

%build
%ifarch sparc sparc64
CPPFLAGS=""
export CPPFLAGS
%endif
%configure \
	%{?!_with_pcre:--disable-perl-regexp} \
	--without-included-regex \
	--enable-nls
%{__make}

%install
rm -rf $RPM_BUILD_ROOT

%{__make} install DESTDIR=$RPM_BUILD_ROOT

echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/egrep.1
echo .so grep.1 > $RPM_BUILD_ROOT%{_mandir}/man1/fgrep.1

bzip2 -dc %{SOURCE1} | tar xf - -C $RPM_BUILD_ROOT%{_mandir}

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
%attr(755,root,root) %{_bindir}/*
%{_mandir}/man1/*
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
