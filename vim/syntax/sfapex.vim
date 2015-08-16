" This file is part of vim-force.com plugin
"   https://github.com/neowit/vim-force.com
" File: apexcode.vim
" This file is part of vim-force.com plugin
" https://github.com/neowit/vim-force.com
" Author: Andrey Gavrikov
" Last Modified: 2012-03-05
" Vim syntax file

" Language:    ApexCode
" http://vim.wikia.com/wiki/Creating_your_own_syntax_files
" http://learnvimscriptthehardway.stevelosh.com/chapters/46.html
"
"""""""""""""""""""""""""""""""""""""""""
if !exists("main_syntax")
    if version < 600
        syntax clear
    elseif exists("b:current_syntax")
        finish
    endif
    let main_syntax = "sfapex"
endif

syn case    ignore
syn region  apexcodeFold               start="{" end="}" transparent fold

syn keyword apexcodeCommentTodo        TODO FIXME TBD contained
syn match   apexcodeLineComment        "\/\/.*" contains=@Spell,apexcodeCommentTodo
syn match   apexcodeLineComment        "\(\_^\s*//.*\_$\n\?\)\{2,}" fold contains=@Spell,apexcodeCommentTodo
syn region  apexcodeComment            start="/\*" end="\*/" fold contains=@Spell,apexcodeCommentTodo
syn match   apexcodeComment            "/\*\*/"

syn keyword apexcodeScopeDecl          global class public private protected
syn keyword apexcodeClassDecl          extends implements interface virtual abstract
syn match   apexcodeClassDecl          "^class\>"
syn match   apexcodeClassDecl          "[^.]\s*\<class\>"ms=s+1
syn keyword apexcodeMethodDecl         virtual abstract override
syn keyword apexcodeConstant           null
syn keyword apexcodeTypeDef            this super
syn keyword apexcodeType               void
syn keyword apexcodeStatement          return continue break
syn match   apexcodeAccessor           "\<\(get\|set\)\>\_s*[{;]"me=e-1

syn keyword apexcodeStorageClass       static final transient
syn keyword apexcodeStructure          enum

syn keyword apexcodeBoolean            true false
syn keyword apexcodeTypePrimitive      Blob Boolean Date Datetime DateTime Decimal Double Integer Long String Time
syn keyword apexcodeConditional        if else
syn keyword apexcodeRepeat             for while do

syn match   apexcodePreProc            "\<\(with sharing\|without sharing\)\>"
syn keyword apexcodePreProc            testMethod
syn match   apexcodePreProc            "@\(isTest\|future\|RemoteAction\|TestVisible\|RestResource\|Deprecated\|ReadOnly\|TestSetup\)"
syn match   apexcodePreProc            "@Http\(Delete\|Get\|Post\|Patch\|Put\)"
syn match   apexcodePreProc            "@\(AuraEnabled\|InvocableMethod\|InvocableVariable\)"

syn keyword apexcodeException          try catch finally throw Exception
syn keyword apexcodeOperator           new instanceof
syn match   apexcodeOperator           "\(+\|-\|=\)"
syn match   apexcodeOperator           "!="
syn match   apexcodeOperator           "&&"
syn match   apexcodeOperator           "||"

syn keyword apexcodeKeyword            webservice

syn keyword apexcodeSelectKeywords     contained select from where with having limit offset
syn match   apexcodeSelectKeywords     contained "\<\(order by\|group by\|group by rollup\|group by cube\)\>"
syn match   apexcodeSelectKeywords     contained "\<\(nulls first\|nulls last\|asc\|desc\)\>"
syn match   apexcodeSelectOperator     contained "\<\(in\|not in\)\>"
syn keyword apexcodeSelectOperator     contained or and true false
syn keyword apexcodeSelectOperator     contained toLabel includes excludes convertTimezone convertCurrency
syn keyword apexcodeSelectOperator     contained avg count count_distinct min max sum
syn region  apexcodeSelectStatic       start="\[" end="]" fold transparent contains=apexcodeSelectKeywords,apexcodeSelectOperator,apexcodeString

syn match   apexcodeSpecial            "\\\d\d\d\|\\."
syn region  apexcodeString             start=+'+ skip=+\\\\\|\\'+ end=+'\|$+ contains=apexcodeSpecial
syn match   apexcodeNumber             "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"


syn match   apexcodeDebug              "System\.debug\s*(.*);" fold contains=apexcodeString,apexcodeNumber,apexcodeOperator
syn match   apexcodeAssert             "System\.assert"
syn match   apexcodeAssert             "System\.assert\(Equals\|NotEquals\)"

syn match   apexcodeSFDCCollection     "\(Map\|Set\|List\)\(\s*<\)\@="

syn keyword apexcodeSFDCId             Id
syn keyword apexcodeSFDCSObject        SObject
syn keyword apexcodeStandardInterface  Comparable Iterator Iterable InstallHandler Schedulable UninstallHandler
syn match   apexcodeStandardInterface  "Auth\.RegistrationHandler\|Messaging\.InboundEmailHandler\|Process\.Plugin\|Site\.UrlRewriter"
syn match   apexcodeStandardInterface  "Database\.\(Stateful\|BatchableContext\|Batchable\|AllowsCallouts\)"

syn keyword apexcodeVisualforceClasses PageReference SelectOption Savepoint
syn match   apexcodeVisualforceClasses "ApexPages\.\(StandardController\|StandardSetController\|Message\)"
syn match   apexcodeSystemKeywords     "\<Database\.\(insert\|update\|delete\|undelete\|upsert\)\>"
syn match   apexcodeSystemKeywords     "Database\.\<\(convertLead\|countQuery\|emptyRecycleBin\|executeBatch\|getQueryLocator\|query\|rollback\|setSavepoint\)\>"
syn match   apexcodeSystemKeywords     "Test\.\<\(isRunningTest\|setCurrentPage\|setCurrentPageReference\|setFixedSearchResults\|setReadOnlyApplicationMode\|startTest\|stopTest\)\>"

syn match   apexcodeTriggerDecl        "^trigger\>"
syn match   apexcodeTriggerType        "\(after\|before\) \(insert\|update\|delete\|undelete\)"
syn match   apexcodeTriggerKeywords    "Trigger\.\(newMap\|oldMap\|new\|old\)"
syn match   apexcodeTriggerKeywords    "Trigger\.is\(Before\|After\|Insert\|Update\|Delete\|UnDelete\|Undelete\)"
syn match   apexcodeDatabaseClasses    "Database\.\<\(DeletedRecord\|DeleteResult\|DMLOptions\|DmlOptions\.AssignmentRuleHeader\|DmlOptions\.EmailHeader\)\>"
syn match   apexcodeDatabaseClasses    "Database\.\<\(EmptyRecycleBinResult\|Error\|GetDeletedResult\|GetUpdatedResult\|LeadConvert\|LeadConvertResult\|MergeResult\)\>"
syn match   apexcodeDatabaseClasses    "Database\.\<\(QueryLocator\|QueryLocatorIterator\|SaveResult\|UndeleteResult\|UpsertResult\)\>"

hi def link apexcodeCommentTodo        Todo
hi def link apexcodeComment            Comment
hi def link apexcodeLineComment        Comment

hi def link apexcodeScopeDecl          StorageClass
hi def link apexcodeClassDecl          StorageClass
hi def link apexcodeMethodDecl         StorageClass
hi def link apexcodeConstant           Constant
hi def link apexcodeTypeDef            Typedef
hi def link apexcodeType               Type
hi def link apexcodeStatement          Statement
hi def link apexcodeAccessor           Statement

hi def link apexcodeStorageClass       StorageClass
hi def link apexcodeStructure          Structure

hi def link apexcodeBoolean            Boolean
hi def link apexcodeTypePrimitive      Type
hi def link apexcodeConditional        Conditional
hi def link apexcodeRepeat             Repeat

hi def link apexcodePreProc            PreProc

hi def link apexcodeException          Exception
hi def link apexcodeOperator           Operator

hi def link apexcodeKeyword            Keyword

hi def link apexcodeSelectKeywords     Statement
hi def link apexcodeSelectOperator     Operator

hi def link apexcodeString             String
hi def link apexcodeNumber             Number
hi def link apexcodeDebug              Debug
hi def link apexcodeAssert             Statement

hi def link apexcodeSFDCCollection     Type
hi def link apexcodeSFDCId             Type
hi def link apexcodeSFDCSObject        Type
hi def link apexcodeStandardInterface  Type
hi def link apexcodeVisualforceClasses Type
hi def link apexcodeDatabaseClasses    Type

hi def link apexcodeSystemKeywords     Statement

hi def link apexcodeTriggerDecl        StorageClass
hi def link apexcodeTriggerType        PreProc
hi def link apexcodeTriggerKeywords    Type


let b:current_syntax = "sfapex"
if main_syntax == "sfapex"
    unlet main_syntax
endif

