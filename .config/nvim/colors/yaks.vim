" Originally yoinked from
" https://github.com/thenewvu/vim-colors-blueprint/blob/master/colors/blueprint.vim


highlight clear

set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="yaks"

" Primary colors mostly stolen from
" https://github.com/ryanpcmcquen/sublime_witness/blob/master/Witness.sublime-color-scheme

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi          Normal guifg=#d3b58d    guibg=none    gui=none
hi          Cursor guifg=#2c4e6c    guibg=#90ee90 gui=none
hi         vCursor guifg=#2c4e6c    guibg=#90ee90 gui=none
hi         iCursor guifg=#2c4e6c    guibg=#90ee90 gui=none
hi      CursorLine guifg=none       guibg=#062625 gui=none
hi          LineNr guifg=lightgreen guibg=none    gui=none
hi    CursorLineNR guifg=none       guibg=none    gui=none

" -----------------
" - Number column -
" -----------------
hi    CursorColumn guifg=none    guibg=#305575 gui=none
hi      FoldColumn guifg=#80a8cb guibg=none    gui=none
hi      SignColumn guifg=#80a8cb guibg=none    gui=none
hi          Folded guifg=none    guibg=none    gui=none

" -------------------------
" - Window/Tab delimiters -
" -------------------------
hi       VertSplit guifg=lightgreen   guibg=none    gui=none
hi     ColorColumn guifg=none         guibg=#305575 gui=none
hi         TabLine guifg=none         guibg=none    gui=none
hi     TabLineFill guifg=none         guibg=none    gui=none
hi      TabLineSel guifg=none         guibg=none    gui=none
hi     FloatBorder guifg=none         guibg=none    gui=none
hi     NormalFloat guifg=none         guibg=none    gui=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi       Directory guifg=none    guibg=none    gui=underline
hi          Search guifg=#2c4e6c guibg=#ffffff gui=none
hi       IncSearch guifg=#2c4e6c guibg=#ffffff gui=none

" -----------------
" - Prompt/Status -
" -----------------
hi      StatusLine guifg=none guibg=none gui=none
hi    StatusLineNC guifg=none guibg=none gui=none
hi          WinBar guifg=none guibg=none gui=none
hi        WinBarNC guifg=none guibg=none gui=none
hi        WildMenu guifg=none guibg=none gui=none
hi        Question guifg=none guibg=none gui=none
hi           Title guifg=none guibg=none gui=none
hi         ModeMsg guifg=none guibg=none gui=none
hi         MoreMsg guifg=none guibg=none gui=none
hi         MsgArea guifg=none guibg=none gui=none


" --------------
" - Visual aid -
" --------------
hi      MatchParen guifg=none    guibg=none    gui=underline
hi          Visual guifg=#2c4e6c guibg=#ffffff gui=none
hi       VisualNOS guifg=#2c4e6c guibg=#ffffff gui=none
hi         NonText guifg=#2c4e6c guibg=none    gui=none
hi            Todo guifg=#ede0ab guibg=none    gui=bold
hi      Underlined guifg=none    guibg=none    gui=underline
hi           Error guifg=#edabb8 guibg=none    gui=none
hi        ErrorMsg guifg=#edabb8 guibg=none    gui=none
hi      WarningMsg guifg=#ede0ab guibg=none    gui=none
hi          Ignore guifg=none    guibg=none    gui=none
hi         Conceal guifg=#abede0 guibg=none    gui=none
hi      SpecialKey guifg=#abede0 guibg=none    gui=none

" --------------------------------
" Variable types
" --------------------------------
hi        Constant guifg=#79ffcf   guibg=none    gui=none
hi          String guifg=#0fdfaf   guibg=none    gui=none
hi StringDelimiter guifg=#80a8cb   guibg=none    gui=none
hi       Character guifg=#0fdfaf   guibg=none    gui=none
hi          Number guifg=lightblue guibg=none    gui=none
hi         Boolean guifg=lightblue guibg=none    gui=none
hi           Float guifg=none      guibg=none    gui=none

hi      Identifier guifg=none      guibg=none    gui=none
hi        Function guifg=none      guibg=none    gui=none

" --------------------------------
" Language constructs
" --------------------------------
hi         Comment guifg=#3fdf1f guibg=none    gui=italic

hi       Statement guifg=#b8edab guibg=none    gui=none
hi     Conditional guifg=#b8edab guibg=none    gui=none
hi          Repeat guifg=#b8edab guibg=none    gui=none
hi           Label guifg=#b8edab guibg=none    gui=none
hi        Operator guifg=#b8edab guibg=none    gui=none
hi         Keyword guifg=white   guibg=none    gui=none
hi       Exception guifg=#b8edab guibg=none    gui=none

hi         Special guifg=#abede0 guibg=none    gui=none
hi     SpecialChar guifg=#abede0 guibg=none    gui=none
hi             Tag guifg=#abede0 guibg=none    gui=none
hi       Delimiter guifg=##80a8cb guibg=none    gui=none
hi           Noise guifg=#80a8cb guibg=none    gui=none
hi  SpecialComment guifg=#ede0ab guibg=none    gui=none
hi           Debug guifg=#ede0ab guibg=none    gui=none

" ----------
" - C like -
" ----------
hi         PreProc guifg=#d3b58d    guibg=none    gui=none
hi         Include guifg=#d3b58d    guibg=none    gui=none
hi          Define guifg=#d3b58d    guibg=none    gui=none
hi           Macro guifg=#d3b58d    guibg=none    gui=none
hi       PreCondit guifg=#d3b58d    guibg=none    gui=none

hi            Type guifg=lightgreen guibg=none    gui=none
hi    StorageClass guifg=#80a8cb    guibg=none    gui=none
hi       Structure guifg=lightgreen guibg=none    gui=none
hi         Typedef guifg=lightgreen guibg=none    gui=none

" --------------------------------
hi         DiffAdd guifg=#b8edab guibg=#2c4e6c gui=none
hi      DiffChange guifg=#ede0ab guibg=#2c4e6c gui=none
hi      DiffDelete guifg=#edabb8 guibg=#2c4e6c gui=none
hi        DiffText guifg=#ede0ab guibg=#7f7f43 gui=none
hi        DiffFile guifg=none    guibg=none    gui=underline


" --------------------------------
" Completion menu
" --------------------------------
hi           Pmenu guifg=#abede0    guibg=none    gui=none
hi        PmenuSel guifg=#abede0    guibg=none    gui=standout
hi       PmenuSbar guifg=#abede0    guibg=none    gui=standout
hi      PmenuThumb guifg=#abede0    guibg=none    gui=none

" --------------------------------
" Spelling
" --------------------------------
hi        SpellBad guifg=#ede0ab guibg=#7f7f43 gui=underline
hi        SpellCap guifg=#ede0ab guibg=#7f7f43 gui=underline
hi      SpellLocal guifg=#ede0ab guibg=#7f7f43 gui=underline
hi       SpellRare guifg=#ede0ab guibg=#7f7f43 gui=underline

" --------------------------------
" flailing
" --------------------------------
hi CmpGhostText guifg=lightblue guifg=none gui=italic

hi link     zigVarDecl    Keyword
hi link   zigExecution    Keyword


"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------

hi  link diffAdded               DiffAdd
hi  link diffRemoved             DiffDelete
hi  link diffLine                DiffFile
hi  link diffIndexLine           DiffFile
hi  link diffSubName             DiffFile

hi! link gitDateHeader           gitIdentityHeader
hi! link gitIdentityHeader       gitIdentityKeyword
hi! link gitIdentityKeyword      Label
hi! link gitNotesHeader          gitKeyword
hi! link gitReflogHeader         gitKeyword
hi! link gitKeyword              Keyword
hi! link gitIdentity             String
hi! link gitEmailDelimiter       Delimiter
hi! link gitEmail                Special
hi! link gitDate                 Number
hi! link gitMode                 Number
hi! link gitHashAbbrev           gitHash
hi! link gitHash                 Identifier
hi! link gitReflogMiddle         gitReference
hi! link gitReference            Function
hi! link gitStage                gitType
hi! link gitType                 Type
hi! link gitDiffAdded            diffAdded
hi! link gitDiffRemoved          diffRemoved
hi! link gitcommitDiscardedFile  diffRemoved
hi! link gitcommitSelectedFile   diffAdded
hi! link gitcommitUnmergedFile   ErrorMsg
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile

" hi! GitGutterAdd     guifg=#437f43 guibg=#437f43
" hi! GitGutterChange  guifg=#7f7f43 guibg=#7f7f43
" hi! GitGutterDelete  guifg=#a05454 guibg=#a05454

hi! link       LspDiagnosticsVirtualTextError ErrorMsg
hi! link     LspDiagnosticsVirtualTextWarning WarningMsg
hi! link LspDiagnosticsVirtualTextInformation WarningMsg
hi! link        LspDiagnosticsVirtualTextHint WarningMsg

hi! link DiagnosticError      LspDiagnosticsVirtualTextError
hi! link DiagnosticWarn     LspDiagnosticsVirtualTextWarning
hi! link DiagnosticInfo LspDiagnosticsVirtualTextInformation
hi! link DiagnosticHint        LspDiagnosticsVirtualTextHint

hi! link LspDiagnosticsUnderlineError        ErrorMsg
hi! link LspDiagnosticsUnderlineWarning      WarningMsg
hi! link LspDiagnosticsUnderlineInformation  WarningMsg
hi! link LspDiagnosticsUnderlineHint         WarningMsg

hi! link DiagnosticUnderlineError       LspDiagnosticsUnderlineError
hi! link DiagnosticUnderlineWarn      LspDiagnosticsUnderlineWarning
hi! link DiagnosticUnderlineInfo  LspDiagnosticsUnderlineInformation
hi! link DiagnosticUnderlineHint         LspDiagnosticsUnderlineHint

" zig

hi! link zigMacro       Keyword
hi! link zigDecNumber   Number
hi! link zigBoolean     Boolean

hi! link @comment   Comment  " line and block comments
" hi! link @error     Normal    " syntax/parser errors
hi! link @none      Normal     " completely disable the highlight
hi! link @preproc   PreProc  " various preprocessor directives & shebangs
hi! link @define    Define   " preprocessor definition directives
hi! link @operator  Operator " symbolic operators (e.g. `+` / `*`)

" Punctuation

hi! link @punctuation.delimiter  Delimiter " delimiters (e.g. `;` / `.` / `,`)
hi! link @punctuation.bracket    Delimiter   " brackets (e.g. `()` / `{}` / `[]`)
hi! link @punctuation.special    Delimiter   " special symbols (e.g. `{}` in string interpolation)

" Literals

hi! link @string             String    " string literals
hi! link @string.regex       String    " regular expressions
hi! link @string.escape      String    " escape sequences
hi! link @string.special     String    " other special strings (e.g. dates)

hi! link @character          Character " character literals
hi! link @character.special  Character " special characters (e.g. wildcards)

hi! link @boolean            Boolean           " boolean literals
hi! link @number             Number            " numeric literals
hi! link @float              Float             " floating-point number literals

" Functions

hi! link @function          Define " function definitions
hi! link @function.builtin  Function " built-in functions
hi! link @function.call     Function " function calls
hi! link @function.macro    Define " preprocessor macros

hi! link @method            Define      " method definitions
hi! link @method.call       Function      " method calls

hi! link @constructor       Normal      " constructor calls and definitions
hi! link @parameter         Identifier        " parameters of a function

" Keywords

hi! link @keyword           Keyword " various keywords
hi! link @keyword.function  Keyword " keywords that define a function (e.g. `func` in Go, `def` in Python)
hi! link @keyword.operator  Operator " operators that are English words (e.g. `and` / `or`)
hi! link @keyword.return    Keyword " keywords like `return` and `yield`

hi! link @conditional       Conditional " keywords related to conditionals (e.g. `if` / `else`)
hi! link @repeat            Repeat " keywords related to loops (e.g. `for` / `while`)
hi! link @debug             Debug " keywords related to debugging
hi! link @label             Label " GOTO and other labels (e.g. `label:` in C)
hi! link @include           Include " keywords for including modules (e.g. `import` / `from` in Python)
hi! link @exception         Exception " keywords related to exceptions (e.g. `throw` / `catch`)

" Types

hi! link @type                   Type       " type or class definitions and annotations
hi! link @type.builtin           Type       " built-in types
hi! link @type.definition        Type       " type definitions (e.g. `typedef` in C)
hi! link @type.qualifier         StorageClass       " type qualifiers (e.g. `const`)

hi! link @storageclass           StorageClass          " visibility/life-time modifiers
hi! link @attribute              StorageClass             " attribute annotations (e.g. Python decorators)
hi! link @field                  Identifier                 " object and struct fields
hi! link @property               Identifier              " similar to `@field`

" Identifiers

hi! link @variable           Identifier " various variable names
hi! link @variable.builtin   Identifier " built-in variable names (e.g. `this`)

hi! link @constant           Constant  " constant identifiers
hi! link @constant.builtin   Constant  " built-in constant values
hi! link @constant.macro     Define  " constants defined by the preprocessor

hi! link @namespace         Define        " modules or namespaces
hi! link @symbol            Define        " symbols or atoms

" Text
" Mainly for markup languages.

hi! link @text                   Normal         " non-structured text
hi! link @text.strong            Special         " bold text
hi! link @text.emphasis          Special         " text with emphasis
hi! link @text.underline         Underlined        " underlined text
hi! link @text.strike            Comment " strikethrough text
hi! link @text.title             Title " text that is part of a title
hi! link @text.literal           Special " literal or verbatim text
hi! link @text.uri               Special " URIs (e.g. hyperlinks)
hi! link @text.math              Special " math environments (e.g. `$ ... $` in LaTeX)
hi! link @text.environment       Special " text environments of markup languages
hi! link @text.environment.name  Special " text indicating the type of an environment
hi! link @text.reference         Special " text references, footnotes, citations, etc.

hi! link @text.todo              Todo             " todo notes
hi! link @text.@todo             Todo             " todo notes
hi! link @text.note              Todo             " info notes
hi! link @text.@note             Todo             " fixme notes
hi! link @text.fixme             Todo             " fixme notes
hi! link @text.@fixme            Todo             " fixme notes
hi! link @text.warning           WarningMsg       " warning notes
hi! link @text.danger            ErrorMsg         " danger/error notes

hi! link @text.diff.add          DiffAdd         " added text (for diff files)
hi! link @text.diff.delete       DiffDelete      " deleted text (for diff files)

" Tags
" Used for XML-like tags.

hi! link @tag            Tag " XML tag names
hi! link @tag.attribute  Identifier " XML tag attributes
hi! link @tag.delimiter  Delimiter " XML tag delimiters

" Conceal

hi! link @conceal  Conceal " for captures that are only used for concealing
" @conceal must be followed by (#set! conceal "").

" Spell

" hi! link @spell    Normal   " for defining regions to be spellchecked
" hi! link @nospell  Normal " for defining regions that should NOT be spellchecked

" Locals

hi! link @definition             Define " various definitions
hi! link @definition.constant    Define " constants
hi! link @definition.function    Define " functions
hi! link @definition.method      Define " methods
hi! link @definition.var         Define " variables
hi! link @definition.parameter   Define " parameters
hi! link @definition.macro       Define " preprocessor macros
hi! link @definition.type        Define " types or classes
hi! link @definition.field       Define " fields or properties
hi! link @definition.enum        Define " enumerations
hi! link @definition.namespace   Define " modules or namespaces
hi! link @definition.import      Define " imported names
hi! link @definition.associated  Define " the associated type of a variable

hi! link @scope                  Define             " scope block
hi! link @reference              Define             " identifier reference

