Scriptname gpp_keyhandler extends ReferenceAlias

import Input
import Game
import Utility
import UI

int[] property aiKeyCodes auto hidden
string[] property asKeyNames auto hidden

; Action Keys
int property GPP_KEYCODE_A1 = 268 auto hidden 		; Default: DPad Left
int property GPP_KEYCODE_A2 = 269 auto hidden 		; Default: DPad Right
int property GPP_KEYCODE_A3 = 266 auto hidden 		; Default: DPad Up
int property GPP_KEYCODE_A4 = 267 auto hidden 		; Default: DPad Down
int[] aiActionKeys

; Combo Keys
int property GPP_KEYCODE_C1 = 277 auto hidden 		; Default: B
int property GPP_KEYCODE_C2 = 274 auto hidden 		; Default: LB
int property GPP_KEYCODE_C3 = 275 auto hidden 		; Default: RB
int property GPP_KEYCODE_C4 = -1 auto hidden

; Globals containing same combo key values as above, only used by iEquip to update whenever a G++ combo key is changed in the G++ MCM (Fill through the CK)
GlobalVariable property GPP_COMBO1 auto 			; Default: 277, B
GlobalVariable property GPP_COMBO2 auto 			; Default: 274, LB
GlobalVariable property GPP_COMBO3 auto 			; Default: 275, RB
GlobalVariable property GPP_COMBO4 auto 			; Default: -1

; Input Mode Toggle Key
int property GPP_HOTKEY_TIM auto hidden 			; Default: CapsLock

; Arrays containing KeyCode values to be emulated with TapKey
int[] property aiNonComboActions auto hidden
int[] property aiC1Actions auto hidden
int[] property aiC2Actions auto hidden
int[] property aiC3Actions auto hidden
int[] property aiC4Actions auto hidden

bool bIsC1Held
bool bIsC2Held
bool bIsC3Held
bool bIsC4Held

; Delays
float property fMultiTapDelay = 0.3 auto hidden
float property fLongPressDelay = 0.6 auto hidden

; Bools
bool property bAllowKeyPress = true auto hidden
bool property bFourthComboEnabled auto hidden
bool property bExtControlsEnabled auto hidden		; Deprecated from v1.1
bool property bMultiTapEnabled auto hidden
bool property bLongPressEnabled auto hidden

; Ints
int iWaitingKeyCode = -1
int iMultiTap

; Versioning
float fCurrentVersion						; First digit = Main version, 2nd digit = Incremental, 3rd digit = Hotfix.  For example main version 1.0, hotfix 03 would be 1.03

; iEquip Support
bool property biEquipLoaded auto hidden
int[] property aiiEquipKeys auto hidden

Event OnInit()
	aiNonComboActions = new int[16]
	aiC1Actions = new int[16]
	aiC2Actions = new int[16]
	aiC3Actions = new int[16]
	aiC4Actions = new int[16]

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

	int i
	while i < 16
		aiNonComboActions[i] = -1
		aiC1Actions[i] = -1
		aiC2Actions[i] = -1
		aiC3Actions[i] = -1
		aiC4Actions[i] = -1
		i += 1
	endWhile

	aiActionKeys = new int[4]
	aiiEquipKeys = new int[5]
	
	OnPlayerLoadGame()
EndEvent

; #######################
; ### Version Control ###

function checkVersion()
    float fThisVersion = getVersion()
    
    if fThisVersion < fCurrentVersion
        Debug.MessageBox("$gpp_kh_msg_oldVersion")
    elseIf fThisVersion == fCurrentVersion
        ; Already latest version
    else
        ; Let's update
        
        ; Version 1.1
        if fCurrentVersion < 1.1 && bExtControlsEnabled
            bExtControlsEnabled = false
            bMultiTapEnabled = true
            bLongPressEnabled = true
        endIf

        fCurrentVersion = fThisVersion
        Debug.Notification("$gpp_kh_not_updating")		; Need to change the version number in the strings files
    endIf
endFunction

float function getVersion()
    return 1.1
endFunction

event OnPlayerLoadGame()
	checkVersion()
	GotoState("")
    UnregisterForUpdate()
    
    RegisterForMenus()

    ; Reset
    bIsC1Held = false
    bIsC2Held = false
    bIsC3Held = false
    bIsC4Held = false
    iWaitingKeyCode = -1
    iMultiTap = 0
    bAllowKeyPress = true

	biEquipLoaded = GetModByName("iEquip.esp") != 255

	if biEquipLoaded
		RegisterForModEvent("iEquip_KeysUpdated", "OniEquipKeysUpdated")
        SendModEvent("iEquip_KeysUpdated")
	else
		int i
		while i < 5
			aiiEquipKeys[i] = -1
			i += 1
		endWhile
        
		UnregisterForModEvent("iEquip_KeysUpdated")
	endIf

	RegisterKeys()
endEvent

Function RegisterKeys()
	;debug.trace("gpp_keyhandler RegisterKeys")
	UnregisterForAllKeys()
	
	; Register for action keys
	RegisterForKey(GPP_KEYCODE_A1)
	RegisterForKey(GPP_KEYCODE_A2)
	RegisterForKey(GPP_KEYCODE_A3)
	RegisterForKey(GPP_KEYCODE_A4)

	aiActionKeys[0] = GPP_KEYCODE_A1
	aiActionKeys[1] = GPP_KEYCODE_A2
	aiActionKeys[2] = GPP_KEYCODE_A3
	aiActionKeys[3] = GPP_KEYCODE_A4
	
	; Register for combo keys
	RegisterForKey(GPP_KEYCODE_C1)
	RegisterForKey(GPP_KEYCODE_C2)
	RegisterForKey(GPP_KEYCODE_C3)
	
	if bFourthComboEnabled
		RegisterForKey(GPP_KEYCODE_C4)
	endif

	GPP_COMBO1.SetValueInt(GPP_KEYCODE_C1)
	GPP_COMBO2.SetValueInt(GPP_KEYCODE_C2)
	GPP_COMBO3.SetValueInt(GPP_KEYCODE_C3)
	GPP_COMBO4.SetValueInt(GPP_KEYCODE_C4)
	SendModEvent("GPP_ComboKeysUpdated")
EndFunction

function RegisterForMenus()
    RegisterForMenu("BarterMenu")
    RegisterForMenu("Book Menu")
    RegisterForMenu("Console")
    RegisterForMenu("Console Native UI Menu")
    RegisterForMenu("ContainerMenu")
    RegisterForMenu("Crafting Menu")
    RegisterForMenu("CustomMenu")
    RegisterForMenu("Dialogue Menu")
    RegisterForMenu("FavoritesMenu")
    RegisterForMenu("GiftMenu")
    RegisterForMenu("InventoryMenu")
    RegisterForMenu("Journal Menu")
    RegisterForMenu("LevelUp Menu")
    RegisterForMenu("Loading Menu")
    RegisterForMenu("Lockpicking Menu")
    RegisterForMenu("MagicMenu")
    RegisterForMenu("Main Menu")
    RegisterForMenu("MapMenu")
    RegisterForMenu("MessageBoxMenu")
    RegisterForMenu("Quantity Menu")
    RegisterForMenu("RaceSex Menu")
    RegisterForMenu("Sleep/Wait Menu")
    RegisterForMenu("StatsMenu")
    RegisterForMenu("Training Menu")
    RegisterForMenu("Tutorial Menu")
    RegisterForMenu("TweenMenu")
endfunction

event OniEquipKeysUpdated(string sEventName, string sStringArg, Float fNumArg, Form kSender)
	aiiEquipKeys[0] = (GetFormFromFile(0x00113B9F, "iEquip.esp") as globalvariable).GetValueInt()	; iEquipLeftKey
	aiiEquipKeys[1] = (GetFormFromFile(0x00113BA0, "iEquip.esp") as globalvariable).GetValueInt()	; iEquipRightKey
	aiiEquipKeys[2] = (GetFormFromFile(0x00113BA1, "iEquip.esp") as globalvariable).GetValueInt()	; iEquipShoutKey
	aiiEquipKeys[3] = (GetFormFromFile(0x00113BA2, "iEquip.esp") as globalvariable).GetValueInt()	; iEquipConsumableKey
	aiiEquipKeys[4] = (GetFormFromFile(0x00113BA3, "iEquip.esp") as globalvariable).GetValueInt()	; iEquipUtilityKey
endEvent

event OnMenuOpen(string MenuName)
	if !MenuName == "FavoritesMenu"
    	GoToState("DISABLED")
    endIf
endEvent

event OnMenuClose(string MenuName)
    if !utility.IsInMenuMode()
        GotoState("")
    endIf
endEvent

event OnUpdate()
    bAllowKeyPress = false
    
	if (iMultiTap == 1 || (iMultiTap == 0 && bLongPressEnabled) || (iMultiTap > 1 && bMultiTapEnabled)) && !((iWaitingKeyCode == 266 || iWaitingKeyCode == 267) && IsMenuOpen("Loot Menu") && UI.GetBool("Loot Menu", "_root.Menu_mc._visible") == true)		; Ignore everything except single press is extended controls disabled, and ignore DPad Up/Down if QuickLoot LootMenu is open

		int keyToTap
		int i = aiActionKeys.Find(iWaitingKeyCode)

		if i != -1
	    
		    if bIsC1Held
		    	keyToTap = aiC1Actions[i*4 + iMultiTap]
		            
		    elseIf bIsC2Held
		        keyToTap = aiC2Actions[i*4 + iMultiTap]
		        
		    elseIf bIsC3Held
		        keyToTap = aiC3Actions[i*4 + iMultiTap]
		        
		    elseIf bIsC4Held
		    	keyToTap = aiC4Actions[i*4 + iMultiTap]

		    elseIf !biEquipLoaded || aiiEquipKeys.Find(iWaitingKeyCode) == -1													; Block all non-combo keypresses if it is an iEquip key
		    	keyToTap = aiNonComboActions[i*4 + iMultiTap]

		    endIf

		    if keyToTap > 0
		    	HoldKey(keyToTap)
		    	WaitMenuMode(0.1)
		    	ReleaseKey(keyToTap)
		    endIf

		endIf

	endIf
    
    iMultiTap = 0
    iWaitingKeyCode = -1
    bAllowKeyPress = true
endEvent

; ---------------------
; - DEFAULT BEHAVIOUR -
; ---------------------

event OnKeyDown(int KeyCode)
	;debug.trace("gpp_keyhandler OnKeyDown - KeyCode: " + KeyCode)

	bool bIsComboKey

	if KeyCode == GPP_KEYCODE_C1
		bIsC1Held = true
		bIsComboKey = true
		;debug.notification("Gamepad++ Combo Key 1 down")
	elseIf KeyCode == GPP_KEYCODE_C2
		bIsC2Held = true
		bIsComboKey = true
		;debug.notification("Gamepad++ Combo Key 2 down")
	elseIf KeyCode == GPP_KEYCODE_C3
		bIsC3Held = true
		bIsComboKey = true
		;debug.notification("Gamepad++ Combo Key 3 down")
	elseIf KeyCode == GPP_KEYCODE_C4
		bIsC4Held = true
		bIsComboKey = true
		;debug.notification("Gamepad++ Combo Key 4 down")
	endif

    if bAllowKeyPress
        if KeyCode != iWaitingKeyCode && iWaitingKeyCode != -1
            if !bIsComboKey     ; The player pressed a different key, so force the current one to process if there is one
                UnregisterForUpdate()
                OnUpdate()
            else
                iMultiTap = 0
            endIf
        endIf
        iWaitingKeyCode = KeyCode
   	
        if iMultiTap == 0       ; This is the first time the key has been pressed
            RegisterForSingleUpdate(fLongPressDelay)
        elseIf bMultiTapEnabled
        	if iMultiTap == 1   ; This is the second time the key has been pressed.
	            iMultiTap = 2
	            RegisterForSingleUpdate(fMultiTapDelay)
	        elseIf iMultiTap == 2   ; This is the third time the key has been pressed
	            iMultiTap = 3
	            RegisterForSingleUpdate(0.0)
	        endIf
	    endIf
    endif
endEvent

event OnKeyUp(int KeyCode, Float HoldTime)
	;debug.trace("gpp_keyhandler OnKeyUp - KeyCode: " + KeyCode + ", HoldTime: " + HoldTime)

    if bAllowKeyPress && KeyCode == iWaitingKeyCode && iMultiTap == 0
        iMultiTap = 1
        if bMultiTapEnabled
        	RegisterForSingleUpdate(fMultiTapDelay)
        	Utility.WaitMenuMode(fMultiTapDelay + 0.1)
        else
        	RegisterForSingleUpdate(0.0)
        endIf
    endIf

    if KeyCode == GPP_KEYCODE_C1
		bIsC1Held = false
		;debug.notification("Gamepad++ Combo Key 1 released")
	elseIf KeyCode == GPP_KEYCODE_C2
		bIsC2Held = false
		;debug.notification("Gamepad++ Combo Key 2 released")
	elseIf KeyCode == GPP_KEYCODE_C3
		bIsC3Held = false
		;debug.notification("Gamepad++ Combo Key 3 released")
	elseIf KeyCode == GPP_KEYCODE_C4
		bIsC4Held = false
		;debug.notification("Gamepad++ Combo Key 4 released")
	endif

endEvent

; - Disabled
state DISABLED
    event OnBeginState()
        UnregisterForUpdate()
        bAllowKeyPress = false
        iWaitingKeyCode = -1
        iMultiTap = 0
    endEvent
    
    event OnEndState()
    	bIsC1Held = false
    	bIsC2Held = false
    	bIsC3Held = false
    	bIsC4Held = false
        bAllowKeyPress = true
    endEvent
endState