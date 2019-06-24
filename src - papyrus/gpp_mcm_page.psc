Scriptname gpp_mcm_page extends quest

gpp_mcm property MCM auto
gpp_keyhandler property KH auto

string property currentEvent auto hidden
string property currentStrVar auto hidden
float property currentVar auto hidden

; #########################
; ### DEFAULT BEHAVIOUR ###

function initData()                  ; Initialize page specific data
    ;debug.trace("WARN: A Gamepad++ MCM Page has no defined init data")
endFunction

int function saveData()             ; Save page data and return jObject
    ;debug.trace("WARN: A Gamepad++ MCM Page has no defined save data")
    return jArray.object()
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj
    ;debug.trace("WARN: A Gamepad++ MCM Page has no defined load data")
endFunction


function drawPage()                 ; Draw page
    ;debug.trace("WARN: A Gamepad++ MCM Page has no defined draw page")
endFunction

function jumpToState(string stateName, string eventName, float tmpVar, string tmpStr)
    currentEvent = eventName
	currentVar = tmpVar
	currentStrVar = tmpStr
        
    GoToState(stateName)
endFunction
