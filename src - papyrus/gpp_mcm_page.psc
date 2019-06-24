Scriptname gpp_mcm_page extends quest

gpp_mcm property MCM auto
gpp_keyhandler property KH auto

string property currentEvent auto hidden
string property currentStrVar auto hidden
float property currentVar auto hidden

int[] property aiKeyCodes auto hidden
string[] property asKeyNames auto hidden

event OnInit()
	aiKeyCodes = new int[16]
	aiKeyCodes[0] = 266
    aiKeyCodes[1] = 267
	aiKeyCodes[2] = 268
	aiKeyCodes[3] = 269
	aiKeyCodes[4] = 270
    aiKeyCodes[5] = 271
	aiKeyCodes[6] = 272
	aiKeyCodes[7] = 273
	aiKeyCodes[8] = 274
    aiKeyCodes[9] = 275
	aiKeyCodes[10] = 276
	aiKeyCodes[11] = 277
	aiKeyCodes[12] = 278
    aiKeyCodes[13] = 279
	aiKeyCodes[14] = 280
	aiKeyCodes[15] = 281
	
	asKeyNames = new string[16]
	asKeyNames[0] = "$gpp_mcm_key_DPadUp"
    asKeyNames[1] = "$gpp_mcm_key_DPadDown"
	asKeyNames[2] = "$gpp_mcm_key_DPadLeft"
	asKeyNames[3] = "$gpp_mcm_key_DPadRight"
	asKeyNames[4] = "$gpp_mcm_key_Start"
    asKeyNames[5] = "$gpp_mcm_key_Back"
	asKeyNames[6] = "$gpp_mcm_key_LSClick"
	asKeyNames[7] = "$gpp_mcm_key_RSClick"
	asKeyNames[8] = "$gpp_mcm_key_LB"
    asKeyNames[9] = "$gpp_mcm_key_RB"
	asKeyNames[10] = "$gpp_mcm_key_A"
	asKeyNames[11] = "$gpp_mcm_key_B"
	asKeyNames[12] = "$gpp_mcm_key_X"
    asKeyNames[13] = "$gpp_mcm_key_Y"
	asKeyNames[14] = "$gpp_mcm_key_LT"
	asKeyNames[15] = "$gpp_mcm_key_RT"
endEvent

; #########################
; ### DEFAULT BEHAVIOUR ###

function initData()                  ; Initialize page specific data
    debug.trace("WARN: A Gamepad++ MCM Page has no defined init data")
endFunction

int function saveData()             ; Save page data and return jObject
    debug.trace("WARN: A Gamepad++ MCM Page has no defined save data")
    return jArray.object()
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj
    debug.trace("WARN: A Gamepad++ MCM Page has no defined load data")
endFunction


function drawPage()                 ; Draw page
    debug.trace("WARN: A Gamepad++ MCM Page has no defined draw page")
endFunction

function jumpToState(string stateName, string eventName, float tmpVar = -1.0, string tmpStr = "")
    currentEvent = eventName
	currentVar = tmpVar
	currentStrVar = tmpStr
        
    GoToState(stateName)
endFunction
