Scriptname gpp_mcm_gen extends gpp_mcm_page

int mcmUnmapFLAG

bool bFirstView = true

; #############
; ### SETUP ###

function initData()                  ; Initialize page specific data

    mcmUnmapFLAG = MCM.OPTION_FLAG_WITH_UNMAP

endFunction

int function saveData()             ; Save page data and return jObject
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
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj

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
endFunction

function drawPage()
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
endFunction

; ---------------
; - Action Keys -
; ---------------

State key_A1
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_keyA")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.GPP_KEYCODE_A1 = currentVar as int
            else
                KH.GPP_KEYCODE_A1 = 268
            endIf
            MCM.SetKeyMapOptionValueST(KH.GPP_KEYCODE_A1)
            MCM.bUpdateKeys = true
        endIf
    endEvent
endState

State key_A2
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_keyA")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.GPP_KEYCODE_A2 = currentVar as int
            else
                KH.GPP_KEYCODE_A2 = 269
            endIf
            MCM.SetKeyMapOptionValueST(KH.GPP_KEYCODE_A2)
            MCM.bUpdateKeys = true      
        endIf
    endEvent
endState

State key_A3
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_keyA")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.GPP_KEYCODE_A3 = currentVar as int
            else
                KH.GPP_KEYCODE_A3 = 266
            endIf
            MCM.SetKeyMapOptionValueST(KH.GPP_KEYCODE_A3)
            MCM.bUpdateKeys = true    
        endIf
    endEvent
endState

State key_A4
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_keyA")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.GPP_KEYCODE_A4 = currentVar as int
            else
                KH.GPP_KEYCODE_A4 = 267
            endIf
            MCM.SetKeyMapOptionValueST(KH.GPP_KEYCODE_A4)
            MCM.bUpdateKeys = true
        endIf
    endEvent
endState

; ---------------------
; - Optional Settings -
; ---------------------

State gen_tgl_fourthCombo
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_fourthCombo")
        elseIf currentEvent == "Select" || (currentEvent == "Default" && KH.bFourthComboEnabled)
            KH.bFourthComboEnabled = !KH.bFourthComboEnabled
	    if !KH.bFourthComboEnabled
                KH.GPP_KEYCODE_C4 = -1
            endIf
            MCM.bUpdateKeys = true
            MCM.forcePageReset()
        endIf
    endEvent
endState

State gen_tgl_multiTap
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_multiTap")
        elseIf currentEvent == "Select" || (currentEvent == "Default" && KH.bMultiTapEnabled)
            KH.bMultiTapEnabled = !KH.bMultiTapEnabled
            MCM.SetToggleOptionValueST(KH.bMultiTapEnabled)
            MCM.ForcePageReset()
        endIf
    endEvent
endState

State gen_tgl_longPress
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_longPress")
        elseIf currentEvent == "Select" || (currentEvent == "Default" && KH.bLongPressEnabled)
            KH.bLongPressEnabled = !KH.bLongPressEnabled
            MCM.SetToggleOptionValueST(KH.bLongPressEnabled)
            MCM.ForcePageReset()
        endIf
    endEvent
endState

; --------------
; - Combo Keys -
; --------------

State key_C1
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_keyC")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.GPP_KEYCODE_C1 = currentVar as int
            else
                KH.GPP_KEYCODE_C1 = 277
            endIf
            MCM.SetKeyMapOptionValueST(KH.GPP_KEYCODE_C1)
            MCM.bUpdateKeys = true
        endIf
    endEvent
endState

State key_C2
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_keyC")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.GPP_KEYCODE_C2 = currentVar as int
            else
                KH.GPP_KEYCODE_C2 = 274
            endIf
            MCM.SetKeyMapOptionValueST(KH.GPP_KEYCODE_C2)
            MCM.bUpdateKeys = true
        endIf
    endEvent
endState

State key_C3
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_keyC")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.GPP_KEYCODE_C3 = currentVar as int
            else
                KH.GPP_KEYCODE_C3 = 275
            endIf
            MCM.SetKeyMapOptionValueST(KH.GPP_KEYCODE_C3)
            MCM.bUpdateKeys = true
        endIf
    endEvent
endState

State key_C4
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_keyC")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.GPP_KEYCODE_C4 = currentVar as int
            else
                KH.GPP_KEYCODE_C4 = -1
            endIf
            MCM.SetKeyMapOptionValueST(KH.GPP_KEYCODE_C4)
            MCM.bUpdateKeys = true
        endIf
    endEvent
endState

; ---------------------
; - Key Press Options -
; ---------------------

State gen_sld_multiTapDelay
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_multiTapDelay")
        elseIf currentEvent == "Open"
            MCM.fillSlider(KH.fMultiTapDelay, 0.2, 1.0, 0.1, 0.3)
        elseIf currentEvent == "Accept"
            KH.fMultiTapDelay = currentVar
            MCM.SetSliderOptionValueST(KH.fMultiTapDelay, "{1}s")
        endIf
    endEvent
endState

State gen_sld_longPrsDelay
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_gen_txt_longPrsDelay")
        elseIf currentEvent == "Open"
            MCM.fillSlider(KH.fLongPressDelay, 0.3, 1.5, 0.1, 0.6)
        elseIf currentEvent == "Accept"
            KH.fLongPressDelay = currentVar
            MCM.SetSliderOptionValueST(KH.fLongPressDelay, "{1}s")
        endIf
    endEvent
endState
