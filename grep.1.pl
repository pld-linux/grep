.\" T�umaczenie: Gwidon S. Naskrent (naskrent@hoth.amu.edu.pl), IX 1998
.\" {PTM/GSN/0.5/23-02-1999/"wypisz linie pasuj�ce do wzorca"}
.\" aktualizacja do 2.4.2 PTM/WK/2001-I
.if !\n(.g \{\
.	if !\w|\*(lq| \{\
.		ds lq ``
.		if \w'\(lq' .ds lq "\(lq
.	\}
.	if !\w|\*(rq| \{\
.		ds rq ''
.		if \w'\(rq' .ds rq "\(rq
.	\}
.\}
.de Id
.ds Dt \\$4
..
.Id $Id$
.TH GREP 1 \*(Dt "Projekt GNU"
.SH NAZWA
grep, egrep, fgrep \- wypisz linie pasuj�ce do wzorca
.SH SK�ADNIA
.B grep
.RI [ opcje ]
.I wzorzec
.RI [ plik .\|.\|.]
.br
.B grep
.RI [ opcje ]
.RB [ \-e
.I wzorzec
|
.B \-f
.IR plik ]
.RI [ plik .\|.\|.]
.SH OPIS
.PP
.B grep
przeszukuje wskazane
.IR plik i
wej�ciowe (lub standardowe wej�cie je�li
nie podano �adnych lub podano nazw� pliku '\-'), szukaj�c linii
zawieraj�cych co� pasuj�cego do podanego
.IR wzorca .
Domy�lnie,
.B grep
wypisuje pasuj�ce linie.
.PP
Dodatkowo dost�pne s� dwa programy wariantowe
.B egrep
i
.BR fgrep .
.B Egrep
jest tym samym, co
.BR "grep\ \-E" .
.B Fgrep
jest tym samym, co
.BR "grep\ \-F" .
.SH OPCJE
.TP
.BI \-A " num" "\fR,\fP \-\^\-after-context=" num
Wypisuje po pasuj�cych liniach
.I num
linii nast�puj�cego kontekstu.
.TP
.BR \-a ", " \-\^\-text
Przetwarza plik binarny tak, jakby by� on tekstowy; jest to r�wnowa�nik
opcji
.BR \-\^\-binary-fnums=text .
.TP
.BI \-B " num" "\fR,\fP \-\^\-before-context=" num
Wypisuje przed pasuj�cymi liniami
.I num
linii poprzedzaj�cego kontekstu.
.TP
\fB\-C\fP [\fInum\fP], \fB\-\fP\fInum\fP, \fB\-\^\-context\fP[\fB=\fP\fInum\fP]
Wypisuje
.I num
linii (domy�lnie 2) kontekstu w wyj�ciu.
.TP
.BR \-b ", " \-\^\-byte-offset
Wypisuje przed ka�d� lini� wyj�cia jej offset bajtowy w pliku wej�ciowym.
.TP
.BI \-\^\-binary-files= typ
Je�li pierwszych kilka bajt�w pliku wskazuje, �e zawiera on dane binarne, to
zak�adane jest, �e jest to plik typu
.IR typ .
Domy�lnym
.I typem
jest binarny
.RB ( binary ),
a
.B grep
normalnie albo wypisuje jednolinijkowy komunikat m�wi�cy o dopasowaniu
pliku binarnego, albo nie wypisuje komunikatu, gdy nie znaleziono
dopasowania.
Je�eli
.I typem
jest
.B without-match
(bez dopasowania), to
.B grep
zak�ada, �e ten plik binarny nie pasuje; jest to r�wnowa�ne dzia�aniu opcji
.BR \-I .
Je�li
.I typem
jest
.BR text ,
to
.B grep
przetwarza plik binarny tak, jakby by� on tekstowy; jest to r�wnowa�ne opcji
.BR \-a .
.I Ostrze�enie:
Mo�e si� zdarzy�, �e wypisane przez
.B "grep \-\^\-binary-files=text"
�miecie binarne dadz� przykre skutki uboczne je�eli
wyj�ciem b�dzie terminal a jego sterownik zinterpretuje niekt�re z nich
jako swoje polecenia. 
.TP
.BR \-c ", " \-\^\-count
Wy��cza normalne wyj�cie; zamiast niego dla ka�dego pliku wej�ciowego
wypisuje liczb� pasuj�cych linii.
Z opcj�
.BR \-v ", " \-\^\-invert-match
(patrz ni�ej), liczy linie niepasuj�ce.
.TP
.BI \-d " akcja" "\fR,\fP \-\^\-directories=" akcja
Je�li plik wej�ciowy jest katalogiem, stosuje to jego przetworzenia
.IR akcj� .
Domy�ln�
.I akcj�
jest
.BR read ,
co znaczy, �e katalogi s� czytane dok�adnie tak samo, jakby by�y zwyk�ymi
plikami.
Je�li warto�ci�
.I akcji
jest
.BR skip ,
to katalogi s� milcz�co pomijane.
Je�li warto�ci�
.I akcji
jest
.BR recurse ,
to
.B grep
czyta wszystkie pliki pod ka�dym katalogiem, rekurencyjnie;
jest to r�wnowa�ne opcji
.BR \-r .
.TP
.BR \-E ", " \-\^\-extended-regexp
Interpretuje
.I wzorzec
jako rozszerzone wyra�enie regularne (patrz ni�ej).
.TP
.BI \-e " wzorzec" "\fR,\fP \-\^\-regexp=" wzorzec
U�ywa
.I wzorca
jako wzorca; u�yteczne do ochronienia wzor�w zaczynaj�cych si� od
.BR \- .
.TP
.BR \-F ", " \-\^\-fixed-strings
Interpretuje
.I wzorzec
jako list� �a�cuch�w o sta�ej d�ugo�ci, oddzielonych znakami nowej
linii, kt�re nale�y dopasowa� ka�dy z osobna.
.TP
.BI \-f " plik" "\fR,\fP \-\^\-file=" plik
Pobiera wzorce z
.IR plik ,
po jednym z ka�dej linii.  Plik pusty zawiera zero wzorc�w, nie pasuj�c
do niczego.
.TP
.BR \-G ", " \-\^\-basic-regexp
Interpretuje
.I wzorzec
jako podstawowe wyra�enie regularne (zobacz ni�ej).  Jest to zachowanie
domy�lne.
.TP
.BR \-H ", " \-\^\-with-filename
Dla ka�dego dopasowania wypisuje nazw� pliku.
.TP
.BR \-h ", " \-\^\-no-filename
.B \-h, --no-filename
Wy��cza poprzedzanie wynik�w nazwami plik�w podczas przeszukiwania
wielu plik�w.
.TP
.B \-\^\-help
Wypisuje kr�tki tekst pomocy.
.TP
.BR \-I
Przetwarza plik binarny tak, jakby nie zawiera� on pasuj�cych danych; jest
to r�wnowa�ne opcji
.BR \-\^\-binary-files=without-match .
.TP
.BR \-i ", " \-\^\-ignore-case
Ignoruje rozr�nienia w wielko�ci liter we
.I wzorcu
oraz w plikach wej�ciowych.
.TP
.BR \-L ", " \-\^\-files-without-match
Wy��cza normalne wyj�cie; zamiast niego wypisuje nazw� ka�dego pliku,
z kt�rego normalnie nie wypisano by �adnego wyj�cia.  Przeszukiwanie
zako�czy si� na pierwszej pasuj�cej linii.
.TP
.BR \-l ", " \-\^\-files-with-matches
Wy��cza normalne wyj�cie; zamiast niego wypisuje nazw� ka�dego pliku,
z kt�rego normalnie wypisano by jakie� wyj�cie.  Przeszukiwanie
zako�czy si� na pierwszej pasuj�cej linii.
.TP
.B \-\^\-mmap
Je�li to mo�liwe, do odczytu wej�cia korzysta z funkcji systemowej
.BR mmap (2)
zamiast domy�lnej
.BR read (2).
W pewnych sytuacjach
.B \-\^\-mmap
daje lepsz� wydajno��. Mo�e jednak spowodowa� niezdefiniowane zachowanie
(��cznie ze zrzutem rdzenia) je�li podczas dzia�ania
.B grep
plik wej�ciowy si� skurczy lub wyst�pi b��d wej�cia/wyj�cia.
.TP
.BR \-n ", " \-\^\-line-number
Poprzedza ka�d� lini� wyj�cia numerem linii z odpowiedniego pliku
wej�ciowego.
.TP
.BR \-q ", " \-\^\-quiet ", " \-\^\-silent
Po cichu; wy��cza normalne wyj�cie.  Przeszukiwanie zako�czy si� na
pierwszej pasuj�cej linii. Zobacz tak�e poni�ej opcje
.B \-s
lub
.BR \-\^\-no-messages .
.TP
.BR \-r ", " \-\^\-recursive
Czyta wszystkie pliki pod ka�dym katalogiem, rekurencyjnie;
jest to r�wnowa�ne opcji
.BR "\-d recurse" .
.TP
.BR \-s ", " \-\^\-no-messages
Wy��cza komunikaty b��d�w o plikach nieistniej�cych lub nie do odczytania.
Uwaga o przeno�no�ci: w przeciwie�stwie do \s-1GNU\s0
.BR grep ,
tradycyjny
.B grep
nie by� zgodny z \s-1POSIX.2\s0, gdy� brakowa�o mu opcji
.B \-q
a opcja
.B \-s
zachowywa�a si� jak opcja
.B \-q
z \s-1GNU\s0
.BR grep .
Skrypty pow�oki, kt�re maj� by� przeno�ne na tradycyjny 
.B grep
powinny unika� zar�wno
.BR \-q ,
jak i
.B \-s
i zamiast tego przekierowywa� wyj�cie do /dev/null.
.TP
.BR \-U ", " \-\^\-binary
Traktuje plik jako binarny.  Domy�lnie, w DOS-ie i MS Windows,
.BR grep
zgaduje typ pliku spogl�daj�c na zawarto�� pierwszych 32 kB przeczytanych
z pliku.  Je�li zdecyduje, �e plik jest tekstowy, udziera znaki CR
z oryginalnej zawarto�ci pliku (po to �eby wyra�enia regularne z
.B ^
i
.B $
dzia�a�y poprawnie).  Podanie
.B \-U
wy��cza to zgadywanie, powoduj�c, �e wszystkie pliki s� czytane i
przekazywane mechanizmowi dopasowywuj�cemu dos�ownie; je�li plik jest
plikiem tekstowym z parami CR/LF na ko�cu linii, spowoduje to, �e 
niekt�re wyra�enia regularne nie zadzia�aj�.  Opcja ta nie dzia�a
na platformach innych ni� MS-DOS i MS Windows.
.TP
.BR \-u ", " \-\^\-unix-byte-offsets
Raportuje offsety bajtowe w stylu Unixowym.  Prze��cznik ten powoduje, �e
.B grep
raportuje offsety bajtowe tak, jakby plik by� plikiem tekstowym typu
Uniksowego, tj. z udartymi znakami CR.  Da to rezultaty identyczne jak
uruchomienie 
.B grepa
na maszynie Uniksowej.  Opcja ta nie wywo�uje �adnego efektu, chyba �e u�yto
tak�e opcji
.BR \-b ;
nie dzia�a na platformach innych ni� MS-DOS i MS Windows.
.TP
.BR \-V ", " \-\^\-version
Wypisuje numer wersji
.B grepa
na standardowe wyj�cie b��d�w.  �w numer wersji powinno si� za��cza�
we wszystkich zg�oszeniach b��d�w (patrz ni�ej).
.TP
.BR \-v ", " \-\^\-invert-match
Odwraca sens dopasowania, wybiera linie niepasuj�ce.
.TP
.BR \-w ", " \-\^\-word-regexp
Wybiera tylko te linie, w kt�rych dopasowania wzorca tworz� ca�e s�owa.
Przeprowadzany test polega na tym, �e dopasowywany podci�g musi albo 
znajdowa� si� na pocz�tku linii, albo by� poprzedzony znakiem nie
tworz�cym s�owa.  Podobnie, musi albo znajdowa� si� na ko�cu linii,
albo musi nast�powa� po nim znak nie tworz�cy s�owa.  Znakami
tworz�cymi s�owa s� litery, cyfry i znak podkre�lenia.
.TP
.BR \-x ", " \-\^\-line-regexp
Wybiera tylko te dopasowania, kt�re dok�adnie pasuj� do ca�ej linii.
.TP
.B \-y
Przestarza�y synonim
.BR \-i .
.TP
.BR \-Z ", " \-\^\-null
Zamiast znaku, kt�ry normalnie wyst�puje po nazwie pliku wypisuje bajt
zerowy ( \s-1ASCII\s0
.BR NUL ).
Na przyk�ad,
.B "grep \-lZ"
wypisuje po nazwie pliku bajt zerowy, zamiast, jak zwykle, znaku nowej linii.
Opcja ta powoduje, �e wyj�cie jest jednoznaczne, nawet przy nazwach plik�w
zawieraj�cych niecodzienne znaki, jak znak nowej linii. Mo�e by�
wykorzystywana z poleceniami typu:
.BR "find \-print0" ,
.BR "perl \-0" ,
.B "sort \-z"
czy
.BR "xargs \-0" ,
umo�liwiaj�c przetwarzanie plik�w o dowolych nazwach, nawet zawieraj�cych
znaki nowej linii.
.SH "WYRA�ENIA REGULARNE"
.PP
Wyra�enie regularne to wzorzec opisuj�cy zbi�r �a�cuch�w.  Wyra�enia
regularne s� zbudowane analogicznie do wyra�e� arytmetycznych, przez
zastosowanie do po��czenia mniejszych wyra�e� rozmaitych operator�w.
.PP
.B grep
rozumie dwie r�ne wersje sk�adni wyra�e� regularnych: "podstawow�"
i "rozszerzon�".  W \s-1GNU\s0\
.B grep
obie te sk�adnie przy u�yciu nie r�ni� si� zakresem dost�pnych mo�liwo�ci.
W innych implementacjach podstawowe wyra�enia regularne s� mniej rozbudowane.
Poni�szy opis stosuje si� do rozszerzonych wyra�e� regularnych;
r�nice w stosunku do wyra�e� podstawowych podsumowano na ko�cu.
.PP
Fundamentalnymi "cegie�kami" s� wyra�enia regularne pasuj�ce do pojedynczego
znaku.  Wi�kszo�� znak�w, w tym wszystkie litery i cyfry, to wyra�enia
regularne pasuj�ce do samych siebie.  Ka�dy metaznak maj�cy specjalne
znaczenie mo�e by� cytowany przez poprzedzenie go odwrotnym uko�nikiem.
.PP
Lista znak�w zawarta mi�dzy
.B [
a
.B ]
pasuje do ka�dego pojedynczego znaku na tej li�cie; je�li pierwszym znakiem
listy jest daszek
.BR ^ ,
pasuje wtedy ona do ka�dego znaku
.I nie
znajduj�cego si� na li�cie.  Dla przyk�adu, wyra�enie regularne
.B [0123456789]
pasuje do ka�dej pojedynczej cyfry.  Zakres znak�w ASCII poda� mo�na
okre�laj�c znak pierwszy i ostatni, oddzielone my�lnikiem.
I na koniec: predefiniowano pewne nazwane klasy znak�w.  Ich nazwy
m�wi� same za siebie, i s� to:
.BR [:alnum:] ,
.BR [:alpha:] ,
.BR [:cntrl:] ,
.BR [:digit:] ,
.BR [:graph:] ,
.BR [:lower:] ,
.BR [:print:] ,
.BR [:punct:] ,
.BR [:space:] ,
.BR [:upper:]
oraz
.BR [:xdigit:].
Na przyk�ad
.B [[:alnum:]]
oznacza
.BR [0-9A-Za-z] ,
z tym wyj�tkiem, �e ta druga forma zale�y od kodowania znak�w ASCII
i ustawie� regionalnych \s-1POSIX\s0 (locale), podczas
gdy pierwsza jest przeno�na.
(Zauwa�, �e nawiasy kwadratowe w nazwach klas s� cz�ci� nazw symbolicznych
i musz� by� umieszczone dodatkowo, opr�cz pary nawias�w ograniczaj�cej sam�
list�).
Wi�kszo�� metaznak�w traci swoje szczeg�lne znaczenie wewn�trz list.  Aby
umie�ci� tam dos�owny
.BR ] ,
umie�� go jako pierwszy na li�cie.  Podobnie, aby umie�ci� dos�owny
.BR ^ ,
umie�� go gdziekolwiek poza pierwszym miejscem.  W ko�cu, aby umie�ci�
dos�owny
.BR \- ,
umie�� go na ostatku.
.PP
Kropka
.B .
pasuje do ka�dego pojedynczego znaku.
Symbol
.B \ew
to synonim
.B [[:alnum:]]
a
.B \eW
to synonim
.BR [^[:alnum]] .
.PP
Daszek
.B ^
oraz znak dolara
.B $
s� metaznakami, kt�re pasuj� odpowiednio do �a�cucha pustego na pocz�tku
i na ko�cu linii.  Symbole
.B \e<
oraz
.B \e>
pasuj� odpowiednio do �a�cucha pustego na pocz�tku i na ko�cu s�owa.
Symbol
.B \eb
pasuje do �a�cucha pustego na kraw�dzi s�owa, za�
.B \eB
pasuje do pustego �a�cucha zak�adaj�c, �e 
.I nie
jest on na kraw�dzi s�owa.
.PP
Po wyra�eniu regularnym mo�e nast�powa� jeden z kilku operator�w
powt�rzenia:
.PD 0
.TP
.B ?
Poprzedzaj�cy element jest opcjonalny i pasuje nie wi�cej ni� raz.
.TP
.B *
Poprzedzaj�cy element b�dzie dopasowany zero lub wi�cej razy.
.TP
.B +
Poprzedzaj�cy element b�dzie dopasowany jeden lub wi�cej razy.
.TP
.BI { n }
Poprzedzaj�cy element pasuje dok�adnie 
.I n
razy.
.TP
.BI { n ,}
Poprzedzaj�cy element pasuje
.I n
lub wi�cej razy.
.TP
.BI {, m }
Poprzedzaj�cy element jest opcjonalny i pasuje co najwy�ej
.I m
razy.
.TP
.BI { n , m }
Poprzedzaj�cy element pasuje co najmniej
.I n
razy, ale nie wi�cej ni�
.I m
razy.
.PD
.PP
Dwa wyra�enia regularne mo�na ze sob� z��czy� (skonkatenowa�);
do wynikowego wyra�enia regularnego pasuje ka�dy ci�g utworzony
przez z��czenie dowolnych dw�ch ci�g�w, kt�re odpowiednio pasuj�
do z��czonych podwyra�e�.
.PP
Dwa wyra�enia regularne mo�na po��czy� operatorem infiksowym (wrostkowym)
.BR | ;
do wynikowego wyra�enia regularnego pasuje dowolny ci�g pasuj�cy
do jednego b�d� do drugiego z podwyra�e�.
.PP
Powtarzanie ma priorytet nad ��czeniem, kt�re z kolei bierze
g�r� nad alternatyw�.  Ca�e wyra�enie regularne mo�na uj��
w nawiasy, celem uniewa�nienia tych regu� priorytetowych.
.PP
Wsteczne odniesienie
.BI \e n\c
\&, gdzie
.I n
jest pojedyncz� cyfr�, dopasowuje podci�g poprzednio dopasowany
.IR n \-tym
uj�tym w nawiasy podwyra�eniem wyra�enia regularnego.
.PP
W podstawowych wyra�eniach regularnych metaznaki
.BR ? ,
.BR + ,
.BR { ,
.BR | ,
.BR (
oraz
.BR )
trac� swoje szczeg�lne znaczenie; zamiast nich nale�y u�y� wersji
z odwrotnym uko�nikiem:
.BR \e? ,
.BR \e+ ,
.BR \e{ ,
.BR \e| ,
.BR \e(
oraz
.BR \e) .
.PP
Tradycyjny
.B egrep
nie traktuje
.B {
jako metaznaku. Niekt�re implementacje
udost�pniaj� zamiast niego
.BR \e{ ,
wi�c przeno�ne skrypty powinny unika� 
.B {
we wzorcach
.BR egrep ,
a do dopasowywania dos�ownego znaku
.B {
stosowa�
.BR [{] .
.PP
\s-1GNU\s0
.B egrep
usi�uje obs�ugiwa� tradycyjny spos�b u�ycia zak�adaj�c, �e
.B {
nie posiada szczeg�lnego znaczenia je�li by�by on pocz�tkiem nieprawid�owego
okre�lenia liczby powt�rze�. Na przyk�ad, polecenie pow�oki
.B "egrep '{1'"
szuka dwuznakowego �a�cucha
.BR {1 ,
zamiast zg�asza� b��d sk�adni w wyra�eniu regularnym.
\s-1POSIX.2\s0 pozwala na takie zachowanie jako rozszerzenie standardu,
ale przeno�ne skrypty powinny go unika�.
.SH "ZMIENNE �RODOWISKA"
.TP
.B GREP_OPTIONS
Ta zmienna okre�la domy�lne opcje, jakie zostan� umieszczone przed 
wszystkimi opcjami podanymi wprost.  Na przyk�ad, je�li
.B GREP_OPTIONS
jest r�wne
.BR "'\-\^\-binary-files=without-match \-\^\-directories=skip'" ,
to
.B grep
zachowa si� tak, jakby podano
.B \-\^\-binary-files=without-match
i
.B \-\^\-directories=skip
przed ewentualnymi jawnymi opcjami.
Okre�lenia opcji oddziela si� bia�ymi znakami.
Odwrotny uko�nik cytuje nast�pny znak, zatem mo�na go wykorzysta� do podania
opcji zawieraj�cej bia�y znak lub odwrotny uko�nik.
.TP
\fBLC_ALL\fP, \fBLC_MESSAGES\fP, \fBLANG\fP
Te zmienne podaj� ustawienie regionalne (locale)
.BR LC_MESSAGES ,
okre�laj�ce j�zyk, jakiego
.B grep
ma u�y� w komunikatach.
Ustawienie locale jest okre�lane przez pierwsz� z tych zmiennych, kt�ra
ma nadan� warto��.
Je�li nie istnieje �adna z nich, to stosowana jest ameryka�ska odmiana
angielskiego. Dzieje si� tak r�wnie� w przypadku, gdy nie zainstalowano
katalogu z komunikatami lub je�li
.B grep
nie zosta� skompilowany z obs�ug� j�zyk�w narodowych (\s-1NLS\s0).
.TP
\fBLC_ALL\fP, \fBLC_CTYPE\fP, \fBLANG\fP
Te zmienne podaj� ustawienie regionalne (locale)
.B LC_CTYPE
okre�laj�ce typ znak�w, np. kt�re z nich s� bia�ymi znakami.
Ustawienie locale jest okre�lane przez pierwsz� z tych zmiennych, kt�ra
ma nadan� warto��.
Je�li nie istnieje �adna z nich, to stosowane jest ustawienie \s-1POSIX\s0.
Dzieje si� tak r�wnie� w przypadku, gdy nie zainstalowano
katalogu z komunikatami lub je�li
.B grep
nie zosta� skompilowany z obs�ug� j�zyk�w narodowych (\s-1NLS\s0).
.TP
.B POSIXLY_CORRECT
Je�li jest ustawiona, to
.B grep
zachowuje si� zgodnie z wymaganiami \s-1POSIX.2\s0; w przeciwnym razie
.B grep
zachowuje si� bardziej jak inne programy \s-1GNU\s0.
\s-1POSIX.2\s0 ��da, by opcje, kt�re wyst�puj� po nazwach plik�w by�y
traktowane jak nazwy plik�w. Domy�lnie za�, opcje takie s� przesuwane
na pocz�tek listy argument�w i traktowane jak opcje.
Ponadto, \s-1POSIX.2\s0 wymaga, by nierozpoznane opcje by�y zg�aszane jako
"nielegalne" ("illegal"), ale poniewa� tak naprawd� nie naruszaj�
one prawa, domy�lnie zg�aszane s� jako "nieprawid�owe" ("invalid").
.B POSIXLY_CORRECT
wy��cza tak�e \fB_\fP\fIN\fP\fB_GNU_nonoption_argv_flags_\fP, opisane
poni�ej.
.TP
\fB_\fP\fIN\fP\fB_GNU_nonoption_argv_flags_\fP
(Tu
.I N
jest numerycznym identyfikatorem procesu
.BR grep a).
Je�li
.IR i -tym
znakiem warto�ci tej zmiennej �rodowiska jest
.BR 1 ,
to 
.IR i -ty
argument przekazany do
.B grep
nie jest uwa�any za opcj�, nawet je�li na ni� wygl�da.
Pow�oka mo�e umie�ci� t� zmienn� w �rodowisku dla ka�dego polecenia,
jakie uruchamia, podaj�c, kt�re argumenty s� wynikiem rozwini�cia nazw
plik�w i st�d nie powinny by� traktowane jako opcje.
Zachowanie to jest dost�pne tylko z bibliotek� \s-1GNU\s0 C i tylko wtedy
gdy nie ustawiono
.BR POSIXLY_CORRECT .
.SH DIAGNOSTYKA
.PP
Normalnie status zako�czenia r�wna si� 0 je�li znaleziono dopasowania,
a 1 je�li nie znaleziono �adnych.  Opcja
.B \-v
odwraca sens statusu zako�czenia.  Status zako�czenia r�wna si� 2 je�li
wyst�pi�y b��dy sk�adniowe we wzorcu, niedost�pne pliki wej�ciowe lub
inne b��dy systemowe.
.SH B��DY
.PP
Zg�oszenia b��d�w wysy�aj, prosz�, do
.BR bug-gnu-utils@gnu.org .
Upewnij si�, �e gdzie� w polu tematu ("Subject:") umie�ci�e� s�owo "grep".
.PP
Du�e liczniki powt�rze� w konstrukcji
.BI { m , n }
mog� spowodowa�, �e grep zu�yje mn�stwo pami�ci.  Opr�cz tego, pewne
inne niejasne wyra�enia regularne wymagaj� czasu i przestrzeni
rosn�cej wyk�adniczo i mog� spowodowa�, �e
.B grepowi
zabraknie pami�ci.
.PP
Wsteczne odwo�ania s� bardzo powolne i mog� wymaga� czasu rosn�cego
wyk�adniczo.
.\" Work around problems with some troff -man implementations.
.br
