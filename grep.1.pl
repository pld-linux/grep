.\" T³umaczenie: Gwidon S. Naskrent (naskrent@hoth.amu.edu.pl), IX 1998
.\" {PTM/GSN/0.5/23-02-1999/"wypisz linie pasuj±ce do wzorca"}
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
grep, egrep, fgrep \- wypisz linie pasuj±ce do wzorca
.SH SK£ADNIA
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
wej¶ciowe (lub standardowe wej¶cie je¶li
nie podano ¿adnych lub podano nazwê pliku '\-'), szukaj±c linii
zawieraj±cych co¶ pasuj±cego do podanego
.IR wzorca .
Domy¶lnie,
.B grep
wypisuje pasuj±ce linie.
.PP
Dodatkowo dostêpne s± dwa programy wariantowe
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
Wypisuje po pasuj±cych liniach
.I num
linii nastêpuj±cego kontekstu.
.TP
.BR \-a ", " \-\^\-text
Przetwarza plik binarny tak, jakby by³ on tekstowy; jest to równowa¿nik
opcji
.BR \-\^\-binary-fnums=text .
.TP
.BI \-B " num" "\fR,\fP \-\^\-before-context=" num
Wypisuje przed pasuj±cymi liniami
.I num
linii poprzedzaj±cego kontekstu.
.TP
\fB\-C\fP [\fInum\fP], \fB\-\fP\fInum\fP, \fB\-\^\-context\fP[\fB=\fP\fInum\fP]
Wypisuje
.I num
linii (domy¶lnie 2) kontekstu w wyj¶ciu.
.TP
.BR \-b ", " \-\^\-byte-offset
Wypisuje przed ka¿d± lini± wyj¶cia jej offset bajtowy w pliku wej¶ciowym.
.TP
.BI \-\^\-binary-files= typ
Je¶li pierwszych kilka bajtów pliku wskazuje, ¿e zawiera on dane binarne, to
zak³adane jest, ¿e jest to plik typu
.IR typ .
Domy¶lnym
.I typem
jest binarny
.RB ( binary ),
a
.B grep
normalnie albo wypisuje jednolinijkowy komunikat mówi±cy o dopasowaniu
pliku binarnego, albo nie wypisuje komunikatu, gdy nie znaleziono
dopasowania.
Je¿eli
.I typem
jest
.B without-match
(bez dopasowania), to
.B grep
zak³ada, ¿e ten plik binarny nie pasuje; jest to równowa¿ne dzia³aniu opcji
.BR \-I .
Je¶li
.I typem
jest
.BR text ,
to
.B grep
przetwarza plik binarny tak, jakby by³ on tekstowy; jest to równowa¿ne opcji
.BR \-a .
.I Ostrze¿enie:
Mo¿e siê zdarzyæ, ¿e wypisane przez
.B "grep \-\^\-binary-files=text"
¶miecie binarne dadz± przykre skutki uboczne je¿eli
wyj¶ciem bêdzie terminal a jego sterownik zinterpretuje niektóre z nich
jako swoje polecenia. 
.TP
.BR \-c ", " \-\^\-count
Wy³±cza normalne wyj¶cie; zamiast niego dla ka¿dego pliku wej¶ciowego
wypisuje liczbê pasuj±cych linii.
Z opcj±
.BR \-v ", " \-\^\-invert-match
(patrz ni¿ej), liczy linie niepasuj±ce.
.TP
.BI \-d " akcja" "\fR,\fP \-\^\-directories=" akcja
Je¶li plik wej¶ciowy jest katalogiem, stosuje to jego przetworzenia
.IR akcjê .
Domy¶ln±
.I akcj±
jest
.BR read ,
co znaczy, ¿e katalogi s± czytane dok³adnie tak samo, jakby by³y zwyk³ymi
plikami.
Je¶li warto¶ci±
.I akcji
jest
.BR skip ,
to katalogi s± milcz±co pomijane.
Je¶li warto¶ci±
.I akcji
jest
.BR recurse ,
to
.B grep
czyta wszystkie pliki pod ka¿dym katalogiem, rekurencyjnie;
jest to równowa¿ne opcji
.BR \-r .
.TP
.BR \-E ", " \-\^\-extended-regexp
Interpretuje
.I wzorzec
jako rozszerzone wyra¿enie regularne (patrz ni¿ej).
.TP
.BI \-e " wzorzec" "\fR,\fP \-\^\-regexp=" wzorzec
U¿ywa
.I wzorca
jako wzorca; u¿yteczne do ochronienia wzorów zaczynaj±cych siê od
.BR \- .
.TP
.BR \-F ", " \-\^\-fixed-strings
Interpretuje
.I wzorzec
jako listê ³añcuchów o sta³ej d³ugo¶ci, oddzielonych znakami nowej
linii, które nale¿y dopasowaæ ka¿dy z osobna.
.TP
.BI \-f " plik" "\fR,\fP \-\^\-file=" plik
Pobiera wzorce z
.IR plik ,
po jednym z ka¿dej linii.  Plik pusty zawiera zero wzorców, nie pasuj±c
do niczego.
.TP
.BR \-G ", " \-\^\-basic-regexp
Interpretuje
.I wzorzec
jako podstawowe wyra¿enie regularne (zobacz ni¿ej).  Jest to zachowanie
domy¶lne.
.TP
.BR \-H ", " \-\^\-with-filename
Dla ka¿dego dopasowania wypisuje nazwê pliku.
.TP
.BR \-h ", " \-\^\-no-filename
.B \-h, --no-filename
Wy³±cza poprzedzanie wyników nazwami plików podczas przeszukiwania
wielu plików.
.TP
.B \-\^\-help
Wypisuje krótki tekst pomocy.
.TP
.BR \-I
Przetwarza plik binarny tak, jakby nie zawiera³ on pasuj±cych danych; jest
to równowa¿ne opcji
.BR \-\^\-binary-files=without-match .
.TP
.BR \-i ", " \-\^\-ignore-case
Ignoruje rozró¿nienia w wielko¶ci liter we
.I wzorcu
oraz w plikach wej¶ciowych.
.TP
.BR \-L ", " \-\^\-files-without-match
Wy³±cza normalne wyj¶cie; zamiast niego wypisuje nazwê ka¿dego pliku,
z którego normalnie nie wypisano by ¿adnego wyj¶cia.  Przeszukiwanie
zakoñczy siê na pierwszej pasuj±cej linii.
.TP
.BR \-l ", " \-\^\-files-with-matches
Wy³±cza normalne wyj¶cie; zamiast niego wypisuje nazwê ka¿dego pliku,
z którego normalnie wypisano by jakie¶ wyj¶cie.  Przeszukiwanie
zakoñczy siê na pierwszej pasuj±cej linii.
.TP
.B \-\^\-mmap
Je¶li to mo¿liwe, do odczytu wej¶cia korzysta z funkcji systemowej
.BR mmap (2)
zamiast domy¶lnej
.BR read (2).
W pewnych sytuacjach
.B \-\^\-mmap
daje lepsz± wydajno¶æ. Mo¿e jednak spowodowaæ niezdefiniowane zachowanie
(³±cznie ze zrzutem rdzenia) je¶li podczas dzia³ania
.B grep
plik wej¶ciowy siê skurczy lub wyst±pi b³±d wej¶cia/wyj¶cia.
.TP
.BR \-n ", " \-\^\-line-number
Poprzedza ka¿d± liniê wyj¶cia numerem linii z odpowiedniego pliku
wej¶ciowego.
.TP
.BR \-q ", " \-\^\-quiet ", " \-\^\-silent
Po cichu; wy³±cza normalne wyj¶cie.  Przeszukiwanie zakoñczy siê na
pierwszej pasuj±cej linii. Zobacz tak¿e poni¿ej opcje
.B \-s
lub
.BR \-\^\-no-messages .
.TP
.BR \-r ", " \-\^\-recursive
Czyta wszystkie pliki pod ka¿dym katalogiem, rekurencyjnie;
jest to równowa¿ne opcji
.BR "\-d recurse" .
.TP
.BR \-s ", " \-\^\-no-messages
Wy³±cza komunikaty b³êdów o plikach nieistniej±cych lub nie do odczytania.
Uwaga o przeno¶no¶ci: w przeciwieñstwie do \s-1GNU\s0
.BR grep ,
tradycyjny
.B grep
nie by³ zgodny z \s-1POSIX.2\s0, gdy¿ brakowa³o mu opcji
.B \-q
a opcja
.B \-s
zachowywa³a siê jak opcja
.B \-q
z \s-1GNU\s0
.BR grep .
Skrypty pow³oki, które maj± byæ przeno¶ne na tradycyjny 
.B grep
powinny unikaæ zarówno
.BR \-q ,
jak i
.B \-s
i zamiast tego przekierowywaæ wyj¶cie do /dev/null.
.TP
.BR \-U ", " \-\^\-binary
Traktuje plik jako binarny.  Domy¶lnie, w DOS-ie i MS Windows,
.BR grep
zgaduje typ pliku spogl±daj±c na zawarto¶æ pierwszych 32 kB przeczytanych
z pliku.  Je¶li zdecyduje, ¿e plik jest tekstowy, udziera znaki CR
z oryginalnej zawarto¶ci pliku (po to ¿eby wyra¿enia regularne z
.B ^
i
.B $
dzia³a³y poprawnie).  Podanie
.B \-U
wy³±cza to zgadywanie, powoduj±c, ¿e wszystkie pliki s± czytane i
przekazywane mechanizmowi dopasowywuj±cemu dos³ownie; je¶li plik jest
plikiem tekstowym z parami CR/LF na koñcu linii, spowoduje to, ¿e 
niektóre wyra¿enia regularne nie zadzia³aj±.  Opcja ta nie dzia³a
na platformach innych ni¿ MS-DOS i MS Windows.
.TP
.BR \-u ", " \-\^\-unix-byte-offsets
Raportuje offsety bajtowe w stylu Unixowym.  Prze³±cznik ten powoduje, ¿e
.B grep
raportuje offsety bajtowe tak, jakby plik by³ plikiem tekstowym typu
Uniksowego, tj. z udartymi znakami CR.  Da to rezultaty identyczne jak
uruchomienie 
.B grepa
na maszynie Uniksowej.  Opcja ta nie wywo³uje ¿adnego efektu, chyba ¿e u¿yto
tak¿e opcji
.BR \-b ;
nie dzia³a na platformach innych ni¿ MS-DOS i MS Windows.
.TP
.BR \-V ", " \-\^\-version
Wypisuje numer wersji
.B grepa
na standardowe wyj¶cie b³êdów.  Ów numer wersji powinno siê za³±czaæ
we wszystkich zg³oszeniach b³êdów (patrz ni¿ej).
.TP
.BR \-v ", " \-\^\-invert-match
Odwraca sens dopasowania, wybiera linie niepasuj±ce.
.TP
.BR \-w ", " \-\^\-word-regexp
Wybiera tylko te linie, w których dopasowania wzorca tworz± ca³e s³owa.
Przeprowadzany test polega na tym, ¿e dopasowywany podci±g musi albo 
znajdowaæ siê na pocz±tku linii, albo byæ poprzedzony znakiem nie
tworz±cym s³owa.  Podobnie, musi albo znajdowaæ siê na koñcu linii,
albo musi nastêpowaæ po nim znak nie tworz±cy s³owa.  Znakami
tworz±cymi s³owa s± litery, cyfry i znak podkre¶lenia.
.TP
.BR \-x ", " \-\^\-line-regexp
Wybiera tylko te dopasowania, które dok³adnie pasuj± do ca³ej linii.
.TP
.B \-y
Przestarza³y synonim
.BR \-i .
.TP
.BR \-Z ", " \-\^\-null
Zamiast znaku, który normalnie wystêpuje po nazwie pliku wypisuje bajt
zerowy ( \s-1ASCII\s0
.BR NUL ).
Na przyk³ad,
.B "grep \-lZ"
wypisuje po nazwie pliku bajt zerowy, zamiast, jak zwykle, znaku nowej linii.
Opcja ta powoduje, ¿e wyj¶cie jest jednoznaczne, nawet przy nazwach plików
zawieraj±cych niecodzienne znaki, jak znak nowej linii. Mo¿e byæ
wykorzystywana z poleceniami typu:
.BR "find \-print0" ,
.BR "perl \-0" ,
.B "sort \-z"
czy
.BR "xargs \-0" ,
umo¿liwiaj±c przetwarzanie plików o dowolych nazwach, nawet zawieraj±cych
znaki nowej linii.
.SH "WYRA¯ENIA REGULARNE"
.PP
Wyra¿enie regularne to wzorzec opisuj±cy zbiór ³añcuchów.  Wyra¿enia
regularne s± zbudowane analogicznie do wyra¿eñ arytmetycznych, przez
zastosowanie do po³±czenia mniejszych wyra¿eñ rozmaitych operatorów.
.PP
.B grep
rozumie dwie ró¿ne wersje sk³adni wyra¿eñ regularnych: "podstawow±"
i "rozszerzon±".  W \s-1GNU\s0\
.B grep
obie te sk³adnie przy u¿yciu nie ró¿ni± siê zakresem dostêpnych mo¿liwo¶ci.
W innych implementacjach podstawowe wyra¿enia regularne s± mniej rozbudowane.
Poni¿szy opis stosuje siê do rozszerzonych wyra¿eñ regularnych;
ró¿nice w stosunku do wyra¿eñ podstawowych podsumowano na koñcu.
.PP
Fundamentalnymi "cegie³kami" s± wyra¿enia regularne pasuj±ce do pojedynczego
znaku.  Wiêkszo¶æ znaków, w tym wszystkie litery i cyfry, to wyra¿enia
regularne pasuj±ce do samych siebie.  Ka¿dy metaznak maj±cy specjalne
znaczenie mo¿e byæ cytowany przez poprzedzenie go odwrotnym uko¶nikiem.
.PP
Lista znaków zawarta miêdzy
.B [
a
.B ]
pasuje do ka¿dego pojedynczego znaku na tej li¶cie; je¶li pierwszym znakiem
listy jest daszek
.BR ^ ,
pasuje wtedy ona do ka¿dego znaku
.I nie
znajduj±cego siê na li¶cie.  Dla przyk³adu, wyra¿enie regularne
.B [0123456789]
pasuje do ka¿dej pojedynczej cyfry.  Zakres znaków ASCII podaæ mo¿na
okre¶laj±c znak pierwszy i ostatni, oddzielone my¶lnikiem.
I na koniec: predefiniowano pewne nazwane klasy znaków.  Ich nazwy
mówi± same za siebie, i s± to:
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
Na przyk³ad
.B [[:alnum:]]
oznacza
.BR [0-9A-Za-z] ,
z tym wyj±tkiem, ¿e ta druga forma zale¿y od kodowania znaków ASCII
i ustawieñ regionalnych \s-1POSIX\s0 (locale), podczas
gdy pierwsza jest przeno¶na.
(Zauwa¿, ¿e nawiasy kwadratowe w nazwach klas s± czê¶ci± nazw symbolicznych
i musz± byæ umieszczone dodatkowo, oprócz pary nawiasów ograniczaj±cej sam±
listê).
Wiêkszo¶æ metaznaków traci swoje szczególne znaczenie wewn±trz list.  Aby
umie¶ciæ tam dos³owny
.BR ] ,
umie¶æ go jako pierwszy na li¶cie.  Podobnie, aby umie¶ciæ dos³owny
.BR ^ ,
umie¶æ go gdziekolwiek poza pierwszym miejscem.  W koñcu, aby umie¶ciæ
dos³owny
.BR \- ,
umie¶æ go na ostatku.
.PP
Kropka
.B .
pasuje do ka¿dego pojedynczego znaku.
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
s± metaznakami, które pasuj± odpowiednio do ³añcucha pustego na pocz±tku
i na koñcu linii.  Symbole
.B \e<
oraz
.B \e>
pasuj± odpowiednio do ³añcucha pustego na pocz±tku i na koñcu s³owa.
Symbol
.B \eb
pasuje do ³añcucha pustego na krawêdzi s³owa, za¶
.B \eB
pasuje do pustego ³añcucha zak³adaj±c, ¿e 
.I nie
jest on na krawêdzi s³owa.
.PP
Po wyra¿eniu regularnym mo¿e nastêpowaæ jeden z kilku operatorów
powtórzenia:
.PD 0
.TP
.B ?
Poprzedzaj±cy element jest opcjonalny i pasuje nie wiêcej ni¿ raz.
.TP
.B *
Poprzedzaj±cy element bêdzie dopasowany zero lub wiêcej razy.
.TP
.B +
Poprzedzaj±cy element bêdzie dopasowany jeden lub wiêcej razy.
.TP
.BI { n }
Poprzedzaj±cy element pasuje dok³adnie 
.I n
razy.
.TP
.BI { n ,}
Poprzedzaj±cy element pasuje
.I n
lub wiêcej razy.
.TP
.BI {, m }
Poprzedzaj±cy element jest opcjonalny i pasuje co najwy¿ej
.I m
razy.
.TP
.BI { n , m }
Poprzedzaj±cy element pasuje co najmniej
.I n
razy, ale nie wiêcej ni¿
.I m
razy.
.PD
.PP
Dwa wyra¿enia regularne mo¿na ze sob± z³±czyæ (skonkatenowaæ);
do wynikowego wyra¿enia regularnego pasuje ka¿dy ci±g utworzony
przez z³±czenie dowolnych dwóch ci±gów, które odpowiednio pasuj±
do z³±czonych podwyra¿eñ.
.PP
Dwa wyra¿enia regularne mo¿na po³±czyæ operatorem infiksowym (wrostkowym)
.BR | ;
do wynikowego wyra¿enia regularnego pasuje dowolny ci±g pasuj±cy
do jednego b±d¼ do drugiego z podwyra¿eñ.
.PP
Powtarzanie ma priorytet nad ³±czeniem, które z kolei bierze
górê nad alternatyw±.  Ca³e wyra¿enie regularne mo¿na uj±æ
w nawiasy, celem uniewa¿nienia tych regu³ priorytetowych.
.PP
Wsteczne odniesienie
.BI \e n\c
\&, gdzie
.I n
jest pojedyncz± cyfr±, dopasowuje podci±g poprzednio dopasowany
.IR n \-tym
ujêtym w nawiasy podwyra¿eniem wyra¿enia regularnego.
.PP
W podstawowych wyra¿eniach regularnych metaznaki
.BR ? ,
.BR + ,
.BR { ,
.BR | ,
.BR (
oraz
.BR )
trac± swoje szczególne znaczenie; zamiast nich nale¿y u¿yæ wersji
z odwrotnym uko¶nikiem:
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
jako metaznaku. Niektóre implementacje
udostêpniaj± zamiast niego
.BR \e{ ,
wiêc przeno¶ne skrypty powinny unikaæ 
.B {
we wzorcach
.BR egrep ,
a do dopasowywania dos³ownego znaku
.B {
stosowaæ
.BR [{] .
.PP
\s-1GNU\s0
.B egrep
usi³uje obs³ugiwaæ tradycyjny sposób u¿ycia zak³adaj±c, ¿e
.B {
nie posiada szczególnego znaczenia je¶li by³by on pocz±tkiem nieprawid³owego
okre¶lenia liczby powtórzeñ. Na przyk³ad, polecenie pow³oki
.B "egrep '{1'"
szuka dwuznakowego ³añcucha
.BR {1 ,
zamiast zg³aszaæ b³±d sk³adni w wyra¿eniu regularnym.
\s-1POSIX.2\s0 pozwala na takie zachowanie jako rozszerzenie standardu,
ale przeno¶ne skrypty powinny go unikaæ.
.SH "ZMIENNE ¦RODOWISKA"
.TP
.B GREP_OPTIONS
Ta zmienna okre¶la domy¶lne opcje, jakie zostan± umieszczone przed 
wszystkimi opcjami podanymi wprost.  Na przyk³ad, je¶li
.B GREP_OPTIONS
jest równe
.BR "'\-\^\-binary-files=without-match \-\^\-directories=skip'" ,
to
.B grep
zachowa siê tak, jakby podano
.B \-\^\-binary-files=without-match
i
.B \-\^\-directories=skip
przed ewentualnymi jawnymi opcjami.
Okre¶lenia opcji oddziela siê bia³ymi znakami.
Odwrotny uko¶nik cytuje nastêpny znak, zatem mo¿na go wykorzystaæ do podania
opcji zawieraj±cej bia³y znak lub odwrotny uko¶nik.
.TP
\fBLC_ALL\fP, \fBLC_MESSAGES\fP, \fBLANG\fP
Te zmienne podaj± ustawienie regionalne (locale)
.BR LC_MESSAGES ,
okre¶laj±ce jêzyk, jakiego
.B grep
ma u¿yæ w komunikatach.
Ustawienie locale jest okre¶lane przez pierwsz± z tych zmiennych, która
ma nadan± warto¶æ.
Je¶li nie istnieje ¿adna z nich, to stosowana jest amerykañska odmiana
angielskiego. Dzieje siê tak równie¿ w przypadku, gdy nie zainstalowano
katalogu z komunikatami lub je¶li
.B grep
nie zosta³ skompilowany z obs³ug± jêzyków narodowych (\s-1NLS\s0).
.TP
\fBLC_ALL\fP, \fBLC_CTYPE\fP, \fBLANG\fP
Te zmienne podaj± ustawienie regionalne (locale)
.B LC_CTYPE
okre¶laj±ce typ znaków, np. które z nich s± bia³ymi znakami.
Ustawienie locale jest okre¶lane przez pierwsz± z tych zmiennych, która
ma nadan± warto¶æ.
Je¶li nie istnieje ¿adna z nich, to stosowane jest ustawienie \s-1POSIX\s0.
Dzieje siê tak równie¿ w przypadku, gdy nie zainstalowano
katalogu z komunikatami lub je¶li
.B grep
nie zosta³ skompilowany z obs³ug± jêzyków narodowych (\s-1NLS\s0).
.TP
.B POSIXLY_CORRECT
Je¶li jest ustawiona, to
.B grep
zachowuje siê zgodnie z wymaganiami \s-1POSIX.2\s0; w przeciwnym razie
.B grep
zachowuje siê bardziej jak inne programy \s-1GNU\s0.
\s-1POSIX.2\s0 ¿±da, by opcje, które wystêpuj± po nazwach plików by³y
traktowane jak nazwy plików. Domy¶lnie za¶, opcje takie s± przesuwane
na pocz±tek listy argumentów i traktowane jak opcje.
Ponadto, \s-1POSIX.2\s0 wymaga, by nierozpoznane opcje by³y zg³aszane jako
"nielegalne" ("illegal"), ale poniewa¿ tak naprawdê nie naruszaj±
one prawa, domy¶lnie zg³aszane s± jako "nieprawid³owe" ("invalid").
.B POSIXLY_CORRECT
wy³±cza tak¿e \fB_\fP\fIN\fP\fB_GNU_nonoption_argv_flags_\fP, opisane
poni¿ej.
.TP
\fB_\fP\fIN\fP\fB_GNU_nonoption_argv_flags_\fP
(Tu
.I N
jest numerycznym identyfikatorem procesu
.BR grep a).
Je¶li
.IR i -tym
znakiem warto¶ci tej zmiennej ¶rodowiska jest
.BR 1 ,
to 
.IR i -ty
argument przekazany do
.B grep
nie jest uwa¿any za opcjê, nawet je¶li na ni± wygl±da.
Pow³oka mo¿e umie¶ciæ tê zmienn± w ¶rodowisku dla ka¿dego polecenia,
jakie uruchamia, podaj±c, które argumenty s± wynikiem rozwiniêcia nazw
plików i st±d nie powinny byæ traktowane jako opcje.
Zachowanie to jest dostêpne tylko z bibliotek± \s-1GNU\s0 C i tylko wtedy
gdy nie ustawiono
.BR POSIXLY_CORRECT .
.SH DIAGNOSTYKA
.PP
Normalnie status zakoñczenia równa siê 0 je¶li znaleziono dopasowania,
a 1 je¶li nie znaleziono ¿adnych.  Opcja
.B \-v
odwraca sens statusu zakoñczenia.  Status zakoñczenia równa siê 2 je¶li
wyst±pi³y b³êdy sk³adniowe we wzorcu, niedostêpne pliki wej¶ciowe lub
inne b³êdy systemowe.
.SH B£ÊDY
.PP
Zg³oszenia b³êdów wysy³aj, proszê, do
.BR bug-gnu-utils@gnu.org .
Upewnij siê, ¿e gdzie¶ w polu tematu ("Subject:") umie¶ci³e¶ s³owo "grep".
.PP
Du¿e liczniki powtórzeñ w konstrukcji
.BI { m , n }
mog± spowodowaæ, ¿e grep zu¿yje mnóstwo pamiêci.  Oprócz tego, pewne
inne niejasne wyra¿enia regularne wymagaj± czasu i przestrzeni
rosn±cej wyk³adniczo i mog± spowodowaæ, ¿e
.B grepowi
zabraknie pamiêci.
.PP
Wsteczne odwo³ania s± bardzo powolne i mog± wymagaæ czasu rosn±cego
wyk³adniczo.
.\" Work around problems with some troff -man implementations.
.br
