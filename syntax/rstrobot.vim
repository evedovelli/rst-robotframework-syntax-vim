"=============================================================================
" File:         syntax/rstrobot.vim
" Author:       Estevan Vedovelli
" Version:      0.0.1
"------------------------------------------------------------------------
" Description:
"       Syntax file for Robot test framework files in RST files
"
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/syntax
"       Requires Vim 7+
"------------------------------------------------------------------------
" License: MIT
"=============================================================================

if &compatible || v:version < 700
  finish
else
  runtime! syntax/rst.vim
endif

syn region rstRobotCodeBlock contained matchgroup=rstDirective
      \ start=+\%(sourcecode\|code\%(-block\)\=\)::\srobotframework+
      \ skip=+^$+
      \ end=+^\s\@!+
      \ contains=rstRobotTestSection,rstRobotKeywordsSection,rstRobotSettingsSection
syn cluster rstDirectives add=rstRobotCodeBlock

syn region rstRobotSettingsSection contained
      \ start=+\*\*\*\ Settings \*\*\*+
      \ skip=+^$+
      \ end=+\(^\s\{2,4}\(\*\*\*\)\@=\|^\s\@!\)+
      \ contains=rstRobotSection,rstRobotLibraryLine,rstRobotResourceLine,rstRobotForceTagsLine,
      \          rstRobotSuiteSetupLine,rstRobotSuiteTeardownLine,rstRobotTestSetupLine,rstRobotTestTeardownLine,
      \          rstRobotDotsLine,rstRobotDocumentationLine,rstRobotComment

syn region rstRobotTestSection contained
      \ start=+\*\*\* Test Cases \*\*\*+
      \ skip=+^$+
      \ end=+\(^\s\{2,4}\(\*\*\*\)\@=\|^\s\@!\)+
      \ contains=rstRobotGivenStep,rstRobotWhenStep,rstRobotThenStep,rstRobotComment,rstRobotAndStep,
      \          rstRobotSection,rstRobotDotsStep,rstRobotTagsStep,rstRobotDocsStep,rstRobotSetupStep,
      \          rstRobotTeardownStep,rstRobotTest,rstRobotKeysStep

syn region rstRobotKeywordsSection contained
      \ start=+\*\*\*\ Keywords \*\*\*+
      \ skip=+^$+
      \ end=+\(^\s\{2,4}\(\*\*\*\)\@=\|^\s\@!\)+
      \ contains=rstRobotGivenStep,rstRobotWhenStep,rstRobotThenStep,rstRobotComment,rstRobotAndStep,
      \          rstRobotSection,rstRobotDotsStep,rstRobotDocsStep,rstRobotKeysStep,rstRobotKeywordsStep

syn match rstRobotLibraryLine       '^\s\{2,4}Library\s\{2}\s*\S.*$'        contains=rstRobotLibrary,rstRobotPath
syn match rstRobotResourceLine      '^\s\{2,4}Resource\s\{2}\s*\S.*$'       contains=rstRobotResource,rstRobotPath
syn match rstRobotForceTagsLine     '^\s\{2,4}Force Tags\s\{2}.*$'          contains=rstRobotForceTags,rstRobotTag,rstRobotTagSpace
syn match rstRobotSuiteSetupLine    '^\s\{2,4}Suite Setup\s\{2}\s*\S.*$'    contains=rstRobotSuiteSetup,rstRobotFunction
syn match rstRobotSuiteTeardownLine '^\s\{2,4}Suite Teardown\s\{2}\s*\S.*$' contains=rstRobotSuiteTeardown,rstRobotFunction
syn match rstRobotTestSetupLine     '^\s\{2,4}Test Setup\s\{2}\s*\S.*$'     contains=rstRobotTestSetup,rstRobotFunction
syn match rstRobotTestTeardownLine  '^\s\{2,4}Test Teardown\s\{2}\s*\S.*$'  contains=rstRobotTestTeardown,rstRobotFunction
syn match rstRobotDocumentationLine '^\s\{2,4}Documentation\s\{2}\s*\S.*$'  contains=rstRobotDocumentation
syn match rstRobotDotsLine          '^\s\{2}\s*\.\.\.\s\{2}.*$'             contains=rstRobotDots,rstRobotString,rstRobotNumber,rstRobotParam,rstRobotParamEnd,rstRobotParamString,rstRobotReserved

syn match rstRobotPath          contained '\>\s\{2}\s*\S.*$'
syn match rstRobotLibrary       contained '^\s\{2,4}Library'
syn match rstRobotResource      contained '^\s\{2,4}Resource'
syn match rstRobotForceTags     contained '^\s\{2,4}Force tags'
syn match rstRobotSuiteSetup    contained '^\s\{2,4}Suite Setup'
syn match rstRobotSuiteTeardown contained '^\s\{2,4}Suite Teardown'
syn match rstRobotTestSetup     contained '^\s\{2,4}Test Setup'
syn match rstRobotTestTeardown  contained '^\s\{2,4}Test Teardown'
syn match rstRobotDocumentation contained '^\s\{2,4}Documentation'
syn match rstRobotFunction      contained '\>\s\{2}\s*\S.*$'

syn match rstRobotDocsStep     '^\s\{6}\s*\[Documentation\]\s.*$' contains=rstRobotDocs
syn match rstRobotTagsStep     '^\s\{6}\s*\[Tags\]\s.*$'          contains=rstRobotTags,rstRobotTag,rstRobotTagSpace
syn match rstRobotDotsStep     '^\s\{6}\s*\.\.\.\s\{2}.*$'        contains=rstRobotDots,rstRobotString,rstRobotNumber,rstRobotParam,rstRobotParamEnd,rstRobotParamString,rstRobotReserved
syn match rstRobotSetupStep    '^\s\{6}\s*\[Setup\]\s.*$'         contains=rstRobotSetup,rstRobotString,rstRobotNumber,rstRobotReserved
syn match rstRobotTeardownStep '^\s\{6}\s*\[Teardown\]\s.*$'      contains=rstRobotTeardown,rstRobotString,rstRobotNumber,rstRobotReserved
syn match rstRobotKeysStep     '^\s\{6}\s*\w.*$'                  contains=rstRobotString,rstRobotNumber,rstRobotGiven,rstRobotWhen,rstRobotThen,rstRobotAnd,rstRobotParam,rstRobotParamEnd,rstRobotParamString,rstRobotReserved
syn match rstRobotKeywordsStep '^\s\{2,4}\w.*$'                   contains=rstRobotString,rstRobotNumber,rstRobotGiven,rstRobotWhen,rstRobotThen,rstRobotAnd,rstRobotParam,rstRobotParamEnd,rstRobotParamString,rstRobotReserved

syn match rstRobotGiven    contained '^\s\{6}\s*Given'
syn match rstRobotWhen     contained '^\s\{6}\s*When'
syn match rstRobotThen     contained '^\s\{6}\s*Then'
syn match rstRobotAnd      contained '^\s\{6}\s*And'
syn match rstRobotDots     contained '^\s\{2}\s*\.\.\.\s\{2}'
syn match rstRobotComment  contained '^\s\{2,4}\s*#.*$'
syn match rstRobotNumber   contained '\<[0-9]\+\>'
syn match rstRobotTags     contained '\[Tags\]'
syn match rstRobotTag      contained '[0-9a-zA-Z_-]\+'
syn match rstRobotTagSpace contained '\> \<'
syn match rstRobotDocs     contained '\[Documentation\]'
syn match rstRobotSetup    contained '\[Setup\]'
syn match rstRobotTeardown contained '\[Teardown\]'
syn match rstRobotTest     contained '^\s\{2,4}\w.*$'
syn match rstRobotParam    contained '\(\S\)\@<=\s\{2}\s*\S.*\(\s\{2}\)\@='
syn match rstRobotParamEnd contained '\(\S\)\@<=\s\{2}\s*\S.*$'
syn match rstRobotReserved contained '\(Run keyword If Test Failed\|Run Keyword And Ignore Error\|Run keyword And Continue on Failure\|Wait Until Keyword Succeeds\)\s\{2}\s*'

syn region rstRobotString start=+"+ end=+"+ contained
syn region rstRobotParamString start=+${+ end=+}+ contained
syn region rstRobotSection start=+\*\*\*+ end=+\*\*\*+ contained

hi def link rstRobotComment           Comment
hi def link rstRobotSection           Delimiter
hi def link rstRobotNumber            Number
hi def link rstRobotString            String
hi def link rstRobotParam             String
hi def link rstRobotParamEnd          String
hi def link rstRobotParamString       String
hi def link rstRobotGiven             Operator
hi def link rstRobotWhen              Operator
hi def link rstRobotThen              Operator
hi def link rstRobotAnd               Identifier
hi def link rstRobotDots              Identifier
hi def link rstRobotTags              MoreMsg
hi def link rstRobotTag               Underlined
hi def link rstRobotTagSpace          Underlined
hi def link rstRobotDocs              MoreMsg
hi def link rstRobotSetup             MoreMsg
hi def link rstRobotTeardown          MoreMsg
hi def link rstRobotTest              ModeMsg
hi def link rstRobotKeywordsStep      Function
hi def link rstRobotPath              String
hi def link rstRobotLibrary           Include
hi def link rstRobotResource          Include
hi def link rstRobotForceTags         PreProc
hi def link rstRobotSuiteSetup        PreProc
hi def link rstRobotSuiteTeardown     PreProc
hi def link rstRobotTestSetup         PreProc
hi def link rstRobotTestTeardown      PreProc
hi def link rstRobotSuiteFunction     Function
hi def link rstRobotReserved          Statement
hi def link rstRobotDocumentation     PreProc

let b:current_syntax = "rstrobot"
