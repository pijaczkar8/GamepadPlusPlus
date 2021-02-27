Scriptname gpp_mcm_gen extends gpp_mcm_page

bool bFirstView = true
bool queue_key_update

string property MCMSettingsPath = "Data/Gamepad++/Presets/" autoReadOnly
string property FileExt = ".gpp" autoReadonly

; #############
; ### SETUP ###
event OnInit()
	if RegisterModule("$gpp_mcm_lbl_gen", 0) != OK
		KeepTryingToRegister()
	endif
endEvent

event OnPageInit()
    SetModName("")
    SetSplashScreen("GPP/gpp_splash.swf", 196, 98)
    RegisterForKey(KH.GPP_HOTKEY_TIM)
endevent

event OnPageDraw()
    nl_mcm MCM = UNSAFE_RAW_MCM

	if bFirstView
		MCM.ShowMessage("$gpp_mcm_gen_txt_firstView", false, "$gpp_common_msg_exit")
		bFirstView = false
	endIf

	MCM.AddHeaderOption("<font color='#C1A57A'>$gpp_mcm_gen_lbl_actionKeys</font>")
	MCM.AddKeyMapOptionST("key_A1", "$gpp_mcm_gen_lbl_keyA1", KH.GPP_KEYCODE_A1, mcmUnmapFLAG)
	MCM.AddKeyMapOptionST("key_A2", "$gpp_mcm_gen_lbl_keyA2", KH.GPP_KEYCODE_A2, mcmUnmapFLAG)
	MCM.AddKeyMapOptionST("key_A3", "$gpp_mcm_gen_lbl_keyA3", KH.GPP_KEYCODE_A3, mcmUnmapFLAG)
	MCM.AddKeyMapOptionST("key_A4", "$gpp_mcm_gen_lbl_keyA4", KH.GPP_KEYCODE_A4, mcmUnmapFLAG)
	MCM.AddEmptyOption()

	MCM.AddHeaderOption("<font color='#C1A57A'>$gpp_mcm_gen_lbl_optSettings</font>")
	MCM.AddToggleOptionST("gen_tgl_fourthCombo", "$gpp_mcm_gen_lbl_fourthCombo", KH.bFourthComboEnabled)
    MCM.AddToggleOptionST("gen_tgl_multiTap", "$gpp_mcm_gen_lbl_multiTap", KH.bMultiTapEnabled)
    MCM.AddToggleOptionST("gen_tgl_longPress", "$gpp_mcm_gen_lbl_longPress", KH.bLongPressEnabled)

	MCM.SetCursorPosition(1)
	
	MCM.AddHeaderOption("<font color='#C1A57A'>$gpp_mcm_gen_lbl_comboKeys</font>")
	MCM.AddKeyMapOptionST("key_C1", "$gpp_mcm_gen_lbl_keyC1", KH.GPP_KEYCODE_C1, mcmUnmapFLAG)
	MCM.AddKeyMapOptionST("key_C2", "$gpp_mcm_gen_lbl_keyC2", KH.GPP_KEYCODE_C2, mcmUnmapFLAG)
	MCM.AddKeyMapOptionST("key_C3", "$gpp_mcm_gen_lbl_keyC3", KH.GPP_KEYCODE_C3, mcmUnmapFLAG)
	if KH.bFourthComboEnabled
		MCM.AddKeyMapOptionST("key_C4", "$gpp_mcm_gen_lbl_keyC4", KH.GPP_KEYCODE_C4, mcmUnmapFLAG)
	else
		MCM.AddEmptyOption()
	endIf
	MCM.AddEmptyOption()

	MCM.AddHeaderOption("<font color='#C1A57A'>$gpp_mcm_gen_lbl_keyPressOpts</font>")
    if KH.bMultiTapEnabled
	   MCM.AddSliderOptionST("gen_sld_multiTapDelay", "$gpp_mcm_gen_lbl_multiTapDelay", KH.fMultiTapDelay, "{1}s")
    endIf
    if KH.bLongPressEnabled
	   MCM.AddSliderOptionST("gen_sld_longPrsDelay", "$gpp_mcm_gen_lbl_longPrsDelay", KH.fLongPressDelay, "{1}s")
    endIf
endevent

Event OnConfigClose()
    UnregisterForKey(KH.GPP_HOTKEY_TIM)
    if queue_key_update
    	queue_key_update = false
    	KH.RegisterKeys()
    endIf
endEvent

int function SaveData()             ; Save page data and return jObject
	int jPageObj = jArray.object()

    jArray.addInt(jPageObj, KH.GPP_KEYCODE_A1)
	jArray.addInt(jPageObj, KH.GPP_KEYCODE_A2)
	jArray.addInt(jPageObj, KH.GPP_KEYCODE_A3)
	jArray.addInt(jPageObj, KH.GPP_KEYCODE_A4)
	jArray.addInt(jPageObj, KH.GPP_KEYCODE_C1)
	jArray.addInt(jPageObj, KH.GPP_KEYCODE_C2)
	jArray.addInt(jPageObj, KH.GPP_KEYCODE_C3)
	jArray.addInt(jPageObj, KH.GPP_KEYCODE_C4)
	jArray.addInt(jPageObj, KH.bFourthComboEnabled as int)
	jArray.addInt(jPageObj, KH.bExtControlsEnabled as int)     ; Deprecated in 1.1
    jArray.addInt(jPageObj, KH.bMultiTapEnabled as int)
    jArray.addInt(jPageObj, KH.bLongPressEnabled as int)

    return jPageObj    
endfunction

function LoadData(int jPageObj)     ; Load page data from jPageObj
	KH.GPP_KEYCODE_A1 = jArray.getInt(jPageObj, 0)
    KH.GPP_KEYCODE_A2 = jArray.getInt(jPageObj, 1)
    KH.GPP_KEYCODE_A3 = jArray.getInt(jPageObj, 2)
    KH.GPP_KEYCODE_A4 = jArray.getInt(jPageObj, 3)
    KH.GPP_KEYCODE_C1 = jArray.getInt(jPageObj, 4)
    KH.GPP_KEYCODE_C2 = jArray.getInt(jPageObj, 5)
    KH.GPP_KEYCODE_C3 = jArray.getInt(jPageObj, 6)
    KH.GPP_KEYCODE_C4 = jArray.getInt(jPageObj, 7)
    KH.bFourthComboEnabled = jArray.getInt(jPageObj, 8)
    KH.bExtControlsEnabled = jArray.getInt(jPageObj, 9)
    KH.bMultiTapEnabled = jArray.getInt(jPageObj, 10)
    KH.bLongPressEnabled = jArray.getInt(jPageObj, 11)
endfunction

; ---------------
; - Action Keys -
; ---------------

Event OnKeyDown(Int KeyCode)
    if KeyCode == KH.GPP_HOTKEY_TIM
        ;ToggleInputMode() ; when ever the key is pressed will only work in menu mode
    endif
EndEvent

State key_A1
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_keyA")
    endevent

    event OnDefaultST()
        KH.GPP_KEYCODE_A1 = 268
        SetKeyMapOptionValueST(268)
        queue_key_update = true
    endevent

    event OnKeyMapChangeST(int keycode)
        KH.GPP_KEYCODE_A1 = keycode
        SetKeyMapOptionValueST(keycode)
        queue_key_update = true
    endevent
endState

State key_A2
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_keyA")
    endevent

    event OnDefaultST()
        KH.GPP_KEYCODE_A2 = 269
        SetKeyMapOptionValueST(269)
        queue_key_update = true
    endevent

    event OnKeyMapChangeST(int keycode)
        KH.GPP_KEYCODE_A2 = keycode
        SetKeyMapOptionValueST(keycode)
        queue_key_update = true
    endevent
endState

State key_A3
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_keyA")
    endevent

    event OnDefaultST()
        KH.GPP_KEYCODE_A3 = 266
        SetKeyMapOptionValueST(266)
        queue_key_update = true
    endevent

    event OnKeyMapChangeST(int keycode)
        KH.GPP_KEYCODE_A3 = keycode
        SetKeyMapOptionValueST(keycode)
        queue_key_update = true
    endevent
endState

State key_A4
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_keyA")
    endevent

    event OnDefaultST()
        KH.GPP_KEYCODE_A4 = 267
        SetKeyMapOptionValueST(267)
        queue_key_update = true
    endevent

    event OnKeyMapChangeST(int keycode)
        KH.GPP_KEYCODE_A4 = keycode
        SetKeyMapOptionValueST(keycode)
        queue_key_update = true
    endevent
endState

; ---------------------
; - Optional Settings -
; ---------------------

State gen_tgl_fourthCombo
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_fourthCombo")
    endevent

    event OnDefaultST()
        KH.bFourthComboEnabled = false
        KH.GPP_KEYCODE_C4 = -1
        queue_key_update = true
        ForcePageReset()
    endevent

    event OnSelectST()
        bool tmp = !KH.bFourthComboEnabled
        
        if !tmp
            KH.GPP_KEYCODE_C4 = -1
        endif

        KH.bFourthComboEnabled = tmp
        queue_key_update = true
        ForcePageReset()
    endevent
endState

State gen_tgl_multiTap
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_multiTap")
    endevent

    event OnDefaultST()
        KH.bMultiTapEnabled = false
        ForcePageReset()
    endevent

    event OnSelectST()
        KH.bMultiTapEnabled = !KH.bMultiTapEnabled
        ForcePageReset()
    endevent
endState

State gen_tgl_longPress
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_longPress")
    endevent

    event OnDefaultST()
        KH.bLongPressEnabled = false
        ForcePageReset()
    endevent

    event OnSelectST()
        KH.bLongPressEnabled = !KH.bLongPressEnabled
        ForcePageReset()
    endevent
endState

; --------------
; - Combo Keys -
; --------------

State key_C1
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_keyC")
    endevent

    event OnDefaultST()
        KH.GPP_KEYCODE_C1 = 277
        SetKeyMapOptionValueST(277)
        queue_key_update = true
    endevent

    event OnKeyMapChangeST(int keycode)
        KH.GPP_KEYCODE_C1 = keycode
        SetKeyMapOptionValueST(keycode)
        queue_key_update = true
    endevent
endState

State key_C2
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_keyC")
    endevent

    event OnDefaultST()
        KH.GPP_KEYCODE_C2 = 274
        SetKeyMapOptionValueST(274)
        queue_key_update = true
    endevent

    event OnKeyMapChangeST(int keycode)
        KH.GPP_KEYCODE_C2 = keycode
        SetKeyMapOptionValueST(keycode)
        queue_key_update = true
    endevent
endState

State key_C3
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_keyC")
    endevent

    event OnDefaultST()
        KH.GPP_KEYCODE_C3 = 275
        SetKeyMapOptionValueST(275)
        queue_key_update = true
    endevent

    event OnKeyMapChangeST(int keycode)
        KH.GPP_KEYCODE_C3 = keycode
        SetKeyMapOptionValueST(keycode)
        queue_key_update = true
    endevent
endState

State key_C4
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_keyC")
    endevent

    event OnDefaultST()
        KH.GPP_KEYCODE_C4 = -1
        SetKeyMapOptionValueST(-1)
        queue_key_update = true
    endevent

    event OnKeyMapChangeST(int keycode)
        KH.GPP_KEYCODE_C4 = keycode
        SetKeyMapOptionValueST(keycode)
        queue_key_update = true
    endevent
endState

; ---------------------
; - Key Press Options -
; ---------------------

State gen_sld_multiTapDelay
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_multiTapDelay")
    endevent

    event OnSliderOpenST()
        SetSliderDialog(KH.fMultiTapDelay, 0.2, 1.0, 0.1, 0.3)
    endevent

    event OnSliderAcceptST(float value)
        KH.fMultiTapDelay = value
        SetSliderOptionValueST(value, "{1}s")
    endevent
endState

State gen_sld_longPrsDelay
    event OnHighlightST()
        SetInfoText("$gpp_mcm_gen_txt_longPrsDelay")
    endevent

    event OnSliderOpenST()
        SetSliderDialog(KH.fLongPressDelay, 0.3, 1.5, 0.1, 0.6)
    endevent

    event OnSliderAcceptST(float value)
        KH.fLongPressDelay = value
        SetSliderOptionValueST(value, "{1}s")
    endevent
endState
