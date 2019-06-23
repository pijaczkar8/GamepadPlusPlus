Scriptname gpp_mcm_C4 extends gpp_mcm_page

int mcmUnmapFLAG

string sC4A1SnglLabel
string sC4A1DblLabel
string sC4A1TrplLabel
string sC4A1HldLabel

string sC4A2SnglLabel
string sC4A2DblLabel
string sC4A2TrplLabel
string sC4A2HldLabel

string sC4A3SnglLabel
string sC4A3DblLabel
string sC4A3TrplLabel
string sC4A3HldLabel

string sC4A4SnglLabel
string sC4A4DblLabel
string sC4A4TrplLabel
string sC4A4HldLabel

; #############
; ### SETUP ###

function initData()                  ; Initialize page specific data
    mcmUnmapFLAG = MCM.OPTION_FLAG_WITH_UNMAP
endFunction

int function sC4AveData()             ; sC4Ave page data and return jObject
    int jPageObj = jArray.object()

    jArray.addInt(jPageObj, KH.aiC4Actions[1])
    jArray.addStr(jPageObj, sC4A1SnglLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[2])
    jArray.addStr(jPageObj, sC4A1DblLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[3])
    jArray.addStr(jPageObj, sC4A1TrplLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[0])
    jArray.addStr(jPageObj, sC4A1HldLabel)

    jArray.addInt(jPageObj, KH.aiC4Actions[5])
    jArray.addStr(jPageObj, sC4A2SnglLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[6])
    jArray.addStr(jPageObj, sC4A2DblLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[7])
    jArray.addStr(jPageObj, sC4A2TrplLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[4])
    jArray.addStr(jPageObj, sC4A2HldLabel)

    jArray.addInt(jPageObj, KH.aiC4Actions[9])
    jArray.addStr(jPageObj, sC4A3SnglLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[10])
    jArray.addStr(jPageObj, sC4A3DblLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[11])
    jArray.addStr(jPageObj, sC4A3TrplLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[8])
    jArray.addStr(jPageObj, sC4A3HldLabel)

    jArray.addInt(jPageObj, KH.aiC4Actions[13])
    jArray.addStr(jPageObj, sC4A4SnglLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[14])
    jArray.addStr(jPageObj, sC4A4DblLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[15])
    jArray.addStr(jPageObj, sC4A4TrplLabel)
    jArray.addInt(jPageObj, KH.aiC4Actions[12])
    jArray.addStr(jPageObj, sC4A4HldLabel)

    return jPageObj    
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj

    KH.aiC4Actions[1] = jArray.getInt(jPageObj, 0)
    sC4A1SnglLabel = jArray.getStr(jPageObj, 1)
    KH.aiC4Actions[2] = jArray.getInt(jPageObj, 2)
    sC4A1DblLabel = jArray.getStr(jPageObj, 3)
    KH.aiC4Actions[3] = jArray.getInt(jPageObj, 4)
    sC4A1TrplLabel = jArray.getStr(jPageObj, 5)
    KH.aiC4Actions[0] = jArray.getInt(jPageObj, 6)
    sC4A1HldLabel = jArray.getStr(jPageObj, 7)

    KH.aiC4Actions[5] = jArray.getInt(jPageObj, 8)
    sC4A2SnglLabel = jArray.getStr(jPageObj, 9)
    KH.aiC4Actions[6] = jArray.getInt(jPageObj, 10)
    sC4A2DblLabel = jArray.getStr(jPageObj, 11)
    KH.aiC4Actions[7] = jArray.getInt(jPageObj, 12)
    sC4A2TrplLabel = jArray.getStr(jPageObj, 13)
    KH.aiC4Actions[4] = jArray.getInt(jPageObj, 14)
    sC4A2HldLabel = jArray.getStr(jPageObj, 15)

    KH.aiC4Actions[9] = jArray.getInt(jPageObj, 16)
    sC4A3SnglLabel = jArray.getStr(jPageObj, 17)
    KH.aiC4Actions[10] = jArray.getInt(jPageObj, 18)
    sC4A3DblLabel = jArray.getStr(jPageObj, 19)
    KH.aiC4Actions[11] = jArray.getInt(jPageObj, 20)
    sC4A3TrplLabel = jArray.getStr(jPageObj, 21)
    KH.aiC4Actions[8] = jArray.getInt(jPageObj, 22)
    sC4A3HldLabel = jArray.getStr(jPageObj, 23)

    KH.aiC4Actions[13] = jArray.getInt(jPageObj, 24)
    sC4A4SnglLabel = jArray.getStr(jPageObj, 25)
    KH.aiC4Actions[14] = jArray.getInt(jPageObj, 26)
    sC4A4DblLabel = jArray.getStr(jPageObj, 27)
    KH.aiC4Actions[15] = jArray.getInt(jPageObj, 28)
    sC4A4TrplLabel = jArray.getStr(jPageObj, 29)
    KH.aiC4Actions[12] = jArray.getInt(jPageObj, 30)
    sC4A4HldLabel = jArray.getStr(jPageObj, 31)

endFunction

function drawPage()
	
	if KH.bFourthComboEnabled

	    string keyName = asKeyNames[aiKeyCodes.Find(KH.GPP_KEYCODE_C4)]
	    string tmpStr

	    if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(KH.GPP_KEYCODE_C4) == -1
	    
		    tmpStr = keyName + " + " + asKeyNames[aiKeyCodes.Find(KH.GPP_KEYCODE_A1)] + " " + "$gpp_mcm_com_lbl_comboActions"
		    MCM.AddHeaderOption("<font color='#C4A57A'>tmpStr</font>")
		    MCM.AddEmptyOption()
		    MCM.AddKeyMapOptionST("action_C4_A1_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC4Actions[1], mcmUnmapFLAG)
		    MCM.AddInputOptionST("label_C4_A1_sngl", "$gpp_mcm_com_lbl_addLabel", sC4A1SnglLabel)
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_C4_A1_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC4Actions[2], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A1_dbl", "$gpp_mcm_com_lbl_addLabel", sC4A1DblLabel)
			    MCM.AddKeyMapOptionST("action_C4_A1_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC4Actions[3], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A1_trpl", "$gpp_mcm_com_lbl_addLabel", sC4A1TrplLabel)
			    MCM.AddKeyMapOptionST("action_C4_A1_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC4Actions[0], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A1_hld", "$gpp_mcm_com_lbl_addLabel", sC4A1HldLabel)
			endIf
		    
		    MCM.AddEmptyOption()
		    
		    tmpStr = keyName + " + " + asKeyNames[aiKeyCodes.Find(KH.GPP_KEYCODE_A2)] + " " + "$gpp_mcm_com_lbl_comboActions"
		    MCM.AddHeaderOption("<font color='#C4A57A'>tmpStr</font>")
		    MCM.AddEmptyOption()
		    MCM.AddKeyMapOptionST("action_C4_A2_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC4Actions[5], mcmUnmapFLAG)
		    MCM.AddInputOptionST("label_C4_A2_sngl", "$gpp_mcm_com_lbl_addLabel", sC4A2SnglLabel)
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_C4_A2_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC4Actions[6], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A2_dbl", "$gpp_mcm_com_lbl_addLabel", sC4A2DblLabel)
			    MCM.AddKeyMapOptionST("action_C4_A2_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC4Actions[7], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A2_trpl", "$gpp_mcm_com_lbl_addLabel", sC4A2TrplLabel)
			    MCM.AddKeyMapOptionST("action_C4_A2_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC4Actions[4], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A2_hld", "$gpp_mcm_com_lbl_addLabel", sC4A2HldLabel)
			endIf

		    MCM.SetCursorPosition(1)

		    tmpStr = keyName + " + " + asKeyNames[aiKeyCodes.Find(KH.GPP_KEYCODE_A3)] + " " + "$gpp_mcm_com_lbl_comboActions"
		    MCM.AddHeaderOption("<font color='#C4A57A'>tmpStr</font>")
		    MCM.AddEmptyOption()
		    MCM.AddKeyMapOptionST("action_C4_A3_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC4Actions[9], mcmUnmapFLAG)
		    MCM.AddInputOptionST("label_C4_A3_sngl", "$gpp_mcm_com_lbl_addLabel", sC4A3SnglLabel)
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_C4_A3_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC4Actions[10], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A3_dbl", "$gpp_mcm_com_lbl_addLabel", sC4A3DblLabel)
			    MCM.AddKeyMapOptionST("action_C4_A3_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC4Actions[11], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A3_trpl", "$gpp_mcm_com_lbl_addLabel", sC4A3TrplLabel)
			    MCM.AddKeyMapOptionST("action_C4_A3_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC4Actions[8], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A3_hld", "$gpp_mcm_com_lbl_addLabel", sC4A3HldLabel)
			endIf
		    
		    MCM.AddEmptyOption()
		    
		    tmpStr = keyName + " + " + asKeyNames[aiKeyCodes.Find(KH.GPP_KEYCODE_A4)] + " " + "$gpp_mcm_com_lbl_comboActions"
		    MCM.AddHeaderOption("<font color='#C4A57A'>tmpStr</font>")
		    MCM.AddEmptyOption()
		    MCM.AddKeyMapOptionST("action_C4_A4_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC4Actions[13], mcmUnmapFLAG)
		    MCM.AddInputOptionST("label_C4_A4_sngl", "$gpp_mcm_com_lbl_addLabel", sC4A4SnglLabel)
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_C4_A4_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC4Actions[14], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A4_dbl", "$gpp_mcm_com_lbl_addLabel", sC4A4DblLabel)
			    MCM.AddKeyMapOptionST("action_C4_A4_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC4Actions[15], mcmUnmapFLAG)
			    MCM.AddInputOptionST("label_C4_A4_trpl", "$gpp_mcm_com_lbl_addLabel", sC4A4TrplLabel)
			    MCM.AddKeyMapOptionST("action_C4_A4_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC4Actions[12], mcmUnmapFLAG)
		    	MCM.AddInputOptionST("label_C4_A4_hld", "$gpp_mcm_com_lbl_addLabel", sC4A4HldLabel)
		    endIf

		else
			tmpStr = keyName + " " + "$gpp_mcm_com_txt_iEquipConflict"
			MCM.AddTextOptionST("C4_txt_iEquipConflict_1", "<font color='#ff7417'>tmpStr</font>", "")
			MCM.AddTextOptionST("C4_txt_iEquipConflict_2", "<font color='#ff7417'>$gpp_mcm_com_txt_comboActionsDisabled</font>", "")
		endIf

    else
    	MCM.AddTextOptionST("C4_txt_C4Disabled", "<font color='#ff7417'>$gpp_mcm_C4_lbl_C4Disabled</font>", "")
    endIf

endFunction

; -------------------------
; - C4 + A1 Combo Actions -
; -------------------------

State action_C4_A1_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[1] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[1])
            else
                KH.aiC4Actions[1] = -1
                sC4A1SnglLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A1_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A1SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A1SnglLabel = currentStrVar
            else
                sC4A1SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A1SnglLabel)
        endIf
    endEvent
endState

State action_C4_A1_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[2] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[2])
            else
                KH.aiC4Actions[2] = -1
                sC4A1DblLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A1_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A1DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A1DblLabel = currentStrVar
            else
                sC4A1DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A1DblLabel)
        endIf
    endEvent
endState

State action_C4_A1_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[3] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[3])
            else
                KH.aiC4Actions[3] = -1
                sC4A1TrplLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A1_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A1TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A1TrplLabel = currentStrVar
            else
                sC4A1TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A1TrplLabel)
        endIf
    endEvent
endState

State action_C4_A1_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[0] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[0])
            else
                KH.aiC4Actions[0] = -1
                sC4A1HldLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A1_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A1HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A1HldLabel = currentStrVar
            else
                sC4A1HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A1HldLabel)
        endIf
    endEvent
endState

; -------------------------
; - C4 + A2 Combo Actions -
; -------------------------

State action_C4_A2_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[5] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[5])
            else
                KH.aiC4Actions[5] = -1
                sC4A2SnglLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A2_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A2SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A2SnglLabel = currentStrVar
            else
                sC4A2SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A2SnglLabel)
        endIf
    endEvent
endState

State action_C4_A2_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[6] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[6])
            else
                KH.aiC4Actions[6] = -1
                sC4A2DblLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A2_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A2DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A2DblLabel = currentStrVar
            else
                sC4A2DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A2DblLabel)
        endIf
    endEvent
endState

State action_C4_A2_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[7] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[7])
            else
                KH.aiC4Actions[7] = -1
                sC4A2TrplLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A2_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A2TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A2TrplLabel = currentStrVar
            else
                sC4A2TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A2TrplLabel)
        endIf
    endEvent
endState

State action_C4_A2_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[4] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[4])
            else
                KH.aiC4Actions[4] = -1
                sC4A2HldLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A2_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A2HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A2HldLabel = currentStrVar
            else
                sC4A2HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A2HldLabel)
        endIf
    endEvent
endState

; -------------------------
; - C4 + A3 Combo Actions -
; -------------------------

State action_C4_A3_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[9] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[9])
            else
                KH.aiC4Actions[9] = -1
                sC4A3SnglLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A3_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A3SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A3SnglLabel = currentStrVar
            else
                sC4A3SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A3SnglLabel)
        endIf
    endEvent
endState

State action_C4_A3_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[10] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[10])
            else
                KH.aiC4Actions[10] = -1
                sC4A3DblLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A3_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A3DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A3DblLabel = currentStrVar
            else
                sC4A3DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A3DblLabel)
        endIf
    endEvent
endState

State action_C4_A3_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[11] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[11])
            else
                KH.aiC4Actions[11] = -1
                sC4A3TrplLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A3_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A3TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A3TrplLabel = currentStrVar
            else
                sC4A3TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A3TrplLabel)
        endIf
    endEvent
endState

State action_C4_A3_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[8] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[8])
            else
                KH.aiC4Actions[8] = -1
                sC4A3HldLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A3_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A3HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A3HldLabel = currentStrVar
            else
                sC4A3HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A3HldLabel)
        endIf
    endEvent
endState

; -------------------------
; - C4 + A4 Combo Actions -
; -------------------------

State action_C4_A4_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[13] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[13])
            else
                KH.aiC4Actions[13] = -1
                sC4A4SnglLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A4_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A4SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A4SnglLabel = currentStrVar
            else
                sC4A4SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A4SnglLabel)
        endIf
    endEvent
endState

State action_C4_A4_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[14] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[14])
            else
                KH.aiC4Actions[14] = -1
                sC4A4DblLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A4_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A4DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A4DblLabel = currentStrVar
            else
                sC4A4DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A4DblLabel)
        endIf
    endEvent
endState

State action_C4_A4_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[15] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[15])
            else
                KH.aiC4Actions[15] = -1
                sC4A4TrplLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A4_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A4TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A4TrplLabel = currentStrVar
            else
                sC4A4TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A4TrplLabel)
        endIf
    endEvent
endState

State action_C4_A4_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC4Actions[12] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC4Actions[12])
            else
                KH.aiC4Actions[12] = -1
                sC4A4HldLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C4_A4_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC4A4HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC4A4HldLabel = currentStrVar
            else
                sC4A4HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC4A4HldLabel)
        endIf
    endEvent
endState

