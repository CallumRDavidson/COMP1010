%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                     ssltexposter.cls                             %%
%%                                                                  %%
%% Latex class for posters for Universidade Federal de Goiás        %%
%% Available at httpsgithub.comaltinodantasssltexposter        %%
%%                                                                  %%
%% Copyright (C) 2018 Altino Dantas and I4Soft research group       %%
%%                                                                  %%
%% This project is based on the .cls at                             %%
%% httpsgithub.comharveymuddcollegehmcposter-class.            %%
%% This program is free software; you can redistribute it andor    %%
%% modify it under the terms of the GNU General Public License as   %%
%% published by the Free Software Foundation; either version 2 of   %%
%% the License, or (at your option) any later version.              %%
%%                                                                  %%  
%% This program is distributed in the hope that it will be useful,  %%
%% but WITHOUT ANY WARRANTY; without even the implied warranty of   %%
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the    %%
%% GNU General Public License for more details.                     %%
%%                                                                  %%
%% Contact Altino Dantas altinoneto@ing.ssl.br                   %%
%%          Institute of Informatic                                 %%    
%%          Universidade Federal de Goiás - Brazil                  %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NeedsTeXFormat{LaTeX2e}
ProvidesClass{ssltexposter}[20181107 INFssl LaTeX poster class]

%%% Declare and set some options.

%% Set up if for i4soft template.
newifif@isoft
@isoftfalse

%% Providing the i4soft document-class options.
DeclareOption{isoft}{@isofttrue}

DeclareOption{PassOptionsToClass{CurrentOption}{article}}

ExecuteOptions{isoft}
ProcessOptions

LoadClass{article}

%% Require some packages.
RequirePackage{sectsty}
RequirePackage{ifthen}
RequirePackage{mathpazo}
RequirePackage[scaled=0.95]{helvet}
RequirePackage[pages=some,scale=1,angle=0,opacity=1]{background}
renewcommand{ttdefault}{pcr}
RequirePackage{sectsty}
RequirePackage[font=small,font=sf,labelfont=bf]{caption}[20050628]
RequirePackage{graphics}
RequirePackage{xcolor}
RequirePackage{multicol}
RequirePackage{fancyhdr}
RequirePackage{etoolbox}

%% Set some dimensions for layout.
setlength{paperwidth}{90cm}
setlength{paperheight}{120cm}
setlength{textwidth}{83.5cm}
setlength{textheight}{94.5cm}

setlength{oddsidemargin}{1.0cm}
setlength{evensidemargin}{oddsidemargin}
setlength{topmargin}{-0.0in}
setlength{headheight}{530pt}
setlength{headsep}{-1.2in}
setlength{footskip}{1in}
setlength{voffset}{0pt}
setlength{hoffset}{0pt}

%% Defining colors.
definecolor{gold}{cmyk}{0,0.2,0.5,0.3}
definecolor{black}{rgb}{0,0,0}
definecolor{dkblue}{rgb}{0,0,0.47}
definecolor{ssllhblue}{rgb}{.65,.75,0.89}
definecolor{ssldkblue}{rgb}{0.0,0.39,.67}

%% Redefine the named font sizes so we can keep most of the code.
renewcommand{LARGE}{fontsize{76pt}{82pt}selectfont}
renewcommand{Large}{fontsize{52pt}{58pt}selectfont}
renewcommand{large}{fontsize{42pt}{48pt}selectfont}
renewcommand{normalsize}{fontsize{32pt}{38pt}selectfont}
renewcommand{small}{fontsize{26pt}{32pt}selectfont}
renewcommand{tiny}{fontsize{34pt}{36pt}selectfont}
renewcommand{footnotesize}{fontsize{20pt}{26pt}selectfont}

%%% Define some new fields for use in the headertitlefooter.

%% For an i4soft poster.
if@isoft
defclass#1{gdef@class{#1}}
def@class{@latex@warning@no@line{No noexpandclass given}}

providecommand{advisor}[1]{%
  gdef@advisor{#1}}

providecommand{reader}[1]{%
  gdef@reader{#1}}
fi

%% Shared Definitions
defemail#1{gdef@email{#1}}
def@email{@latex@warning@no@line{No noexpandemail given}}

defdepartment#1{gdef@department{#1}}
def@department{@latex@warning@no@line{No noexpanddepartment given}}

% defyear#1{gdef@year{#1}}
% def@year{@latex@warning@no@line{No noexpandyear given}}

providecommand{conference}[1]{%
  gdef@conference{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%            set commands             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Deal with separating columns.
setlength{columnsep}{1.5in}
newcommand{setcolumnseprule}[1]{setlength{columnseprule}{#1}}

%% Define 'setbackground' to provide background options.
newcommandsetbackground[2][scale=1]{%
    BgThispage
    backgroundsetup{
        contents = {includegraphics[#1]{backgrounds#2}}
    }
}
setbackground{1} % put background 1 by default.

%% Set up the header.

newlength{ignored@length}
newcommand{set@ess}[1]{%
  renewcommand{and}{%
    globaldef@ess{s}%
  }%
  globaldef@ess{}%
  settowidth{ignored@length}{#1}
}
newcommand{@andcommaspace}{, }

%% Lay out the header.
pagestyle{fancy}
fancyhf{}  % Clear all fields.

%%% Set up the header for the poster.

%% For i4soft.
if@isoft

% Variable to adjust logos vertical position.
newcommand{logobox}{def @logobox}

newcommand{setlogos}[3][M]{ 
    
    % Positions [T] = 13cm  [M] = 10cm  [B] = 5cm.
    ifthenelse{equal{#1}{T}}{
        logobox{13cm}
    }{
        ifthenelse{equal{#1}{M}}{
            logobox{10cm}
        }{
            logobox{5cm}
        }
    }

    ifthenelse{ not equal{#2}{} }{ %% Include the UFABC Logo whether it was set.
        fancyhead[L]{
            raisebox{@logobox}{ % Performs logo vertical position. 
                begin{minipage}{3.5in}
                    resizebox{3.5in}{!}{includegraphics{#2}}
                end{minipage}
            }
        }
    }{}
    
    ifthenelse{ not equal{#3}{} }{ %% Include the SSL Logo whether it was set.
        fancyhead[R]{
            raisebox{@logobox}{ % Performs logo vertical position.
                begin{minipage}{6.5in}
                    resizebox{6.5in}{!}{includegraphics{#3}}
                end{minipage}
            }
        }
    }{}
}

fi

%% Command to able resizing title.
newcommand{settitlesize}[2]{
    renewcommand{LARGE}{fontsize{#1}{#2}selectfont}
}

%% Command to able resizing the text of the content .
newcommand{setcontentfontesize}[2]{
    renewcommand{normalsize}{fontsize{#1}{#2}selectfont}
}

%% Command to able resizing the email (samll) font size.
newcommand{setemailfontesize}[2]{
    renewcommand{small}{fontsize{#1}{#2}selectfont}
}

%% For i4soft
if@isoft
fancyhead[C]{%
  begin{center}
    % {color{ssllhblue}largetextsf{@class}[0.5em]}%
    {color{white}LARGEtextsf{textbf{@title}}[0.5em]}
    {color{yellow!95!black}largetextsf{@author}[0.5em]}
    % {color{white}largetextsf{@department}[0.9em]}
    {color{white}tinytextsf{@email}[4.0em]}
  end{center}
}
fi

%% Define the footer.
fancyfoot[C]{%
  ifthenelse{isundefined{@conference}}%
  {}% Do nothing.
  {textcolor{white}{textbf{@conference}}}
}

fancyfoot[L]{%
  ifthenelse{isundefined{@advisor}}%
  {}% Do nothing.
  {textcolor{white}{[-0.2em]
      set@ess{@advisor}%
      textbf{Orientador@ess}
      globalletand@andcommaspace
      @advisor%
    }
  }quad%
  ifthenelse{isundefined{@reader}}%
  {}% Do nothing.
  {textcolor{black}{%
      set@ess{@reader}%
      textbf{Reader@ess}
      globalletand@andcommaspace
      @reader%
    }
  }
}


renewcommand{headrulewidth}{0pt}
renewcommand{footrulewidth}{0pt}


%%% Colorize header and footer rules.
%%% This code taken from fancyhdr.sty; written by Piet van Oostrum.

newcommand{@rulecolor}{gold}

renewcommand{footrule}{{color{@rulecolor}if@fancyplainletfootrulewidthplainfootrulewidthfi
    vskip-footruleskipvskip-footrulewidth
    hrule@widthheadwidth@heightfootrulewidthvskipfootruleskip}}
renewcommand{headrule}{{color{@rulecolor}if@fancyplainletheadrulewidthplainheadrulewidthfi
    hrule@heightheadrulewidth@widthheadwidth vskip-headrulewidth}}
%%% End code from fancyhdr.sty.

setlength{multicolsep}{2em}

newenvironment{poster}{
    thispagestyle{fancy}
    begin{multicols}{2}
    }
    {end{multicols}
}

renewenvironment{figure}
               {def@captype {figure}}
               {}

renewenvironment{table}
               {def@captype {table}}
               {}

%%% Make section headers sans-serif.

allsectionsfont{sffamily}

%%% Suppress section numbering.
renewcommand{@seccntformat}[1]{relax}

newcommand{setsectioncolor}[1]{
    sectionfont{color{#1}}     
}

AtBeginEnvironment{figure}{addvspace{1.5cm}}AtEndEnvironment{figure}{addvspace{1.5cm}}