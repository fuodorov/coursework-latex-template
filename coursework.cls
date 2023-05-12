\NeedsTeXFormat{LaTeX2e}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coursework}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}%передаёт опции класса  kurs3 базовому классу extreport 
\ProcessOptions\relax
\LoadClass{extreport}%базовый класс


\usepackage{ifxetex}%автоматически определяет какие пакеты использовать если верстается документ XeLaTeX'ом или pdfLaTeX'ом
\ifxetex%вёрстка XeLaTeX'ом
	\RequirePackage[english,russian]{babel}%языковые пакеты. Языком по-умолчанию будет последний объявленный. Отвечает за перенос слов, включает использование правил типографского набора для выбранного язык 
	\usepackage{fontspec}      %% подготавливает загрузку шрифтов Open Type, True Type и др.
	\usepackage{xecyr}
	\defaultfontfeatures{Ligatures={TeX},Renderer=Basic}  %% свойства шрифтов по умолчанию
	\setmainfont[Ligatures={TeX,Historic},Scale=.97]{Times New Roman} %% задаёт основной шрифт документа
	\setsansfont{Comic Sans MS}   %% задаёт шрифт без засечек
	\setmonofont{Courier New}%шрифт будет применяться в окружении \verb 
	%конец раздела для вёрстки XeLaTeX'ом
\else
	% default: pdfLaTeX
	%кириллические шрифты с помощью пакета pscyr
	%\RequirePackage[mat]{pscyr}
	%\renewcommand{\rmdefault}{ftm}
	\RequirePackage[utf8]{inputenc}%кодировка
	%\usepackage[T1,T2A]{fontenc}%кодировка шрифта. Для русского языка по-умолчанию будет T2A. Для латиницы можно явно указать требуемую
	\RequirePackage[english,russian]{babel}%языковые пакеты. Языком по-умолчанию будет последний объявленный. Отвечает за перенос слов, включает использование правил типографского набора для выбранного язык 
\fi
%LATEX PSCyr 	Название шрифта
%fac 	Academy
%fad 	Advertisement
%faq 	AntiquaPSCyr
%fco 	College
%fcp 	CooperPSCyr
%fer 	ERKurierPSCyr
%fha 	HandbookPSCyr
%fjn 	JournalPSCyr
%flz 	Lazurski
%fma 	MagazinePSCyr
%fsv 	SouvenirPSCyr
%ftx 	TextbookPSCyr
%far 	ArialMT
%fcr 	CourierNewPSMT
%ftm 	TimesNewRomanPSMT

\RequirePackage{geometry} % Меняем поля страницы
\geometry{left=3cm}% левое поле
\geometry{right=1.5cm}% правое поле
\geometry{top=2cm}% верхнее поле
\geometry{bottom=2cm}% нижнее поле
\linespread{1.5}%интервал
%\usepackage{setspace}%гибкая настройка межстрочного интервала
\RequirePackage{array}%массивы и таблицы
\RequirePackage{titlesec} % меняем цифры у секций
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}

\usepackage{indentfirst}%абзацный отступ после заголовка раздела

\renewcommand{\labelenumi}{\arabic{enumi}.}% Меняем везде перечисления на цифра.цифра
\renewcommand{\theenumii}{.\arabic{enumii}}% Меняем везде перечисления на цифра.цифра
\renewcommand{\labelenumii}{\arabic{enumi}.\arabic{enumii}.}% Меняем везде перечисления на цифра.цифра
\renewcommand{\theenumiii}{.\arabic{enumiii}}% Меняем везде перечисления на цифра.цифра
\renewcommand{\labelenumiii}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}.}% Меняем везде перечисления на


%установить метаданные pdf файла
\newcommand\SetPDFmeta{
\makeatletter
\AtBeginDocument{
	\hypersetup{
		pdftitle = {\@title},
		pdfauthor = {\@author},
		pdfkeywords = {\@KeyWords},
	}
}
\makeatother
}
\addto\captionsrussian{%переименовать Оглавление
	\renewcommand{\contentsname}%
	{Содержание}%
}
\titleformat{\chapter}%изменить формат заголовка главы
{\normalfont\LARGE\bfseries}{\thechapter}{1em}{}


\bibliographystyle{gost}%стиль библиографии

\addto\captionsrussian{\def\figurename{Рисунок}}%замена подписей к рисункам

\newcommand\Organization[1]{\def\@Organization{#1}}%название организации
\newcommand\UpperOrganization[1]{\def\@UpperOrganization{#1}}%название вышестоящей организации
\newcommand\Faculty[1]{\def\@Faculty{#1}}%название факультета
\newcommand\Department[1]{\def\@Department{#1}}%название каферды
\newcommand\Group[1]{\def\@Group{#1}}%номер группы
\newcommand\Institute[1]{\def\@Institute{#1}}%название института
\newcommand\Laboratory[1]{\def\@Laboratory{#1}}%название подразделения, где выполнена работа
\newcommand\Superviser[1]{\def\@Superviser{#1}}%ФИО руководителя
\newcommand\SuperviserDegree[1]{\def\@SuperviserDegree{#1}}%учёная степень руководителя
\newcommand\KeyWords[1]{\def\@KeyWords{#1}}%ключевые слова
\newcommand\InputKeyWords{Ключевые слова: \@KeyWords.}%вставить ключевые слова
\newcommand\RefSource[1]{\def\@RefSource{#1}}%название файла с библиографией



\newcommand\ChapterWithoutNum[1]{{%вспомогательная команда для форматирования заголовка раздела без номера (Введение и т.п.)
		\normalfont\LARGE\bfseries\cleardoublepage\begin{center}{#1}\end{center}
		\addcontentsline{toc}{chapter}{#1}}
}

\addto{\captionsrussian}{\renewcommand{\bibname}{Список использованных источников}}%переименовать список литературы

\newcommand\References{
\addcontentsline{toc}{chapter}{\bibname}
\bibliography{\@RefSource}% библиография, несортированный гост
}




\newcommand\AbstractWithoutPage{
	{\normalfont\LARGE\bfseries\cleardoublepage\begin{center}Аннотация\end{center}}\thispagestyle{empty}\setcounter{page}{2}}%заголовок Аннотация
\newcommand\Abstract{
	{\normalfont\LARGE\bfseries\cleardoublepage\begin{center}Аннотация\end{center}}\setcounter{page}{2}}%заголовок Аннотация

\newcommand\Definitions{\ChapterWithoutNum{Определения}}%заголовок Определения с добавлением в оглавление без номера
\newcommand\Abbreviations{\ChapterWithoutNum{Сокращения и обозначения}}%заголовок Сокращения и обозначения с добавлением в оглавление без номера
\newcommand\Introduction{\ChapterWithoutNum{Введение}}%заголовок Введение с добавлением в оглавление без номера
\newcommand\Conclusion{\ChapterWithoutNum{Заключение}}%заголовок Заключение с добавлением в оглавление без номера

\newcounter{appendix}%счётчик приложений
\newcommand\Appendix{
	{\addtocounter{appendix}{1}\normalfont\LARGE\bfseries\cleardoublepage\begin{center}Приложение \Asbuk{appendix}\end{center}}
	\addcontentsline{toc}{chapter}{Приложение \Asbuk{appendix}}
	\setcounter{table}{0}
	\renewcommand{\thetable}{\Asbuk{appendix}.\arabic{table}}
	\setcounter{figure}{0}
	\renewcommand{\thefigure}{\Asbuk{appendix}.\arabic{figure}}

}%заголовок Приложение с добавлением в оглавление без номера, с увеличением счётчика



\renewcommand{\maketitle}{%шаблон титульного листа
	\begin{titlepage}

	\begin{center}%
		\@UpperOrganization
		\vspace{\baselineskip}
		
		\@Organization
	%	\vspace{1\baselineskip}
		
		\@Faculty
	%	\vspace{\baselineskip}
		
		\@Department
		\vspace{\baselineskip}
		
		КУРСОВАЯ РАБОТА
		
		\textbf{\@title}

	\end{center}%
	\vfill

	\begin{tabular}{>{\raggedright\arraybackslash}m{0.5\linewidth}>{\raggedright\arraybackslash}m{0.5\linewidth}}
	& Выполнил: студент гр. №\@Group \\
	& \@author\\
	& Работа выполнена в \\
	& \@Institute\\
	& \@Laboratory\\
	&\\
	& \textbf{Научный руководитель:}\\
 & \@SuperviserDegree\\
	& \@Superviser\\
	&Оценка научного руководителя:\\
	& \rule{0.8\linewidth}{0.5pt}\\
	& <<\rule{1.2cm}{0.5pt}>> \rule{3cm}{0.5pt} \the\year{} г.\\
\end{tabular}
	\vfill
	
	\begin{center}%
		Новосибирск --- \the\year{} г.
	\end{center}%

\end{titlepage}

}
