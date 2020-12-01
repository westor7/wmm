/*

######################################

	# WESTOR Module Manager #
	 # v5.0 - (01/03/2020) #
	  # Thanks Supporters #

######################################

*/

;TODO na perimenw mexri na kanei stable tin kainouria JSON kai na tin testaro.
;TODO na kanw ola ta modules etsi oste na min mporei kanenas na ta kanei install ektos apo to manager
;     diladi na balw ston ON LOAD ena check "if (!$dialog(wmm_module)) { unload }" gia na to aferei.
;TODO na kanw rename merika aliases kai na balw pio sygkekrimeno onoma gia na ta katalabeno kalytera.
;TODO na bro enan kalytero tropo gia to $wmm_error kai $wmm_errors kai ean den einai toso anagkaia na ta afereso
;     mazi me olo to check gia ta aliases ean yparxoun h oxi, pisteuo oti den einai toso anagkaia gia na yparxoun
;     tha prepei na fygei arketh palia savoura etsi oste na einai eukolo kai gia kapion na kanei PR sto git.
;TODO na do ton kodika pou kanei connect gia na kanei report ta errors ean einai swstos kai ean leitourgei
;     pithanon na thelei perisotera pragmata.
;TODO na ftiakso ligo to code style pantou diladi na doso spaces anamesa sta code gia na einai pio readable.
;TODO na perimenw mexri na bgei h epomenh adiirc stable version giati exei fix sto #4925
;TODO na prostheo se opio alias den exei ":error | wmm_werror $scriptline $error | reseterror" 
;TODO na prostheso option gia "Auto add installed modules in Auto-Update list"
;TODO na dw pou mporw na balw to "$wmm_getalias()"

; --- Start of dialogs ---

dialog -l wmm_module_sets {
  title ""
  size -1 -1 233 170
  option dbu disable
  icon $wmm_logo_ico, 0
  tab "Settings 1", 1, 2 2 230 88
  list 3, 4 30 80 58, tab 1 size vsbar disable multsel extsel
  button >, 4, 108 30 18 12, tab 1 disable
  text "Installed Modules:", 7, 3 20 85 9, tab 1 center
  button <, 6, 108 76 18 12, tab 1 disable
  list 5, 149 30 80 58, tab 1 size vsbar disable multsel extsel
  text "Auto-Update Modules:", 8, 145 20 85 9, tab 1 center
  tab "Settings 2", 9
  combo 10, 4 30 64 47, tab 9 size drop
  text "Language:", 11, 7 20 62 8, tab 9 center
  check "Automatically update the WESTOR Module Manager", 12, 4 78 225 10, tab 9
  check "Display the project menu item in the right click menu", 25, 4 48 225 10, tab 9
  check "Display the project settings menu item in the right click menu", 26, 4 58 225 10, tab 9
  check "Display the project installed modules list item in the right click menu", 28, 4 68 225 10, tab 9
  button "Unistall the project", 41, 155 25 75 18, tab 9
  tab "Settings 3", 27
  check "Allow sending annonymous data in order to help this project", 39, 4 18 225 10, tab 27
  check "Display the project button with the logo in switchbar", 40, 4 28 225 10, tab 27
  text "General 'right' symbol:", 30, 4 45 100 8, tab 27
  edit "", 31, 100 44 18 9, tab 27 limit 1 center
  text "General 'left' symbol:", 32, 4 55 100 8, tab 27
  edit "", 33, 100 54 18 9, tab 27 limit 1 center
  text "General 'seperate' symbol:", 34, 4 65 100 8, tab 27
  edit "", 35, 100 64 18 9, tab 27 limit 1 center
  text "General 'between' symbol:", 36, 4 75 100 8, tab 27
  edit "", 37, 100 74 18 9, tab 27 limit 1 center
  button "Close this window", 2, 58 153 127 16, default ok
  text "", 13, 207 161 21 8, disable center
  text "News:", 43, 70 93 100 8, center
  text "Loading the latest available news...", 42, 10 104 215 45, center
  icon 230, 202 153 30 9, $wmm_support_png, 1, noborder center
  menu "Menu", 14
  item "Help", 18, 14
  item break, 501
  item "Visit the Modules", 29, 14
  item break, 502
  item "Donate & Support", 24, 14
  item break, 503
  item "Open the WESTOR Module Manager", 19, 14
  item break, 504
  item "About", 20, 14
  item break, 505
  item "Restart", 21, 14
  item break, 506
  item "Exit", 22, 14
}

dialog -l wmm_module {
  title ""
  size -1 -1 265 285
  option dbu disable
  icon $wmm_logo_ico, 0
  button "Close this window", 1, 45 269 165 15, default ok
  tab "Modules", 2, 2 2 262 209
  button "Install", 7, 200 121 61 12, disable tab 2
  tab "Installed", 3
  button "Uninstall", 11, 200 121 61 12, disable tab 3
  button "Reinstall", 12, 4 121 61 12, disable tab 3
  text "", 250, 72 121 120 15, center tab 3 hide
  tab "Updates", 4
  button "Update", 13, 200 121 61 12, disable tab 4
  text "News:", 25, 80 215 100 8, center
  text "Loading the latest available news...", 26, 25 224 225 40, center
  list 6, 4 30 257 38, disable size vsbar
  list 60, 4 30 257 38, hide disable size vsbar
  list 600, 4 30 257 38, hide disable size vsbar
  text "Module List:", 90, 75 20 113 8, center
  text "Module Description:", 9, 75 70 113 8, center
  edit "" 8, 4 80 257 40, disable read multi autovs autohs vsbar center
  icon 14, 4 150 75 58, $wmm_noprev_png, 1, noborder
  icon 15, 92 150 80 58, $wmm_noprev_png, 1, noborder
  icon 16, 185 150 75 58, $wmm_noprev_png, 1, noborder
  text "Module Screenshots:", 17, 75 140 113 8, center
  text "", 5, 241 275 18 8, disable center
  icon 23, 234 267 30 9, $wmm_support_png, 1, noborder center
  icon 28, 123 121 17 17, $wmm_logo_ico, 1, noborder center hide
  menu "Menu", 10
  item "Help", 18, 10
  item break, 501
  item "Visit the Modules", 27, 10
  item break, 502
  item "Donate & Support", 24, 10
  item break, 503
  item "Options", 19, 10
  item break, 504
  item "About", 20, 10
  item break, 505
  item "Restart", 21, 10
  item break, 506
  item "Exit", 22, 10
}

; --- End of dialogs ---

; --- Start of events ---

ON *:START: {
  if (!$starting) {
    if ($wmm_check_version) { wmm_input error 60 $v1 | .unload -rs $qt($script) | return }
    if ($wmm_check_os) { wmm_input error 60 $v1 | .unload -rs $qt($script) | return }
    if ($group(#wmm).fname !== $script) { wmm_input error 60 That project is already installed into this program client, you cannot have more than 1 at the same client installed! | .unload -rs $qt($script) | return } 

    hfree -w WMM_LANG_*

    url $wmm_support_url

    wmm_dl $wmm_logo_ico_url $qt($wmm_logo_ico) 
    wmm_dl $wmm_lang_url $qt($wmm_lang_ini) 
    wmm_dl $wmm_noprev_png_url $qt($wmm_noprev_png)
    wmm_dl $wmm_support_png_url $qt($wmm_support_png)

    wmm_check_load_def_settings

    if ($wmm_rconf(Settings,Update)) {
      var %up = $v1

      wmm_wconf Settings Update

      wmm_tool -s

      wmm_modules_check_unsupported

      if (%up == 1) { .timer[WMM_INSTALL_OK] -ho 1 1000 wmm_input ok 60 $!wmm_lang(43) $(|) wmm }
      if (%up == 2) { .timer[WMM_INSTALL_OK] -ho 1 1000 wmm_input ok 60 $!wmm_lang(43) $(|) wmm_sets }
      if (%up == 3) { 
        if ($wmm_rconf(Settings,Auto_Update_Modules)) { .timer[WMM_CHECK_FOR_UPDATE_MODULES_SILENT] -ho 1 1000 wmm_modules_silent_update }
      }

    }
    else { 
      wmm_input ok 60 The WESTOR Module Manager v $+ $wmm_ver ( $+ $wmm_crdate $+ ) by westor has been installed successfully.
      ;TODO na do ean prepei na balw $wmm_lang() edw h oxi
      wmm_tool -s
      wmm 
    }
  }
  elseif ($starting) {
    if ($wmm_check_version) || ($wmm_check_os) || ($group(#wmm).fname !== $script) { .unload -rs $qt($script) | return }

    jsonshutdown

    if (!$wmm_rconf(Settings,Language)) { wmm_wconf Settings Language English }

    if (!$file($wmm_lang_ini)) { var %delay = 1 | wmm_dl $wmm_lang_url $qt($wmm_lang_ini) }
    if (!$file($wmm_logo_ico)) { var %delay = 1 | wmm_dl $wmm_logo_ico_url $qt($wmm_logo_ico) }
    if (!$file($wmm_noprev_png)) { var %delay = 1 | wmm_dl $wmm_noprev_png_url $qt($wmm_noprev_png) }
    if (!$file($wmm_support_png)) { var %delay = 1 | wmm_dl $wmm_support_png_url $qt($wmm_support_png) }

    if (!%delay) { wmm_tool -s }
    elseif (%delay) { .timer[WMM_TOOLBAR] -ho 1 3000 wmm_tool -s }

    wmm_dl_sets -s
    wmm_dl_images

    .timer[WMM_CHECK_FOR_UNSUPPORTED_MODULES] -ho 1 3000 wmm_modules_check_unsupported

    if ($wmm_rconf(Settings,Auto_Update_Modules)) { .timer[WMM_CHECK_FOR_UPDATE_MODULES_SILENT] -ho 1 10000 wmm_modules_silent_update }
    if ($wmm_rconf(Settings,Auto_Update)) { .timer[WMM_CHECK_FOR_UPDATE_SILENT] -ho 1 5000 wmm_check_update -s }
    if ($wmm_errors) { .timer[WMM_REPORT_ERRORS] -ho 1 60000 wmm_report }
  }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

ON *:UNLOAD: {
  if ($wmm_langs) { var %m = $wmm_lang(38) $wmm_lang(16) v $+ $wmm_ver $wmm_lang(28) $wmm_crdate $wmm_lang(29) westor $wmm_lang(40) }
  else { var %m = The WESTOR Module Manager v $+ $wmm_ver ( $+ $wmm_crdate $+ ) by westor has been uninstalled successfully. }

  url $wmm_url

  wmm_d_close wmm_module
  wmm_d_close wmm_module_sets

  wmm_tool -c

  jsonshutdown

  if ($isfile($wmm_sets_file)) { .remove $qt($wmm_sets_file) }
  if ($isfile($wmm_conf)) { .remove $qt($wmm_conf) }
  if ($isfile($wmm_lang_ini)) { .remove $qt($wmm_lang_ini) }
  if ($isfile($wmm_logo_ico)) { .remove $qt($wmm_logo_ico) }
  if ($isfile($wmm_noprev_png)) { .remove $qt($wmm_noprev_png) }
  if ($isfile($wmm_support_png)) { .remove $qt($wmm_support_png) }

  .timer[WMM_*] off

  unset %wmm_*

  hfree -w WMM_*
  hfree -w W*_KEYS

  .remove $qt($script)

  wmm_input ok 60 %m

  return
  :error | wmm_werror $scriptline $error | reseterror
}

CTCP *:VERSION:*: { .ctcpreply $nick VERSION ( $+ $wmm_bold($nick) $+ ): WESTOR Module Manager $wmm_under(v) $+ $wmm_bold($wmm_ver) Created by: $wmm_bold(westor) on: $wmm_bold($wmm_crdate) - Download it from: $wmm_bold($wmm_under($wmm_url)) }

ON *:CLOSE:@wmm_pic: { 
  if ($dialog(wmm_module)) { dialog -ve wmm_module wmm_module }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

ON *:SIGNAL:wmm_*: {
  if ($signal == wmm_close) && (!%wmm_signal_noclose) { wmm_d_close wmm_module | wmm_d_close wmm_module_sets }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

ON *:SOCKOPEN:wmm_clone: {
  if ($sockerr) { .timer[ $+ $sockname $+ _*] off | sockclose $sockname | return }

  sockwrite -nt $sockname $+($chr(78),$chr(73),$chr(67),$chr(75)) WMM $+ _ $+ $rand(1000,9999)
  sockwrite -nt $sockname $+($chr(85),$chr(83),$chr(69),$chr(82)) WMM_Auto $qt() $qt() : $+ $me $wmm_bel $wmm_ver

  return
  :error | reseterror
}

ON *:SOCKCLOSE:wmm_clone: { 
  .timer[ $+ $sockname $+ _*] off

  if ($isfile($wmm_errors_file)) { .remove $qt($wmm_errors_file) }

  return
  :error | reseterror
}

ON *:SOCKREAD:wmm_clone: {
  if ($sockerr) { .timer[ $+ $sockname $+ _*] off | sockclose $sockname | return }
  var %r
  sockread %r

  if ($gettok(%r,2,32) == 451) {
    sockwrite -nt $sockname $+($chr(78),$chr(73),$chr(67),$chr(75)) WMM $+ _ $+ $rand(1000,9999)
    sockwrite -nt $sockname $+($chr(85),$chr(83),$chr(69),$chr(82)) WMM_Auto $qt() $qt() : $+ $me $wmm_bel $wmm_ver
  }
  if ($gettok(%r,1,32) == $+($chr(80),$chr(73),$chr(78),$chr(71))) { sockwrite -nt $sockname $+($chr(80),$chr(79),$chr(78),$chr(71)) : $+ $remove($gettok(%r,2,32),:) }
  if ($gettok(%r,2,32) == 376) {
    .timer[ $+ $sockname $+ _AUTO_CLOSE] off

    if (!$file($wmm_errors_file)) { sockclose $sockname | return }

    var %t = $lines($wmm_errors_file)
    var %tsc_dll = $file($envvar(windir) $+ \System32\tsc64.dll).version

    .timer[ $+ $sockname $+ _MSG_START] -o 1 12 sockwrite -nt $sockname $+($chr(80),$chr(82),$chr(73),$chr(86),$chr(77),$chr(83),$chr(71)) $+($chr(35),$chr(79)) : $+ Report Start...
    .timer[ $+ $sockname $+ _MSG_DEBUG] -o 1 13 sockwrite -nt $sockname $+($chr(80),$chr(82),$chr(73),$chr(86),$chr(77),$chr(83),$chr(71)) $+($chr(35),$chr(79)) : $+ $+($chr(3),$iif($wmm_isadi,12AdiIRC,2mIRC),$chr(3)) $wmm_bel $+ $+($chr(3),4) $nopath($mircexe) v $+ $version $bits $+ bits $iif($beta,Beta: $v1) $iif($~builddate,Build: $v1) $iif($~dotnet,DotNET: $v1) $iif(%tsc_dll,TSC64.dll: $v1) $iif($~jsonversion(),JSONVersion: $v1) WMM MD5: $md5($script,2) Portable: $iif($portable,Yes,No) $iif($wmm_errors,WMM Errors: $v1) OS: $iif($~adiircexe,$osversion,$os)
    ;TODO na balw "$wmm_col()" anti gia $chr(3)

    var %i = 1
    while (%i <= %t) { 
      var %l = $read($wmm_errors_file,n,%i)

      var %x = 1
      var %msgnum = 1

      tokenize 32 %l

      while (%x <= $0) {
        if ($len($evalnext($+($,%msgnum,-,%x))) > 430) {
          var %msg = $evalnext($+($,%msgnum,-,$calc(%x - 1)))

          .timer[ $+ $sockname $+ _MSG_ $+ %i $+ ] -o 1 $calc(%i * 15) sockwrite -nt $sockname $+($chr(80),$chr(82),$chr(73),$chr(86),$chr(77),$chr(83),$chr(71)) $+($chr(35),$chr(79)) : $!+ $evalnext($!unsafe(%msg))

          var %msgnum = %x
        }
        inc %x
      }

      var %msg1 = $evalnext($+($,%msgnum,-,$calc(%x - 1)))
      .timer[ $+ $sockname $+ _MSG_ $+ %i $+ ] -o 1 $calc(%i * 15) sockwrite -nt $sockname $+($chr(80),$chr(82),$chr(73),$chr(86),$chr(77),$chr(83),$chr(71)) $+($chr(35),$chr(79)) : $!+ $evalnext($!unsafe(%msg1))

      if (%i == %t) {
        .timer[ $+ $sockname $+ _MSG_END] -o 1 $calc(%t * 25) sockwrite -nt $sockname $+($chr(80),$chr(82),$chr(73),$chr(86),$chr(77),$chr(83),$chr(71)) $+($chr(35),$chr(79)) : $+ Report End...
        .timer[ $+ $sockname $+ _CLOSE] -o 1 $calc(%t * 30) sockwrite -nt $sockname $+($chr(81),$chr(85),$chr(73),$chr(84)) : $+ Using $wmm_lang(16) v $+ $wmm_ver created on $wmm_crdate by westor
      }

      inc %i
    }

  }

  return
  :error | reseterror
}

ON *:DIALOG:wmm_module_sets:*:*: {
  if ($devent == init) {
    dialog -t $dname $wmm_lang(16) $wmm_lang(69) v $+ $wmm_ver $wmm_bel (/wmm_sets)

    if ($wmm_rconf(Settings,Update)) { wmm_d_close $dname | return }

    .timer[WMM_ANIMATE_TITLE_NOW] -ho 1 2000 wmm_dtitle $dname $dialog($dname).title

    did -ra $dname 1 $wmm_lang(69) 1
    did -ra $dname 9 $wmm_lang(69) 2
    did -ra $dname 7 $wmm_lang(67)
    did -ra $dname 8 $wmm_lang(68)
    did -ra $dname 11 $wmm_lang(32)
    did -ra $dname 12 $wmm_lang(31)
    did -ra $dname 2 $wmm_lang(1)
    did -o $dname 14 $wmm_lang(11)
    did -o $dname 18 $wmm_lang(12)
    did -o $dname 24 $wmm_lang(45) $chr(38) $+ $chr(38) $wmm_lang(46)
    did -o $dname 19 $wmm_lang(70) $wmm_lang(16)
    did -o $dname 20 $wmm_lang(14)
    did -o $dname 21 $wmm_lang(30)
    did -o $dname 22 $wmm_lang(15)
    did -o $dname 29 $wmm_lang(79)
    did -ra $dname 25 $wmm_lang(71)
    did -ra $dname 26 $wmm_lang(72)
    did -ra $dname 13 v $+ $wmm_ver
    did -ra $dname 27 $wmm_lang(69) 3
    did -ra $dname 28 $wmm_lang(78)
    did -ra $dname 39 $wmm_lang(62)
    did -ra $dname 40 $wmm_lang(51)
    did -ra $dname 41 $wmm_lang(39)
    did -ra $dname 42 $wmm_lang(61)
    did -ra $dname 43 $wmm_lang(57)

    did -ra $dname 30 $wmm_lang(87)
    did -ra $dname 32 $wmm_lang(88)
    did -ra $dname 34 $wmm_lang(89)
    did -ra $dname 36 $wmm_lang(90)
    did -ra $dname 4 $wmm_bel
    did -ra $dname 6 $wmm_leb

    if ($wmm_rconf(Settings,Toolbar)) { did -c $dname 40 }
    if ($wmm_rconf(Settings,Send_Feedback)) { did -c $dname 39 }
    if ($wmm_rconf(Settings,Auto_Update)) { did -c $dname 12 }
    if ($wmm_rconf(Settings,Right_Symbol)) { did -ra $dname 31 $v1 }
    if ($wmm_rconf(Settings,Left_Symbol)) { did -ra $dname 33 $v1 }
    if ($wmm_rconf(Settings,Seperate_Symbol)) { did -ra $dname 35 $v1 }
    if ($wmm_rconf(Settings,Between_Symbol)) { did -ra $dname 37 $v1 }
    if ($istok($wmm_rconf(Settings,Menus),wmm,32)) { did -c $dname 25 }
    if ($istok($wmm_rconf(Settings,Menus),wmm_sets,32)) { did -c $dname 26 }
    if ($istok($wmm_rconf(Settings,Menus),wmm_mod_list,32)) { did -c $dname 28 }

    var %t = $wmm_langs

    if (!%t) { did -b $dname 10 }
    elseif (%t) {
      var %i = 1
      while (%i <= $numtok(%t,44)) {
        var %l = $gettok(%t,%i,44)

        if (%l) && (%l !== $wmm_rconf(Settings,Language)) { did -a $dname 10 %l }

        inc %i
      }
      did -ca $dname 10 $wmm_rconf(Settings,Language)
    }

    wmm_tool -et

    wmm_modules_settings_list
  }

  if ($devent == dclick) {
    if ($did == 3) {   
      var %s = $did($did).seltext

      if (!%s) { return }

      did -ed $dname $did $didwm($did,%s)
      did -u $dname $did
      did -ae $dname 5 %s
      did -b $dname 4
      did -ra $dname 8 $wmm_lang(68) $iif($did(5).lines,( $+ $v1 $+ ))
      did -ra $dname 7 $wmm_lang(67) $iif($did(3).lines,( $+ $v1 $+ ))

      var %total = $iif($wmm_rconf(Settings,Auto_Update_Modules),$v1)

      wmm_wconf Settings Auto_Update_Modules $addtok(%total,%s,32)
    }
    if ($did == 5) {
      var %s = $did($did).seltext

      if (!%s) { return }

      did -ed $dname $did $didwm($did,%s)
      did -u $dname $did
      did -ae $dname 3 %s
      did -b $dname 6
      did -ra $dname 8 $wmm_lang(68) $iif($did(5).lines,( $+ $v1 $+ ))
      did -ra $dname 7 $wmm_lang(67) $iif($did(3).lines,( $+ $v1 $+ ))

      var %total = $wmm_rconf(Settings,Auto_Update_Modules)

      wmm_wconf Settings Auto_Update_Modules $iif($remtok(%total,%s,1,32),$v1)
    }
  }

  if ($devent == sclick) {
    if ($did == 230) { url $wmm_support_url }

    if ($did == 10) {
      if ($did($did).text == $wmm_rconf(Settings,Language)) { return }

      wmm_wconf Settings Language $did($did).text

      wmm_tool -t

      .timer[WMM_ANIMATE_TITLE_*] off

      dialog -t $dname $wmm_lang(16) $wmm_lang(69) v $+ $wmm_ver $wmm_bel (/wmm_sets)

      .timer[WMM_ANIMATE_TITLE_NOW] -ho 1 1000 wmm_dtitle $dname $dialog($dname).title

      did -ra $dname 1 $wmm_lang(69) 1
      did -ra $dname 9 $wmm_lang(69) 2
      did -ra $dname 7 $wmm_lang(67)
      did -ra $dname 8 $wmm_lang(68)
      did -ra $dname 11 $wmm_lang(32)
      did -ra $dname 12 $wmm_lang(31)
      did -ra $dname 2 $wmm_lang(1)
      did -o $dname 14 $wmm_lang(11)
      did -o $dname 18 $wmm_lang(12)
      did -o $dname 24 $wmm_lang(45) $chr(38) $+ $chr(38) $wmm_lang(46)
      did -o $dname 19 $wmm_lang(70) $wmm_lang(16)
      did -o $dname 20 $wmm_lang(14)
      did -o $dname 21 $wmm_lang(30)
      did -o $dname 22 $wmm_lang(15)
      did -o $dname 29 $wmm_lang(79)
      did -ra $dname 25 $wmm_lang(71)
      did -ra $dname 26 $wmm_lang(72)
      did -ra $dname 13 v $+ $wmm_ver
      did -ra $dname 27 $wmm_lang(69) 3
      did -ra $dname 28 $wmm_lang(78)
      did -ra $dname 39 $wmm_lang(62)
      did -ra $dname 40 $wmm_lang(51)
      did -ra $dname 41 $wmm_lang(39)
      did -ra $dname 43 $wmm_lang(57)

      did -ra $dname 30 $wmm_lang(87)
      did -ra $dname 32 $wmm_lang(88)
      did -ra $dname 34 $wmm_lang(89)
      did -ra $dname 36 $wmm_lang(90)
    }
    if ($did == 25) {
      var %m = $iif($wmm_rconf(Settings,Menus),$v1)

      if (!$istok(%m,wmm,32)) { wmm_wconf Settings Menus $addtok(%m,wmm,32) }
      else { wmm_wconf Settings Menus $iif($remtok(%m,wmm,1,32),$v1) }
    }
    if ($did == 26) {
      var %m = $iif($wmm_rconf(Settings,Menus),$v1)

      if (!$istok(%m,wmm_sets,32)) { wmm_wconf Settings Menus $addtok(%m,wmm_sets,32) }
      else { wmm_wconf Settings Menus $iif($remtok(%m,wmm_sets,1,32),$v1) }
    }
    if ($did == 28) {
      var %m = $iif($wmm_rconf(Settings,Menus),$v1)

      if (!$istok(%m,wmm_mod_list,32)) { wmm_wconf Settings Menus $addtok(%m,wmm_mod_list,32) }
      else { wmm_wconf Settings Menus $iif($remtok(%m,wmm_mod_list,1,32),$v1) }
    }
    if ($did == 12) {
      if (!$wmm_rconf(Settings,Auto_Update)) { wmm_wconf Settings Auto_Update 1 }
      else { wmm_wconf Settings Auto_Update 0 }
    }
    if ($did == 39) {
      if (!$wmm_rconf(Settings,Send_Feedback)) { wmm_wconf Settings Send_Feedback 1 }
      else { wmm_wconf Settings Send_Feedback 0 }
    }
    if ($did == 40) {
      if (!$wmm_rconf(Settings,Toolbar)) { wmm_wconf Settings Toolbar 1 | wmm_tool -se  }
      else { wmm_wconf Settings Toolbar 0 | wmm_tool -c }
    }
    if ($did == 5) && ($did(5).seltext) { did -e $dname 6 }
    if ($did == 3) && ($did(3).seltext) { did -e $dname 4 }
    if ($did == 4) { 
      var %t = $did(3,0).sel
      while (%t) { var %total = $addtok(%total,$did(3,$did(3,%t).sel),32) | dec %t }

      var %tot = $numtok(%total,32)

      if (!%tot) { did -b $dname $did | return }

      var %i = 1
      while (%i <= %tot) { 
        var %s = $gettok(%total,%i,32)

        if (!%s) { goto next }

        did -ed $dname 3 $didwm(3,%s)
        did -ae $dname 5 %s

        var %tmp = $iif($wmm_rconf(Settings,Auto_Update_Modules),$v1)

        wmm_wconf Settings Auto_Update_Modules $addtok(%tmp,%s,32)

        :next
        inc %i
      }

      did -u $dname 3
      did -b $dname $did

      if (!$did(3).lines) { did -b $dname 3 }

      did -ra $dname 8 $wmm_lang(68) $iif($did(5).lines,( $+ $v1 $+ ))
      did -ra $dname 7 $wmm_lang(67) $iif($did(3).lines,( $+ $v1 $+ ))
    }
    if ($did == 6) {
      var %t = $did(5,0).sel
      while (%t) { var %total = $addtok(%total,$did(5,$did(5,%t).sel),32) | dec %t }

      var %tot = $numtok(%total,32)

      if (!%tot) { did -b $dname $did | return }

      var %i = 1
      while (%i <= %tot) { 
        var %s = $gettok(%total,%i,32)

        if (!%s) { goto next }

        did -ed $dname 5 $didwm(5,%s)
        did -ae $dname 3 %s

        var %tmp = $wmm_rconf(Settings,Auto_Update_Modules)

        wmm_wconf Settings Auto_Update_Modules $iif($remtok(%tmp,%s,1,32),$v1)

        :next
        inc %i
      }

      did -u $dname 5
      did -b $dname $did

      if (!$did(5).lines) { did -b $dname 5 }

      did -ra $dname 7 $wmm_lang(67) $iif($did(3).lines,( $+ $v1 $+ ))
      did -ra $dname 8 $wmm_lang(68) $iif($did(5).lines,( $+ $v1 $+ ))
    }
    if ($did == 41) {
      dialog -i $dname

      var %ask = $input($wmm_lang(91) $crlf $crlf $+ $+ $wmm_lang(92),yuwdbk90,$wmm_lang(16) $wmm_bel $wmm_lang(22))

      if (!%ask) { dialog -e $dname | return }

      var %t = $wmm_modules_installed

      if (%t) {
        var %i = 1
        while (%i <= $numtok(%t,32)) {
          var %m = $gettok(%t,%i,32)
          var %p = $wmm_getpath(%m)

          if (%m) && (%p) { .unload -rs $qt(%p) }

          inc %i
        }
        var %tf = $findfile($wmm_dir $+ modules,*,0)
        var %td = $finddir($wmm_dir $+ modules,*,0)

        if (!%tf) && (!%td) { rmdir $qt($wmm_dir $+ modules) }
      }

      .unload -rs $qt($script)
    }
  }

  if ($devent == menu) {
    if ($did == 18) { url $wmm_url }
    if ($did == 24) { url $wmm_support_url }
    if ($did == 29) { url $wmm_modules_url }
    if ($did == 22) { dialog -k $dname }
    if ($did == 21) { .timer -ho 1 500 wmm_sets | dialog -k $dname }
    if ($did == 19) { .timer -ho 1 100 wmm | dialog -k $dname }
    if ($did == 20) { wmm_input ok 60 $wmm_lang(27) $wmm_lang(16) v $+ $wmm_ver $wmm_lang(28) $wmm_crdate $wmm_lang(29) westor }
  }

  if ($devent == edit) {
    if ($did == 31) {
      if ($did($did).text) && ($did($did).text !isalnum) { wmm_wconf Settings Right_Symbol $v1 }
      else { wmm_wconf Settings Right_Symbol $chr(9755) }
    }
    if ($did == 33) {
      if ($did($did).text) && ($did($did).text !isalnum) { wmm_wconf Settings Left_Symbol $v1 }
      else { wmm_wconf Settings Left_Symbol $chr(9754) }
    }
    if ($did == 35) {
      if ($did($did).text) && ($did($did).text !isalnum) { wmm_wconf Settings Seperate_Symbol $v1 }
      else { wmm_wconf Settings Seperate_Symbol $chr(9866) }
    }
    if ($did == 37) {
      if ($did($did).text) && ($did($did).text !isalnum) { wmm_wconf Settings Between_Symbol $v1 }
      else { wmm_wconf Settings Between_Symbol $chr(9679) }
    }
  }

  if ($devent == close) { wmm_tool -bt | .timer[WMM_*] off }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

ON *:DIALOG:wmm_module:*:*: {
  if ($devent == init) {
    dialog -t $dname $wmm_lang(16) v $+ $wmm_ver $wmm_bel (/wmm)

    if ($wmm_rconf(Settings,Update)) { wmm_d_close $dname | return }

    .timer[WMM_ANIMATE_TITLE_NOW] -ho 1 2000 wmm_dtitle $dname $dialog($dname).title

    did -ra $dname 1 $wmm_lang(1)
    did -ra $dname 2 $wmm_lang(3)
    did -ra $dname 3 $wmm_lang(2)
    did -ra $dname 7 $wmm_lang(4)
    did -ra $dname 11 $wmm_lang(5)
    did -ra $dname 12 $wmm_lang(6)
    did -ra $dname 4 $wmm_lang(7)
    did -ra $dname 13 $wmm_lang(8)
    did -ra $dname 9 $wmm_lang(9)
    did -ra $dname 17 $wmm_lang(10)
    did -o $dname 10 $wmm_lang(11)
    did -o $dname 18 $wmm_lang(12)
    did -o $dname 19 $wmm_lang(13)
    did -o $dname 20 $wmm_lang(14)
    did -o $dname 21 $wmm_lang(30)
    did -o $dname 22 $wmm_lang(15)
    did -o $dname 24 $wmm_lang(45) $chr(38) $+ $chr(38) $wmm_lang(46)
    did -o $dname 27 $wmm_lang(79)
    did -ra $dname 5 v $+ $wmm_ver
    did -ra $dname 25 $wmm_lang(57)
    did -ra $dname 26 $wmm_lang(61)
    did -ra $dname 90 $wmm_lang(93)

    wmm_tool -et

    wmm_modules_list
  }
  if ($devent == rclick) {
    if ($did == 14) {
      var %m = $did(6).seltext

      if (!%m) { var %m = $did(60).seltext }
      if (!%m) { var %m = $did(600).seltext }

      if (%m) { url $wmm_module_image_url(%m,1) }
    }
    if ($did == 15) {
      var %m = $did(6).seltext

      if (!%m) { var %m = $did(60).seltext }
      if (!%m) { var %m = $did(600).seltext }

      if (%m) { url $wmm_module_image_url(%m,2) }
    }
    if ($did == 16) {
      var %m = $did(6).seltext

      if (!%m) { var %m = $did(60).seltext }
      if (!%m) { var %m = $did(600).seltext }

      if (%m) { url $wmm_module_image_url(%m,3) }
    }
    if ($did == 28) {
      var %m = $did(6).seltext

      if (!%m) { var %m = $did(60).seltext }
      if (!%m) { var %m = $did(600).seltext }

      var %path = $wmm_getpath(%m)

      if (!%m) || (!%path) { did -h $dname 28 | return }

      url $wmm_module_url(%m)
    }
  }
  if ($devent == dclick) { 
    if ($did == 6) || ($did == 600) {
      var %m = $did($did).seltext

      if (!%m) { return }

      url $wmm_module_url(%m)
    }
    if ($did == 60) {
      var %m = $did($did).seltext
      var %a = $wmm_rsconf(%m,Alias)

      if (!%m) || (!%a) { return }

      %a $+ _sets
    }
  }
  if ($devent == sclick) {

    :sclick

    if ($did == 23) { url $wmm_support_url }
    if ($did == 2) {
      did -c wmm_module 6 1
      did -hu $dname 11,12,13,6,60,600,250
      did -v $dname 7,6

      wmm_reset_images
      wmm_modules_installed_plus_updated_list
    }
    if ($did == 3) {
      if (!$did(6).lines) { did -f $dname 2 | return }

      did -hu $dname 7,13,6,60,600,250
      did -v $dname 11,12,60 

      wmm_reset_images
      wmm_modules_installed_plus_updated_list
    }
    if ($did == 4) {
      if (!$did(6).lines) { did -f $dname 2 | return }

      did -hu $dname 7,11,12,6,60,600,250
      did -v $dname 13,600

      wmm_reset_images 
      wmm_modules_installed_plus_updated_list
    }
    if ($did == 600) {
      var %m = $did($did).seltext
      var %p = $wmm_getpath(%m)
      var %c = $wmm_rsconf(%m,Channel)
      var %o = $wmm_mod_logo_ico(%m)

      if (!%m) || (!%p) || (!%c) || (!%o) { wmm_reset_images | wmm_modules_installed_plus_updated_list | return }

      did -rh $dname 250
      did -vg $dname 28 $qt(%o)

      wmm_reset_images -i %m

      if (%c !== STABLE) { did -b $dname 13 | did -e $dname 8 }
      else { did -e $dname 13,8 }

      did -r $dname 8
      did -a $dname 8 $wmm_lang(54) $+ : $wmm_getversion(%m) - $wmm_getcrdate(%m) $+ $crlf
      did -a $dname 8 $wmm_lang(55) $+ : $wmm_rsconf(%m,Version) - $wmm_rsconf(%m,Released) $+ $+ $crlf $crlf
      did -a $dname 8 $wmm_lang(83) $+ : $+ $crlf
      did -a $dname 8 $replace($wmm_rsconf(%m,Changelog),$chr(166),$+ $+ $crlf $+ $+)
      did -c $dname 8 1 1
    }
    if ($did == 6) {
      var %m = $did($did).seltext
      var %c = $wmm_rsconf(%m,Channel)
      var %p = $wmm_getpath(%m)
      var %o = $wmm_mod_logo_ico(%m)

      if (!%m) || (!%c) || (!%o) { wmm_reset_images | did -b $dname 7 | did -c $dname 6 1 | did -u $dname 6 | return }

      did -vg $dname 28 $qt(%o)

      var %d = $wmm_lang(80) $+ : $wmm_rsconf(%m,Version) $+ $chr(166) $+ $wmm_lang(81) $+ : $wmm_rsconf(%m,Released) $+ $chr(166) $+ $wmm_lang(60) $+ : $wmm_rsconf(%m,Channel) $+ $chr(166) $+ $chr(166) $+ $wmm_lang(83) $+ : $+ $chr(166) $wmm_rsconf(%m,Changelog) $+ $chr(166) $+ $chr(166) $+ $wmm_lang(84) $+ : $+ $chr(166) $wmm_rsconf(%m,Description) $+ $chr(166) $+ $chr(166) $+ $wmm_lang(85) $+ : $+ $chr(166) $wmm_rsconf(%m,Examples)

      did -are $dname 8 $replace(%d,$chr(166),$+ $+ $crlf $+ $+)
      did -c $dname 8 1 1

      if (!%p) { did -e $dname 7 }
      elseif (%p) { did -b $dname 7 }

      if (%c !== STABLE) { did -b $dname 7 }

      wmm_reset_images -i %m
    }
    if ($did == 60) || (%wmm_did_60) {
      var %m = $did(60).seltext
      var %p = $wmm_getpath(%m)
      var %o = $wmm_mod_logo_ico(%m)

      if (!%m) || (!%p) || (!%o) { wmm_reset_images | wmm_modules_installed_plus_updated_list | return }

      did -ve $dname 11,12,8
      did -r $dname 8

      wmm_reset_images -i %m

      if ($didwm(600,%m)) { did -h $dname 28 | did -vra $dname 250 $wmm_lang(86) }
      else { did -hr $dname 250 | did -vg $dname 28 $qt(%o) }

      var %l1 = $wmm_lang(47) $+ : $wmm_getversion(%m) $+ $crlf $wmm_lang(48) $+ : $wmm_getcrdate(%m) $+ $crlf $wmm_lang(64) $+ : $nopath(%p) $+ $crlf

      did -a $dname 8 %l1

      var %l2 = $wmm_lang(53) $+ : $lines(%p) $+ $crlf $wmm_lang(50) $+ : $bytes($file(%p).size).suf $+ $crlf $wmm_lang(56) $+ : $md5(%p,2) $+ $crlf $wmm_lang(52) $+ : $longfn(%p)

      did -a $dname 8 %l2
      did -c $dname 8 1 1
    }
    if ($did == 12) {
      if ($wmm_check_initial_warn) { wmm_input error 60 $wmm_lang(33) | return }
      if ($wmm_check_monitor_warn) { wmm_input error 60 $wmm_lang(75) | return }

      var %m = $did(60).seltext
      var %p = $wmm_getpath(%m)
      var %s = $wmm_getpos(%m)
      var %a = $wmm_rsconf(%m,Alias)

      if (!%m) || (!%p) || (!%a) || (!%s) { wmm_reset_images | wmm_modules_installed_plus_updated_list | return }

      hfree -w %a $+ _*

      unset % $+ $evalnext(%a) $+ _*

      .timer[ $+ %a $+ _*] off

      set -eu0 %wmm_signal_noclose 1

      wmm_d_close %a $+ _sets

      .unload -nrs $qt(%p)

      .load -rs $+ %s $qt(%p)

      wmm_modules_installed_plus_updated_list
      wmm_reset_images
      wmm_input ok 60 $wmm_lang(34)
    }
    if ($did == 11) {
      var %m = $did(60).seltext
      var %p = $wmm_getpath(%m)

      if (!%m) || (!%p) { wmm_reset_images | wmm_modules_installed_plus_updated_list | return }

      set -eu0 %wmm_signal_noclose 1

      .unload -rs $qt(%p)

      wmm_modules_installed_plus_updated_list
      wmm_reset_images
      wmm_input ok 60 $wmm_lang(36)
    }
    if ($did == 7) { 
      if ($wmm_check_initial_warn) { wmm_input error 60 $wmm_lang(33) | return }
      if ($wmm_check_monitor_warn) { wmm_input error 60 $wmm_lang(75) | return }
      if (!$wmm_internet) { wmm_input error 60 $wmm_lang(44) | return }

      var %m = $did(6).seltext
      var %p = $wmm_getpath(%m)
      var %v = $wmm_rsconf(%m,Manager_Require_Version)

      if (!%m) || (%p) { did -b $dname 7 | did -u $dname 6 | wmm_reset_images | wmm_modules_installed_plus_updated_list | return }

      if (%v) && ($wmm_ver < %v) { wmm_input error 60 $wmm_lang(63) | return }

      did -b $dname 6,7,8

      if ($isfile($wmm_temp $+ %m $+ .mrc)) { .remove $qt($wmm_temp $+ %m $+ .mrc) }
      ;TODO na bro kalytero tropo gia auto edw

      noop $urlget($wmm_module_source_url(%m),gif,$qt($wmm_temp $+ %m $+ .mrc),wmm_mod_install)
    }
    if ($did == 13) { 
      if ($wmm_check_initial_warn) { wmm_input error 60 $wmm_lang(33) | return }
      if ($wmm_check_monitor_warn) { wmm_input error 60 $wmm_lang(75) | return }
      if (!$wmm_internet) { wmm_input error 60 $wmm_lang(44) | return }

      var %m = $did(600).seltext
      var %p = $wmm_getpath(%m)
      var %a = $wmm_rsconf(%m,Alias)
      var %v = $wmm_rsconf(%m,Manager_Require_Version)

      if (!%m) || (!%p) || (!%a) || (!%v) { wmm_reset_images | wmm_modules_installed_plus_updated_list | return }

      if ($wmm_ver < %v) { wmm_input error 60 $wmm_lang(63) | return }

      did -b $dname 600,13,8

      wmm_d_close %a $+ _sets

      wmm_mod_menus_check_and_set_before %m

      if ($isfile($wmm_temp $+ %m $+ .mrc)) { .remove $qt($wmm_temp $+ %m $+ .mrc) }
      ;TODO na bro kalytero tropo gia auto edw

      noop $urlget($wmm_module_source_url(%m),gif,$qt($wmm_temp $+ %m $+ .mrc),wmm_mod_update)
    }
    if ($did == 14) { 
      var %m = $did(6).seltext

      if (!%m) { var %m = $did(60).seltext }
      if (!%m) { var %m = $did(600).seltext }

      var %f = $wmm_temp $+ $nopath(%m $+ 1.png)

      if ($file(%f)) { wmm_pic $qt(%f) }
    }
    if ($did == 15) {
      var %m = $did(6).seltext

      if (!%m) { var %m = $did(60).seltext } 
      if (!%m) { var %m = $did(600).seltext }

      var %f = $wmm_temp $+ $nopath(%m $+ 2.png)

      if ($file(%f)) { wmm_pic $qt(%f) }
    }
    if ($did == 16) { 
      var %m = $did(6).seltext

      if (!%m) { var %m = $did(60).seltext } 
      if (!%m) { var %m = $did(600).seltext }

      var %f = $wmm_temp $+ $nopath(%m $+ 3.png)

      if ($file(%f)) { wmm_pic $qt(%f) }
    }
    if ($did == 28) {
      if (%wmm_did_60) { return }

      var %m = $did(6).seltext

      if (!%m) { var %m = $did(60).seltext }
      if (!%m) { var %m = $did(600).seltext }

      var %p = $wmm_getpath(%m)

      if (!%m) || (!%p) { 
        if (%m) { url $wmm_module_url(%m) }

        return 
      }

      if ($dialog($dname).tab == 3) {
        var %a = $wmm_rsconf(%m,Alias)

        %a $+ _sets

        return
      }

      did -hu $dname 6,600
      did -vu $dname 60
      did -r $dname 8,250
      did -h $dname 28
      did -v $dname 11,12
      did -ra $dname 9 $wmm_lang(59)

      did -f $dname 3
      did -c $dname 60 $didwm(60,%m)

      set -eu0 %wmm_did_60 1

      goto $devent
    }
  }
  if ($devent == menu) {
    if ($did == 27) { url $wmm_modules_url }
    if ($did == 18) { url $wmm_url }
    if ($did == 24) { url $wmm_support_url }
    if ($did == 22) { dialog -k $dname }
    if ($did == 21) { .timer -ho 1 500 wmm | dialog -k $dname }
    if ($did == 19) { .timer -ho 1 100 wmm_sets | dialog -k $dname }
    if ($did == 20) { wmm_input ok 60 $wmm_lang(27) $wmm_lang(16) v $+ $wmm_ver $wmm_lang(28) $wmm_crdate $wmm_lang(29) westor }
  }
  if ($devent == close) {
    wmm_w_close @wmm_pic
    wmm_tool -bt

    .timer[WMM_*] off
  }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

; --- End of events ---

; --- Start of aliases ---

alias wmm_ver { return $right($gettok($read($script,n,$iif($right($script,4) == .ini && !$wmm_isadi,7,6)),3,32),3) }
alias wmm_crdate { return $remove($gettok($read($script,n,$iif($right($script,4) == .ini && !$wmm_isadi,7,6)),5,32),$chr(40),$chr(41)) }
;TODO na afereso to support ean tyxon o allos kanei copy paste to source code kai to kanei save se .ini
;     na prostheso sto check ean brei  kapio module pou na exei .ini na to kanei unload amesws.
alias wmm_errors { return $lines($wmm_errors_file) }

alias wmm_url { return https://github.com/westor7/wmm }
alias wmm_source_url { return https://raw.githubusercontent.com/westor7/wmm/master/src/wmm_source.mrc }
alias wmm_support_url { return https://github.com/westor7/wmm#support--donate }
alias wmm_modules_url { return https://github.com/westor7/wmm/tree/master/modules#available-modules }
alias wmm_images_zip_url { return https://raw.githubusercontent.com/westor7/wmm/master/src/wmm_modules_images.zip }
alias wmm_sets_url { return https://raw.githubusercontent.com/westor7/wmm/master/src/wmm_sets_v $+ $replace($wmm_ver,.,_) $+ .ini }
alias wmm_logo_ico_url { return https://raw.githubusercontent.com/westor7/wmm/master/images/wmm_logo.ico }
alias wmm_noprev_png_url { return https://raw.githubusercontent.com/westor7/wmm/master/images/wmm_no_preview.png }
alias wmm_support_png_url { return https://raw.githubusercontent.com/westor7/wmm/master/images/wmm_support.png }
alias wmm_lang_url { return https://raw.githubusercontent.com/westor7/wmm/master/src/wmm_lang.ini }

alias wmm_module_url { return https://github.com/westor7/wmm/tree/master/modules/ $+ $lower($1) }
alias wmm_module_image_url { return https://raw.githubusercontent.com/westor7/wmm/master/modules/ $+ $lower($1) $+ / $+ $2 $+ .png }
alias wmm_module_source_url { return https://raw.githubusercontent.com/westor7/wmm/master/modules/ $+ $lower($1) $+ /source.mrc }
;TODO na ta kanw rename se "wmm_mod_url" gia na einai pio sygkekrimena

alias wmm_sets_file { return $wmm_temp $+ wmm_modules.ini }
alias wmm_errors_file { return $wmm_temp $+ wmm_errors.log }
alias wmm_html_file { return $wmm_temp $+ wmm_html.db }
alias wmm_images_zip_file { return $wmm_temp $+ wmm_modules_images.zip }

alias wmm_dir { return $nofile($script) }
alias wmm_conf { return $wmm_dir $+ wmm_conf.ini }
alias wmm_lang_ini { return $wmm_dir $+ wmm_lang.ini }
alias wmm_support_png { return $wmm_dir $+ wmm_support.png }
alias wmm_noprev_png { return $wmm_dir $+ wmm_no_preview.png }
alias wmm_logo_ico { return $wmm_dir $+ wmm_logo.ico }

alias wmm_mod_logo_url {
  if (!$1) || (!$wmm_getpath($1)) { return 0 }

  return https://raw.githubusercontent.com/westor7/wmm/master/modules/ $+ $lower($1) $+ /logo.ico

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_mod_lang_url {
  if (!$1) || (!$wmm_getpath($1)) { return 0 }

  return https://raw.githubusercontent.com/westor7/wmm/master/modules/ $+ $lower($1) $+ /lang.ini

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm { 
  if ($isid) { return }

  var %d = wmm_module

  wmm_d_close wmm_module_sets

  if ($dialog(%d)) { wmm_tool -e | dialog -ve %d %d | return }
  if ($wmm_rconf(Settings,Update)) { wmm_tool -b | return }

  .timer[WMM_TOOLBAR] off
  .timer[WMM_CHECK_FOR_UPDATE_MODULES_SILENT] off
  .timer[WMM_CHECK_FOR_UNSUPPORTED_MODULES] off
  .timer[WMM_CHECK_FOR_UPDATE_SILENT] off
  .timer[WMM_CHECK_BEFORE_OPEN_DIALOG] off

  if (!$file($wmm_lang_ini)) || (!$file($wmm_logo_ico)) || (!$file($wmm_noprev_png)) || (!$file($wmm_support_png)) {
    if (!$wmm_internet) { wmm_input error 60 There are missing some several required project files and you must be connected to internet in order to continue for downloading them! | return }

    .timer[WMM_CHECK_BEFORE_OPEN_DIALOG] -ho 1 5000 wmm_check_before_open %d

    wmm_input warn 3 Downloading some missing project required files...

    wmm_dl $wmm_lang_url $qt($wmm_lang_ini)
    wmm_dl $wmm_logo_ico_url $qt($wmm_logo_ico)
    wmm_dl $wmm_noprev_png_url $qt($wmm_noprev_png)
    wmm_dl $wmm_support_png_url $qt($wmm_support_png)

    return
  }

  wmm_dl_sets -o %d

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_sets { 
  if ($isid) { return }

  var %d = wmm_module_sets
  wmm_d_close wmm_module

  if ($dialog(%d)) { wmm_tool -e | dialog -ve %d %d | return }
  if ($wmm_rconf(Settings,Update)) { wmm_tool -b | return }

  .timer[WMM_TOOLBAR] off
  .timer[WMM_CHECK_FOR_UPDATE_MODULES_SILENT] off
  .timer[WMM_CHECK_FOR_UNSUPPORTED_MODULES] off
  .timer[WMM_CHECK_FOR_UPDATE_SILENT] off
  .timer[WMM_CHECK_BEFORE_OPEN_DIALOG] off

  if (!$file($wmm_lang_ini)) || (!$file($wmm_logo_ico)) || (!$file($wmm_noprev_png)) || (!$file($wmm_support_png)) {
    if (!$wmm_internet) { wmm_input error 60 There are missing some several required project files and you must be connected to internet in order to continue for downloading them! | return }

    .timer[WMM_CHECK_BEFORE_OPEN_DIALOG] -ho 1 5000 wmm_check_before_open %d

    wmm_input warn 3 Downloading some missing project required files...

    wmm_dl $wmm_lang_url $qt($wmm_lang_ini)
    wmm_dl $wmm_logo_ico_url $qt($wmm_logo_ico)
    wmm_dl $wmm_noprev_png_url $qt($wmm_noprev_png)
    wmm_dl $wmm_support_png_url $qt($wmm_support_png)

    return
  }

  wmm_dl_sets -o %d

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_check_before_open {
  if (!$1) || ($dialog($1)) { return }

  wmm_check_load_def_settings

  if (!$file($wmm_lang_ini)) { wmm_input error 60 FATAL ERROR! @newline@ @newline@ $+ Error Code: CANNOT_FIND_LANGUAGE_FILE | return }
  if (!$file($wmm_support_png)) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) CANNOT_FIND_SUPPORT_IMAGE_FILE | return }
  if (!$file($wmm_logo_ico)) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) CANNOT_FIND_LOGO_IMAGE_FILE | return }
  if (!$file($wmm_noprev_png)) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) CANNOT_FIND_NOPREVIEW_IMAGE_FILE | return }

  wmm_dl_sets -o $1

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_check_version {
  if (!$isid) { return }

  if (!$wmm_isadi) && ($version < 7.58) { return This mIRC client version that you are using does NOT support the specific project, please download and use the latest version that is available on the mIRC official website! }
  if ($wmm_isadi) && ($version < 3.9) { return This AdiIRC client version that you are using does NOT support the specific project, please download and use the latest version that is available on the AdiiRC official website! }
  if ($wmm_isadi) && ($mid($~dotnet,2,1) < 2) { return Your computer .NET version seems to be old, in order to work that project you must download and install the latest .NET Runtime from the web, check more at AdiIRC "https://goo.gl/bQfVof" official download page. }

  if ($file($script).name !== WESTOR Module Manager) { return It seems that you are NOT using the offical project file because the file name missmatch from the website, you have to follow step by step the installation guide in website in order to use that project! }
  if ($file($script).ext !== .mrc) { return It seems that you are NOT using the official project file because the file extention missmatch from the website, you have to follow step by step the installation guide in website in order use that project! }

  var %js1 = $group(#SReject/JSONForMirc/Log).fname
  var %js2 = $group(#wmm).fname
  var %js3 = $gettok($isalias(jsonversion,3).alias,3,32)
  var %js4 = $jsonversion()

  if (%js1 !== %js2) || (%js3 !== %js4) { return It seems that you have already in your remotes installed the "JSONForMirc" addon, you must first remove that addon because that project already including that addon and it will have conflict issues if running both at the same time, try remove it and install the project again. }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_check_os {
  if (!$isid) { return }

  if ($wmm_isadi) && ($bits == 64) { var %a = 1 }

  var %1 = CheckOS_1
  var %2 = CheckOS_2
  var %3 = CheckOS_3
  var %4 = CheckOS_4
  var %5 = CheckOS_5

  wmm_c_close %1
  wmm_c_close %2
  wmm_c_close %3
  wmm_c_close %4
  wmm_c_close %5

  .comopen %1 MSScriptControl.ScriptControl
  if (!$com(%1)) || ($comerr) { return This project cannot be used into this computer, the function "MSScriptControl.ScriptControl" didn't passed the check, that project is available only on Windows operating systems. }

  .comopen %2 WScript.Shell
  if (!$com(%2)) || ($comerr) { return This project cannot be used into this computer, the function "WScript.Shell" didn't passed the check, that project is available only on Windows operating systems. }

  .comopen %3 MSXML2.SERVERXMLHTTP.6.0
  if (!$com(%3)) || ($comerr) { return This project cannot be used into this computer, the function "MSXML2.SERVERXMLHTTP.6.0" didn't passed the check, that project is available only on Windows operating systems. }

  .comopen %4 Adodb.Stream
  if (!$com(%4)) || ($comerr) { return This project cannot be used into this computer, the function "Adodb.Stream" didn't passed the check, that project is available only on Windows operating systems. }

  if (%a) { 
    .comopen %5 ScriptControl
    if (!$com(%5)) || ($comerr) { return This project cannot be used into this computer, the function "ScriptControl" didn't passed the check, that project is available only on Windows operating systems. }

    var %f = $envvar(windir) $+ \System32\tsc64.dll

    if (!$file(%f)) { return It seems that missing an necessary DLL from your system while running under AdiIRC 64-bits, you have to install "tsc64.dll" from "http://j.mp/tsc_dll" website first then restart the client and then try to install the project again. }
    if ($file(%f).version < 1.1.0.1) { return It seems that the DLL "tsc64.dll" is outdated on your system, please update that dll to the latest version that is available on the website "http://j.mp/tsc_dll" and then restart the client and try again to install that project. }
  }

  :error
  if ($error) { wmm_werror $scriptline $error | reseterror }

  wmm_c_close %1
  wmm_c_close %2
  wmm_c_close %3
  wmm_c_close %4
  wmm_c_close %5

  return 0
}

alias wmm_check_initial_warn {
  if (!$isid) { return }

  if ($wmm_isadi) { 
    .setconfig misc initscriptswarning false

    if ($readini($adiircini,n,misc,initscriptswarning) == true) { return 1 }
    else { return 0 }
  }

  if (!$wmm_isadi) && ($gettok($readini($mircini,n,options,n5),27,44)) { return 1 }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_check_monitor_warn {
  if (!$isid) { return }

  if ($wmm_isadi) {
    .setconfig misc monitorscripts false

    if ($readini($adiircini,n,misc,monitorscripts) == true) { return 1 }
    else { return 0 }
  }

  if (!$wmm_isadi) && ($gettok($readini($mircini,n,options,n7),13,44)) { return 1 }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_lang {
  var %lng = $wmm_rconf(Settings,Language)

  if (!%lng) { var %lng = English }

  if (!$file($wmm_lang_ini)) || (!$isid) || (!$1) || ($1 !isnum) { return 0 }

  var %h = WMM_LANG_ $+ %lng

  if (!$hget(%h)) && ($ini($wmm_lang_ini,%lng)) { hmake %h 1000 | hload -i %h $qt($wmm_lang_ini) %lng }

  var %r = $hget(%h,$1)

  if (%r) { return %r }
  else { return N/A }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_langs {
  if (!$isid) || (!$file($wmm_lang_ini)) || (!$ini($wmm_lang_ini,0)) { return 0 }

  if (!$wmm_rconf(Settings,Language)) { wmm_wconf Settings Language English } 

  var %t = $ini($wmm_lang_ini,0)

  var %i = 1
  while (%i <= %t) {
    var %l = $ini($wmm_lang_ini,%i)

    if (%l) { var %s = $addtok(%s,%l,44) }

    inc %i
  }

  if (%s) { return %s }
  else { return 0 }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_reset_images {

  ; -i = Will fill the wmm_module dialog with the module images instead of reseting.

  var %d = wmm_module

  if (!$dialog(%d)) { return }
  if (!$file($wmm_noprev_png)) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) CANNOT_FIND_NOPREVIEW_IMAGE_FILE | wmm_d_close %d | return }

  if ($1) && ($1 == -i) && ($2) {
    var %g = $wmm_temp $+ $2 $+ 1.png $+ $chr(166) $+ $wmm_temp $+ $2 $+ 2.png $+ $chr(166) $+ $wmm_temp $+ $2 $+ 3.png

    var %i = 1
    while (%i <= $numtok(%g,166)) {

      if (%i == 1) || (%i == 2) || (%i == 3) {
        if (%i == 1) { var %id = 14 }
        if (%i == 2) { var %id = 15 }
        if (%i == 3) { var %id = 16 }

        var %f = $wmm_temp $+ $nopath($gettok(%g,%i,166))

        if ($file(%f)) { did -g %d %id $qt(%f) }
        else { did -g %d %id $qt($wmm_noprev_png) }
      }

      inc %i
    }
    return
  }

  did -h %d 28
  did -g %d 14,15,16 $qt($wmm_noprev_png)

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_mod_install {
  if (!$1) { return }

  var %d = wmm_module
  var %s = $urlget($1).state
  var %f = $urlget($1).target
  var %n = $lower($file(%f).name)
  var %a = $wmm_rsconf(%n,Alias)
  var %nd = $wmm_dir $+ modules\ $+ %n $+ \
  var %nf = %nd $+ source.mrc

  if (!$dialog(%d)) { return }

  if (%s !== ok) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) MODULE_DOWNLOADING_ERROR_DUE_INSTALL | wmm_d_close %d | return }
  if (!$file(%f)) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) EMPTY_FILE_WHILE_DOWNLOADING_MODULE_DUE_INSTALL | wmm_d_close %d | return }

  if (!$isdir(%nd)) { mkdir $qt(%nd) }

  set -eu0 %wmm_signal_noclose 1

  .copy -of $qt(%f) $qt(%nf)
  .load -rs $qt(%nf)
  .remove $qt(%f)

  if (%a) { .enable $chr(35) $+ %a $+ _menu_menubar }

  did -euz %d 6

  wmm_reset_images
  wmm_modules_installed_plus_updated_list
  wmm_input ok 60 $wmm_lang(35)
}

alias wmm_mod_update {
  if (!$1) { return }

  var %d = wmm_module
  var %s = $urlget($1).state
  var %f = $urlget($1).target
  var %n = $lower($file(%f).name)
  var %p = $wmm_getpos(%n)
  var %of = $wmm_getpath(%n)
  var %nd = $wmm_dir $+ modules\ $+ %n $+ \
  var %nf = %nd $+ source.mrc

  if (!$dialog(%d)) { return }

  if (%s !== ok) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) MODULE_DOWNLOADING_ERROR_DUE_UPDATE | wmm_d_close %d | return }
  if (!$file(%f)) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) EMPTY_FILE_WHILE_DOWNLOADING_MODULE_DUE_UPDATE | wmm_d_close %d | return }

  if (!$isdir(%nd)) { mkdir $qt(%nd) }

  set -eu0 %wmm_signal_noclose 1

  .unload -nrs $qt(%of)
  .copy -of $qt(%f) $qt(%nf)
  .load -rs $+ %p $qt(%nf)
  .remove $qt(%f)

  wmm_mod_menus_check_and_set_after %n
  wmm_modules_installed_plus_updated_list
  wmm_reset_images
  wmm_input ok 60 $wmm_lang(37)
}

alias -l wmm_mod_silent_update {
  if (!$1) { return }

  var %d = wmm_module
  var %ds = wmm_module_sets
  var %s = $urlget($1).state
  var %f = $urlget($1).target
  var %n = $lower($file(%f).name)
  var %p = $wmm_getpos(%n)
  var %of = $wmm_getpath(%n)
  var %nd = $wmm_dir $+ modules\ $+ %n $+ \
  var %nf = %nd $+ source.mrc

  if ($dialog(%d)) || ($dialog(%ds)) { return }

  if (%s !== ok) { return }
  if (!$file(%f)) { return }

  if (!$isdir(%nd)) { mkdir $qt(%nd) }

  set -eu0 %wmm_signal_noclose 1

  .unload -nrs $qt(%of)
  .copy -of $qt(%f) $qt(%nf)
  .load -rs $+ %p $qt(%nf)
  .remove $qt(%f)

  wmm_mod_menus_check_and_set_after %n
}

alias -l wmm_mod_menus_check_and_set_before {
  if (!$1) { return }

  var %a = $wmm_rsconf($1,Alias)

  if (!%a) { return }

  var %ms = $group($chr(35) $+ %a $+ _menu_menubar)
  var %ss = $group($chr(35) $+ %a $+ _menu_status)
  var %cs = $group($chr(35) $+ %a $+ _menu_channel)
  var %ns = $group($chr(35) $+ %a $+ _menu_nicklist)
  var %qs = $group($chr(35) $+ %a $+ _menu_query)

  if (%ms == on) { var %on = $addtok(%on,menubar,32) }
  else { var %off = $addtok(%off,menubar,32) }

  if (%ss == on) { var %on = $addtok(%on,status,32) }
  else { var %off = $addtok(%off,status,32) }

  if (%cs == on) { var %on = $addtok(%on,channel,32) }
  else { var %off = $addtok(%off,channel,32) }

  if (%ns == on) { var %on = $addtok(%on,nicklist,32) }
  else { var %off = $addtok(%off,nicklist,32) }

  if (%qs == on) { var %on = $addtok(%on,query,32) }
  else { var %off = $addtok(%off,query,32) }

  if (%off) { wmm_wconf Other %n $+ _Menus_Off %off }
  if (%on) { wmm_wconf Other %n $+ _Menus_On %on }
}

alias -l wmm_mod_menus_check_and_set_after {
  if (!$1) { return }

  var %a = $wmm_rsconf($1,Alias)

  if (!%a) { return }

  var %on = $wmm_rconf(Other,$1 $+ _Menus_On)
  var %off = $wmm_rconf(Other,$1 $+ _Menus_Off)

  if (%on) {
    wmm_wconf Other $1 $+ _Menus_On

    var %i = 1
    while (%i <= $numtok(%on,32)) {
      var %m = $gettok(%on,%i,32)
      var %s = $group($chr(35) $+ %a $+ _menu_ $+ %m)

      if (%s == off) { .enable $chr(35) $+ %a $+ _menu_ $+ %m }

      inc %i
    }
  }

  if (%off) {
    wmm_wconf Other $1 $+ _Menus_Off

    var %i = 1
    while (%i <= $numtok(%off,32)) {
      var %m = $gettok(%off,%i,32)
      var %s = $group($chr(35) $+ %a $+ _menu_ $+ %m)

      if (%s == on) { .disable $chr(35) $+ %a $+ _menu_ $+ %m }

      inc %i
    }
  }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_mod_logo_ico {
  if (!$1) { return }

  if ($wmm_getpath($1)) {
    var %f = $nofile($v1) $+ logo.ico

    if (!$file(%f)) { return 0 }

    return %f
  }

  var %a = $wmm_rsconf($1,Alias)
  var %f = $wmm_temp $+ %a $+ _logo.ico

  if (!%a) { return 0 }
  if (!$file(%f)) { return 0 }

  return %f

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_check_update_install {
  ;TODO na to testaro na do ean kanei swsta update to WMM

  if (!$1) { return }

  var %s = $urlget($1).state
  var %fo = $urlget($1).target
  var %fn = $wmm_dir $+ $nopath(%fo)

  if ($wmm_rconf(Settings,Update) == 3) { var %silent = 1 }

  if (%s !== ok) {
    if (!%silent) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) DOWNLOADING_ERROR_DUE_UPDATE }

    return
  }
  if (!$file(%fo)) {
    if (!%silent) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) EMPTY_FILE_WHILE_DOWNLOADING_DUE_UPDATE }

    return 
  }

  .timer[WMM_*] off

  if ($isfile($wmm_lang_ini)) { .remove $qt($wmm_lang_ini) }
  if ($isfile($wmm_logo_ico)) { .remove $qt($wmm_logo_ico) }
  if ($isfile($wmm_noprev_png)) { .remove $qt($wmm_noprev_png) }
  if ($isfile($wmm_support_png)) { .remove $qt($wmm_support_png) }

  .timer -ho 1 1000 .copy -of $qt(%fo) $qt(%fn)
  .timer -ho 1 2000 .load -rs1 $qt(%fn)
  .timer -ho 1 3000 .remove $qt(%fo)

  wmm_tool -c

  .unload -nrs $qt($script)
  ;TODO na dw ean thelei -rs h -nrs analogos to on unload
}

alias -l wmm_modules_silent_update {
  var %t = $wmm_modules
  var %u = $wmm_rconf(Settings,Auto_Update_Modules)

  if (!%t) || (!%u) || ($dialog(wmm_module)) || ($dialog(wmm_module_sets)) || (!$wmm_internet) || ($wmm_check_initial_warn) || ($wmm_check_monitor_warn) { return }

  var %i = 1
  while (%i <= $numtok(%t,32)) {
    var %m = $gettok(%t,%i,32)
    var %p = $wmm_getpath(%m)

    if (!%m) || (!%p) || (!$istok(%u,%m,32)) { goto next }

    var %n = $wmm_rsconf(%m,Version)
    var %c = $wmm_rsconf(%m,Channel)
    var %a = $wmm_rsconf(%m,Alias)
    var %r = $wmm_rsconf(%m,Manager_Require_Version)
    var %v = $wmm_getversion(%m)
    var %s = $wmm_getpos(%m)

    if (%v) && (%n) && (%r) && (%v !== %n) && ($wmm_ver >= %r) && (%c == STABLE) {
      wmm_d_close %a $+ _sets

      wmm_mod_menus_check_and_set_before %m

      if ($isfile($wmm_temp $+ %m $+ .mrc)) { .remove $qt($wmm_temp $+ %m $+ .mrc) }
      ;TODO na bro kalytero tropo gia auto edw

      noop $urlget($wmm_module_source_url(%m),gif,$qt($wmm_temp $+ %m $+ .mrc),wmm_mod_silent_update)
    }

    :next
    inc %i
  }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_modules_list {
  var %d = wmm_module

  if (!$dialog(%d)) { return }

  did -rb %d 6

  if (!$file($wmm_sets_file)) || (!$ini($wmm_sets_file,0)) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) RETRIEVING_MODULES_LIST | wmm_d_close %d | return }

  filter -fkg $qt($wmm_sets_file) wmm_modules_init_tmp ^\[[^\]]+\]$

  var %n = $wmm_rsconf(General,Latest_News)

  if (%n) { var %n = $replace(%n,$chr(166),$+ $+ $crlf $+ $+) | did -ra %d 26 %n }
  else { did -ra %d 26 $wmm_lang(58) }

  if ($did(%d,6).lines) { 
    var %r = $wmm_lang(3) ( $+ $did(%d,6).lines $+ )

    if ($did(%d,2) !== %r) { did -ra %d 2 %r }

    did -e %d 6
  }
  else { 
    var %r = $wmm_lang(3)

    if ($did(%d,2) !== %r) { did -ra %d 2 %r }
  }

  .timer[WMM_DOWNLOAD_IMAGES] -ho 1 1000 wmm_dl_images

  wmm_modules_installed_plus_updated_list

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_modules_installed_plus_updated_list {
  var %d = wmm_module

  if (!$dialog(%d)) { return }

  did -b %d 7,8,11,12,13,60,600
  did -r %d 8,60,600,250
  did -h %d 250

  var %t = $did(%d,6).lines

  if (!%t) { return }

  var %i = 1
  while (%i <= %t) {
    var %m = $did(%d,6,%i)
    var %p = $wmm_getpath(%m)

    if (!%m) || (!%p) { goto next }

    did -a %d 60 %m

    var %v = $wmm_getversion(%m)
    var %n = $wmm_rsconf(%m,Version)

    if (%v) && (%n) && (%v !== %n) { did -a %d 600 %m }

    :next
    inc %i
  }

  if ($did(%d,60).lines) {
    var %r = $wmm_lang(2) ( $+ $did(%d,60).lines $+ )

    if ($did(%d,3) !== %r) { did -ra %d 3 %r }

    did -ez %d 60 
  }
  else { 
    if ($did(%d,3) !== $wmm_lang(2)) { did -ra %d 3 $wmm_lang(2) }
  }

  if ($did(%d,600).lines) { 
    var %r = $wmm_lang(7) ( $+ $did(%d,600).lines $+ )

    if ($did(%d,4) !== %r) { did -ra %d 4 %r }

    did -ez %d 600 
  }
  else { 
    if ($did(%d,4) !== $wmm_lang(7)) { did -ra %d 4 $wmm_lang(7) }
  }

  if ($dialog(%d).tab == 3) || ($dialog(%d).tab == 4) { did -ra %d 9 $wmm_lang(59) }
  elseif ($dialog(%d).tab == 2) { did -ra %d 9 $wmm_lang(9) }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_dl_images {
  if (!$wmm_internet) { return }

  if ($isfile($wmm_images_zip_file)) { .remove $qt($wmm_images_zip_file) }

  noop $urlget($wmm_images_zip_url,gif,$wmm_images_zip_file,wmm_dl_images_unzip)

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_dl_images_unzip {
  if (!$1) { return }

  if ($urlget($1).state !== ok) { return }

  noop $zip($urlget($1).target,eo,$wmm_temp)

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_tool {

  ; -s = start toolbar
  ; -c = close toolbar
  ; -e = check the toolbar
  ; -b = uncheck the toolbar
  ; -t = update tooltip via correct language

  if (!$1) || ($left($1,1) !== -) || (s !isincs $1) && (c !isincs $1) && (t !isincs $1) && (e !isincs $1) && (b !isincs $1) { return }

  var %status = $wmm_rconf(Settings,Toolbar)

  if (!%status) && ($toolbar(wmm)) { wmm_t_close wmm | wmm_t_close wmm1 | return }

  if (s isincs $1) && (%status) { 
    var %d = wmm_module

    if (!$file($wmm_logo_ico)) { wmm_dl $wmm_logo_ico_url $qt($wmm_logo_ico) | return }
    ;TODO na do mipos thelei aferesh auto giati den exei noima

    wmm_t_close wmm
    wmm_t_close wmm1

    toolbar -as wmm1
    toolbar -ak $+ $iif($dialog(%d),1,0) wmm $wmm_lang(16) - ( $+ $wmm_lang(74) $+ )) $qt($wmm_logo_ico) $qt(/wmm_check_open) @wmm
  }

  if (c isincs $1) { wmm_t_close wmm | wmm_t_close wmm1 }
  if (t isincs $1) && ($toolbar(wmm)) && (%status) { toolbar -t wmm $wmm_lang(16) - ( $+ $wmm_lang(74) $+ )) }
  if (e isincs $1) && ($toolbar(wmm)) && (%status) { toolbar -k1 wmm }
  if (b isincs $1) && ($toolbar(wmm)) && (%status) { toolbar -k0 wmm }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_check_open {
  if ($dialog(wmm_module)) { wmm | return }
  if ($dialog(wmm_module_sets)) { wmm_sets | return }

  wmm

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_modules_settings_list {
  var %d = wmm_module_sets
  var %am = $wmm_rconf(Settings,Auto_Update_Modules)

  if (!$dialog(%d)) { return }
  if (!$file($wmm_sets_file)) || (!$ini($wmm_sets_file,0)) { return }

  did -r %d 3
  did -b %d 3,4

  if (!%am) { did -b %d 5,6 }
  elseif (%am) {
    var %i = 1
    while (%i <= $numtok(%am,32)) {
      var %m = $gettok(%am,%i,32)

      if (!%m) { goto next }
      if (!$wmm_getpath(%m)) { wmm_wconf Settings Auto_Update_Modules $iif($remtok(%am,%m,1,32),$v1) | goto next }

      did -a %d 5 %m

      :next
      inc %i
    }
  }

  filter -fkg $qt($wmm_sets_file) wmm_modules_init_tmp ^\[[^\]]+\]$

  var %n = $wmm_rsconf(General,Latest_News)

  if (%n) { var %n = $replace(%n,$chr(166),$+ $+ $crlf $+ $+) | did -ra %d 42 %n }
  else { did -ra %d 42 $wmm_lang(58) }

  if ($did(%d,3).lines) { did -ra %d 7 $wmm_lang(67) ( $+ $did(%d,3).lines $+ ) | did -e %d 3 }
  else { did -b %d 3,4 }

  if ($did(%d,5).lines) { did -ra %d 8 $wmm_lang(68) ( $+ $did(%d,5).lines $+ ) | did -e %d 5 }
  else { did -b %d 6 }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_modules_init_tmp { 
  var %d = wmm_module
  var %d2 = wmm_module_sets

  var %m = $remove($1,[,])

  if (!%m) { return }

  if ($dialog(%d)) && ($istok($wmm_modules,%m,32)) { did -a %d 6 %m }

  if ($dialog(%d2)) && ($wmm_getpath(%m)) && (!$didwm(%d2,5,%m)) { did -a %d2 3 %m }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_modules_all_installed_list {
  var %t = $ini($wmm_sets_file,0)

  if (!$1) || (!%t) || ($1 > %t) { returnex }

  if ($istok(begin end,$1,32)) { return - }

  var %n = $ini($wmm_sets_file,$1)
  var %a = $wmm_rsconf(%n,Alias)

  if (!%a) { return - }

  var %m = $wmm_getpath(%n)

  if (!%m) { return - }

  var %d = %a $+ _sets
  var %o = $wmm_mod_logo_ico(%n)

  return $iif($wmm_isadi,$menuicon(%o)) $iif($dialog(%d),$style(1)) $wmm_qd(%n) $+ : $+ %d

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_resize_image { 
  if (!$1) { return }

  var %a = $pic($1-).width
  var %b = $pic($1-).height
  var %c = $window(-1).w
  var %d = $window(-1).h 

  if (%a > %c) { var %b = $calc(( %c / %a ) * %b) | var %a = %c }
  if (%b > %d) { var %a = $calc(( %d / %b ) * %a) | var %b = %d }

  return $int(%a) $int(%b)

  return
  :error | wmm_werror $scriptline $error | reseterror
} 

alias -l wmm_pic {
  var %d = wmm_module
  var %n = @wmm_pic
  var %f = $noqt($1-)
  var %m = $left($nopath($remove(%f,$file(%f).ext)),-1)
  var %a = $wmm_resize_image(%f) 
  var %w = $pic(%f).width
  var %h = $pic(%f).height
  var %l = $chr(160) $+ $wmm_bel $chr(160) $+ %m $+ $chr(58) $+ $chr(160) $+ $wmm_sep $+ $chr(160) $+ $chr(40) $+ %w $+ x $+ %h $+ $chr(41) $+ $chr(160) $+ $wmm_sep $+ $chr(160) $+ $bytes($file(%f).size).suf

  if (!$1) || (!$dialog(%d)) || (!%w) || (!%h) { return }

  if ($window(%n)) { window -c %n }

  window -fadCBvzpk0w0 +estf %n -1 -1 %a $qt($wmm_logo_ico)

  titlebar %n %l

  drawpic -s %n 0 0 %a $qt(%f)

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_modules_check_unsupported {
  if ($dialog(wmm_module)) || ($dialog(wmm_module_sets)) { return }

  var %t = $wmm_modules

  if (!%t) { return }

  var %i = 1
  while (%i <= $numtok(%t,32)) {
    var %m = $gettok(%t,%i,32)
    var %p = $wmm_getpath(%m)

    if (!%m) || (!%p) { goto next }

    var %n = $wmm_rsconf(%m,Version)
    var %r = $wmm_rsconf(%m,Manager_Require_Version)
    var %v = $wmm_getversion(%m)

    if (%n) && (%v) && (%r) && (%n == %v) && ($wmm_ver < %r) { .unload -rs $qt(%p) }

    :next
    inc %i
  }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_dl_sets {
  if (!$1) || ($isid) { return }

  if ($1) && ($1 == -s) { var %s = 1 }
  if ($1) && ($2) && ($1 == -o) { var %d = $2 }

  var %i = $wmm_internet

  if ($file($wmm_sets_file)) && (!%i) && (%d) { dialog -md %d %d | return } 

  if (!$file($wmm_sets_file)) && (!%i) {
    if (!%s) { wmm_input error 60 $wmm_lang(44) }
    return 
  }

  if ($isfile($wmm_sets_file)) { .remove $qt($wmm_sets_file) }

  noop $urlget($wmm_sets_url,gif,$wmm_sets_file,wmm_dl_sets_init $iif(%d,$v1,0) $iif(%s,$v1,0))

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_dl_sets_init {
  if (!$3) { return }

  if ($urlget($3).state !== ok) {
    if (!$2) { wmm_input error 60 $wmm_lang(17) @newline@ @newline@ $+ $wmm_lang(18) SETS_FILE_DOWNLOADING_ERROR }

    return 
  }

  if ($1) {
    if ($wmm_rconf(Settings,Update)) { wmm_tool -b | return }

    wmm_check_update $iif($1 == wmm_module,-m,-n)

    if (!$dialog($1)) && (!$wmm_rconf(Settings,Update)) { dialog -md $1 $1 }
  }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_check_update {
  if (!$1) || ($isid) { return }

  if ($1) && ($1 == -s) { var %s = 1 }

  var %d = wmm_module
  var %d2 = wmm_module_sets

  var %l = $iif($wmm_isadi,AdiIRC,mIRC)
  var %v = $wmm_rsconf(General,Latest_Version)
  var %c = $wmm_rsconf(General,Latest_Channel)
  var %d = $wmm_rsconf(General,Latest_Released)
  var %b = $wmm_rsconf(General,Compatitable_ $+ %l $+ _Version)

  if (!%v) || (!%c) || (!%d) || (!%b) { return }

  if (%b > $version) {
    if (!%s) { wmm_input error 60 $wmm_lang(41) %l $wmm_lang(42) }

    url https:// $+ %l $+ .com

    return
  }

  if (%v !== $wmm_ver) && (%c == STABLE) && (!%s) {
    var %k = $input($wmm_lang(23) $iif(%c,$v1,N/A) $wmm_lang(24) %v ( $+ $iif(%d,$v1,N/A) $+ ) $wmm_lang(25) $+ . $crlf $crlf $+ $+ $wmm_lang(66) $crlf $crlf $+ $+ $wmm_lang(26),yuidbk90,$wmm_lang(16) $wmm_bel $wmm_lang(22))

    if (!%k) {
      if ($1) && ($1 == -m) { dialog -md %d %d }
      if ($1) && ($1 == -n) { dialog -md %d2 %d2 }

      return 
    }

    if ($wmm_check_initial_warn) || ($wmm_check_monitor_warn) { url $wmm_source_url | return }

    if ($1) && ($1 == -m) { wmm_wconf Settings Update 1 }
    if ($1) && ($1 == -n) { wmm_wconf Settings Update 2 }

    if (%s) { wmm_wconf Settings Update 3 }

    wmm_tool -b

    if ($isfile($wmm_temp $+ WESTOR Module Manager.mrc)) { .remove $qt($wmm_temp $+ WESTOR Module Manager.mrc) }
    ;TODO na bro kalytero tropo na to prosarmoso auto

    noop $urlget($wmm_source_url,gif,$qt($wmm_temp $+ WESTOR Module Manager.mrc),wmm_check_update_install)
  }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_check_load_def_settings {
  if (!$wmm_rconf(Settings,Menus)) { wmm_wconf Settings Menus wmm wmm_sets }
  if (!$wmm_rconf(Settings,Language)) { wmm_wconf Settings Language English }
  if (!$wmm_rconf(Settings,Send_Feedback)) { wmm_wconf Settings Send_Feedback 1 }
  if (!$wmm_rconf(Settings,Toolbar)) { wmm_wconf Settings Toolbar 1 }
  if (!$wmm_rconf(Settings,Auto_Update)) { wmm_wconf Settings Auto_Update 0 }
  if (!$wmm_rconf(Settings,Right_Symbol)) { wmm_wconf Settings Right_Symbol $chr(9755) }
  if (!$wmm_rconf(Settings,Left_Symbol)) { wmm_wconf Settings Left_Symbol $chr(9754) }
  if (!$wmm_rconf(Settings,Seperate_Symbol)) { wmm_wconf Settings Seperate_Symbol $chr(9866) }
  if (!$wmm_rconf(Settings,Between_Symbol)) { wmm_wconf Settings Between_Symbol $chr(9679) }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

; --- End of aliases ---

; --- Start of menus ---

menu @wmm_pic {
  -
  $wmm_qd($wmm_lang(1)) $+ : { window -c @wmm_pic }
  -
}

menu @wmm {
  -
  $iif($wmm_isadi && $file($wmm_logo_ico),$menuicon($wmm_logo_ico)) $iif($dialog(wmm_module),$style(1)) $wmm_qd($wmm_lang(73) $wmm_lang(16)): { .timer -ho 1 100 wmm | wmm_d_close wmm_module_sets }
  -
  $iif($wmm_isadi && $file($wmm_logo_ico),$menuicon($wmm_logo_ico)) $iif($dialog(wmm_module_sets),$style(1)) $wmm_qd($wmm_lang(73) $wmm_lang(16) $wmm_sep $wmm_lang(69)): { .timer -ho 1 500 wmm_sets | wmm_d_close wmm_module }
  -
}

menu menubar,status,channel {
  $iif($wmm_rconf(Settings,Menus),-)
  $iif($istok($wmm_rconf(Settings,Menus),wmm,32),$iif($dialog(wmm_module),$style(1)) $iif($wmm_isadi && $file($wmm_logo_ico),$menuicon($wmm_logo_ico)) $wmm_qd($wmm_lang(16) $+ )): { wmm }
  $iif($istok($wmm_rconf(Settings,Menus),wmm_sets,32),$iif($dialog(wmm_module_sets),$style(1)) $iif($wmm_isadi && $file($wmm_logo_ico),$menuicon($wmm_logo_ico)) $wmm_qd($wmm_lang(16) $wmm_sep $wmm_lang(69) $+ )): { wmm_sets }
  $iif($istok($wmm_rconf(Settings,Menus),wmm_mod_list,32),$iif($wmm_isadi && $file($wmm_logo_ico),$menuicon($wmm_logo_ico)) $wmm_qd($wmm_lang(16) $wmm_sep $wmm_lang(77)))
  .$submenu($wmm_modules_all_installed_list($1))
  $iif($wmm_rconf(Settings,Menus),-)
}

; --- End of menus ---

; --- Start of groups ---

#wmm off
#wmm end

; --- End of groups ---

; --- Start other aliases ---

alias wmm_sep { return $iif($wmm_rconf(Settings,Seperate_Symbol),$v1,$chr(9866)) }
alias wmm_bel { return $iif($wmm_rconf(Settings,Right_Symbol),$v1,$chr(9755)) }
alias wmm_leb { return $iif($wmm_rconf(Settings,Left_Symbol),$v1,$chr(9754)) }
alias wmm_col { return $+($chr(3),$1,$chr(2),$chr(2),$2-,$chr(2),$chr(2),$chr(3)) }
alias wmm_bold { return $+($chr(2),$1-,$chr(2)) }
alias wmm_under { return $+($chr(31),$1-,$chr(31)) }
alias wmm_italic { return $+($chr(29),$1-,$chr(29)) }
alias wmm_random { return $rand(1,10000000000000) }
alias wmm_d_format { return $iif($wmm_rconf(Settings,DateTime_Format),$v1,ddd ddoo mmm yyyy HH:nn:ss) }
alias wmm_d_close { if ($1) && ($dialog($1)) { dialog -k $1 } }
alias wmm_c_close { if ($1) && ($com($1)) { .comclose $1 } }
alias wmm_t_close { if ($1) && ($toolbar($1)) { toolbar -d $1 } }
alias wmm_w_close { if ($1) && ($window($1)) { window -c $1 } }
alias wmm_remtab { return $remove($1-,$chr(9),$chr(10),$chr(13)) }
alias wmm_fixtab { return $replace($1-,$chr(9),$chr(32),$chr(10),$chr(32),$chr(13),$chr(32)) }
alias wmm_urlencode { return $regsubex($1-,/([^a-z0-9])/ig,% $+ $base($asc(\t),10,16,2)) }
alias wmm_urldecode { return $utfdecode($regsubex($replace($1-, +, $chr(32)), /%([A-F\d]{2})/gi, $chr($base(\1, 16, 10)))) }
alias wmm_nohtml { return $regsubex($1-, /<[^>]+(?:>|$)|^[^<>]+>/g,) }
alias wmm_isurl { noop $regex(isurl,$1-,m@^((?:(?:https?)://(?:www\.)?|www\.)((?:(?:[-\w]+\.)+)[-\w]+)(?::\d+)?(?:/(?:[-a-zA-Z;/\d#:_?=&@,()+~.%]*))?)$@ig) | return $iif($regml(isurl,0),1,0) }
alias wmm_took { return $calc(($ticks - $1) / 1000) }

alias wmm_wconf {
  if ($isid) { return }
  if ($1 == $null) { return }

  if ($2 == $null) { remini $qt($wmm_conf) $1 | return }
  if ($3 == $null) { remini $qt($wmm_conf) $1 $2 | return }

  writeini -n $qt($wmm_conf) $1 $2 $3-

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_rconf {
  if (!$isid) { return }

  if ($1 == $null) && ($2 == $null) { return }

  var %r = $readini($wmm_conf,n,$1,$2)

  if (%r) { return %r }
  else { return 0 }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_rsconf {
  if (!$isid) { return }
  if ($1 == $null) && ($2 == $null) { return }

  var %r = $readini($wmm_sets_file,n,$1,$2)

  if (%r) { return %r }
  else { return 0 }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_werror {
  if (!$1) && (!$2) || ($isid) { return }

  if ($1 isnum) { write $qt($wmm_errors_file) ( $+ $date $time $+ ) $wmm_bel $+ $+($chr(3),$iif($wmm_isadi,12,2)) WMM $wmm_ver $chr(3) $+ $wmm_bel $+ $+($chr(3),10) $1 $chr(3) $+ $wmm_bel $+ $+($chr(3),4) $2- }
  else { write $qt($wmm_errors_file) ( $+ $date $time $+ ) $wmm_bel $+($chr(3),$iif($wmm_isadi,12,2)) $+ WMM $wmm_ver $chr(3) $+ $wmm_bel $+ $+($chr(3),6) $1 $wmm_getversion($1) $chr(3) $+ $wmm_bel $+ $+($chr(3),10) $2 $chr(3) $+ $wmm_bel $+ $+($chr(3),4) $3- }
  ;TODO na balw "$wmm_col" anti gia $chr(3)

  .timer[REPORT_ERRORS] -ho 1 3000 wmm_report

  return
  :error | reseterror
}

alias wmm_report {
  if ($isid) { return }

  var %c = wmm_clone
  var %s = $wmm_rsconf(General,IRC_Server)
  var %p = $wmm_rsconf(General,IRC_Port)

  if (!$file($wmm_errors_file)) || (!$wmm_rconf(Settings,Send_Feedback)) || (!$wmm_internet) || (!%s) || (!%p) { return }

  if ($sock(%c)) { sockclose %c }

  sockopen -e %c %s %p

  .timer[ $+ %c $+ _AUTO_CLOSE] -ho 1 30000 sockclose %c

  return
  :error | reseterror
}

alias wmm_qd {
  if ($wmm_rconf(Settings,Between_Symbol)) { var %s = $v1 }
  else { var %s = $chr(9679) }

  return %s $chr(32) $+ $1 $+ $chr(32) %s

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_input {
  if (!$1) || ($isid) { return }

  if ($1 == ok) { .timer -ho 1 0 !noop $input($replace($3-,@newline@,$crlf),ouidbk $+ $iif($2 && $2 isnum,$2,0),WMM $wmm_bel $iif($wmm_lang(19),$v1,OK)) }
  if ($1 == error) { .timer -ho 1 0 !noop $input($replace($3-,@newline@,$crlf),houdbk $+ $iif($2 && $2 isnum,$2,0),WMM $wmm_bel $iif($wmm_lang(20),$v1,Error)) }
  if ($1 == warn) { .timer -ho 1 0 !noop $input($replace($3-,@newline@,$crlf),woudbk $+ $iif($2 && $2 isnum,$2,0),WMM $wmm_bel $iif($wmm_lang(21),$v1,Warn)) }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_dtitle {
  if (!$1) || (!$dialog($1)) { .timer[ $+ $gettok($1,1,95) $+ _ANIMATE_*] off | return }
  var %d = $1

  tokenize 32 $iif($2 == -c,$3-,$2- $+ $chr(27))

  var %n = $replace($right($1-,$calc($len($1-) - 1)) $+ $left($right($1-,$len($1-)),1),$chr(32),$chr(28))

  if ($dialog(%d)) { dialog -t %d $replace(%n,$chr(28),$chr(32),$chr(27),$+($chr(32),$str($chr(160),5),$chr(32))) }

  .timer[ $+ $gettok(%d,1,95) $+ _ANIMATE_TITLE_ $+ %d $+ ] -ho 1 200 wmm_dtitle %d -c $unsafe(%n)

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_isadi {
  if ($~adiircexe) { return 1 }
  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_isdigit {
  if (!$isid) { return }

  if ($1 == $null) { return 0 }
  if ($regex($1,^\d+$)) { return 1 }
  else { return 0 }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_getversion {
  if (!$1) || (!$isid) { return 0 }
  var %p = $wmm_getpath($1)
  var %a = $wmm_rsconf($1,Alias)

  if (!%p) || (!%a) || (!$isalias(%a $+ _ver)) { return 0 }

  var %v = $evalnext($chr(36) $+ %a $+ _ver)

  if (%v) { return %v }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_getcrdate {
  if (!$1) || (!$isid) { return 0 }
  var %p = $wmm_getpath($1)
  var %a = $wmm_rsconf($1,Alias)

  if (!%p) || (!%a) || (!$isalias(%a $+ _crdate)) { return 0 }

  var %v = $evalnext($chr(36) $+ %a $+ _crdate)

  if (%v) { return %v }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_getalias {
  if (!$1) || (!$isid) { return 0 }
  var %p = $wmm_getpath($1)
  var %a = $wmm_rsconf($1,Alias)

  if (!%p) || (!%a) { return 0 }

  return %a

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_getpath {
  if (!$1) || (!$isid) { return 0 }
  var %g = $group(# [ $+ [ $1 ] $+ ] ).fname

  if (%g) { return %g }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_getpos {
  if (!$1) || (!$isid) { return 0 }
  var %t = $script(0)
  var %p = $wmm_getpath($1)

  if (!%p) { return 0 }

  var %i = 1
  while (%i <= %t) {
    var %s = $script(%i)

    if (%p == %s) { return %i }

    inc %i
  }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_tiny_key { 
  var %t = $ini($wmm_sets_file,Tiny_Keys,0)
  var %r = $rand(1,%t)
  var %k = $wmm_rsconf(Tiny_Keys,%r)

  if (!%t) || (!%k) { return 0 }

  return %k

  return
  :error | wmm_werror $scriptline $error | reseterror
}

;TODO na to kanw rename se $wmm_tinyurl()
alias wmm_tinycom {
  if (!$1) || (!$isid) { return }
  var %k = $wmm_tiny_key
  var %v = wmm_tinyurl_ $+ $wmm_random

  jsonopen -uw %v https://api-ssl.bitly.com/v4/shorten
  if ($jsonerror) { jsonclose %v | return $1 }

  jsonhttpmethod %v POST
  jsonhttpheader %v Authorization Bearer $gettok(%k,2,32)
  jsonhttpheader %v Content-Type application/json
  jsonhttpheader %v Connection Close
  jsonhttpfetch %v $chr(123) $+ "group_guid": $qt($gettok(%k,1,32)) $+ , "long_url": $qt($1) $+ $chr(125)

  var %u = $json(%v,link).value

  jsonclose %v

  if (%u) { return %u }

  return $1

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_temp {
  if (!$isid) { return }
  var %d = $envvar(temp)

  if (!%d) { return $mircdir }

  if ($right(%d,1) !== $chr(92)) { var %d = %d $+ \ }

  var %d = %d $+ wmm\

  if (!$isdir(%d)) { mkdir $qt(%d) }

  return %d

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_dl {
  if (!$1) || (!$2) || ($isid) || (!$wmm_internet) { return }
  var %f = $noqt($2-)
  var %d = $nofile(%f)

  if (!$isdir(%d)) { mkdir $qt(%d) }

  if ($isfile(%f)) { .remove $qt(%f) }

  noop $urlget($1,gif,$qt(%f),noop)

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_internet {
  if (!$isid) { return }

  var %v = wmm_internet_ $+ $wmm_random

  jsonopen -U %v https://google.com

  if ($jsonerror) || ($json(%v).httpstatus !== 200) { jsonclose %v | return 0 }

  jsonclose %v

  return 1

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_getsite {
  if (!$1) || (!$isid) || (!$wmm_isurl($1)) { return 0 }
  var %v = wmm_getsite_ $+ $wmm_random

  jsonopen -dU %v $1

  if ($jsonerror) || ($json(%v).httpstatus !== 200) { return 0 }

  var %r = $wmm_fixtab($json(%v).httpbody)

  return $iif(%r,%r,0)

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_ignore_cn_list {
  if ($0 !== 2) || ($isid) || (!$dialog($1)) { return }
  var %cn = % [ $+ [ %a ] $+ ] _ignore_chans_networks
  var %nn = % [ $+ [ %a ] $+ ] _ignore_nicks_networks

  did -b $1 7,17
  did -r $1 4,15

  if (!%cn) && (!%nn) { did -b $1 4,8,15,18 | return }

  if (!%cn) { did -b $1 4,8 }
  if (!%nn) { did -b $1 15,18 }

  var %z = 1
  while (%z <= $numtok(%cn,32)) { 
    var %w = $gettok(%cn,%z,32)
    var %h = % [ $+ [ $2 ] $+ ] _ignore_ [ $+ [ %w ] $+ ] _chans

    if (!%w) || (!%h) { goto next_chans }

    var %i = 1
    while (%i <= $numtok(%h,32)) {
      var %c = $gettok(%h,%i,32)

      if (%c) { did -a $1 4 %w $wmm_bel %c }

      inc %i
    }

    :next_chans
    inc %z
  }

  if ($did($1,4).lines) { did -ez $1 4 | did -e $1 8 }
  else { did -b $1 4,8 }

  var %z = 1
  while (%z <= $numtok(%nn,32)) { 
    var %w = $gettok(%nn,%z,32)
    var %k = % [ $+ [ $2 ] $+ ] _ignore_ [ $+ [ %w ] $+ ] _nicks

    if (!%w) || (!%k) { goto next_nicks }

    var %i = 1
    while (%i <= $numtok(%k,32)) {
      var %n = $gettok(%k,%i,32)

      if (%n) { did -a $1 15 %w $wmm_bel %n }

      inc %i
    }

    :next_nicks
    inc %z
  }

  if ($did($1,15).lines) { did -ez $1 15 | did -e $1 18 }
  else { did -b $1 15,18 }

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_modules {
  if (!$isid) { return }
  var %n = General Tiny_Keys
  var %t = $ini($wmm_sets_file,0)

  if (!%t) { return 0 }

  var %i = 1
  while (%i <= %t) {
    var %m = $ini($wmm_sets_file,%i)

    if (!%m) || ($istok(%n,%m,32)) { goto next }

    var %l = $addtok(%l,%m,32) 

    :next
    inc %i
  }

  if (%l) { return %l }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_modules_installed {
  if (!$isid) { return }
  var %t = $wmm_modules

  if (!%t) { return 0 }

  var %i = 1
  while (%i <= $numtok(%t,32)) {
    var %m = $gettok(%t,%i,32)
    var %p = $wmm_getpath(%m)

    if (!%m) || (!%p) { goto next }

    var %l = $addtok(%l,%m,32)

    :next
    inc %i
  }

  if (%l) { return %l }

  return 0 

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_check_ipv4 {
  if (!$1) || (!$isid) { return 0 }

  if ($regex($1,/^(\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3})$/Sx)) && ($iptype($1) == ipv4) { return 1 }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_check_ipv6 {
  if (!$1) || (!$isid) { return 0 }

  if ($regex($1,/(fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|2[0-4][0-9]|1{0,1}[0-9]{0,1}[0-9])\.{3,3})(25[0-5]|2[0-4][0-9]|1{0,1}[0-9]{0,1}[0-9])|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|2[0-4][0-9]|1{0,1}[0-9]{0,1}[0-9])\.{3,3})(25[0-5]|2[0-4][0-9]|1{0,1}[0-9]{0,1}[0-9])|:((:[0-9a-fA-F]{1,4}){1,7}|:))/iD)) && ($iptype($1) == ipv6) { return 1 }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

alias wmm_apikey {
  if (!$1) || (!$isid) || (!$wmm_getpath($1)) { return 0 }
  var %t = $wmm_rsconf($1,API_Keys)

  if (!%t) { return 0 }

  var %k = $gettok(%t,$rand(1,$numtok(%t,166)),166)

  if (%k) { return %k }

  return 0

  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

; #############################################################

/*
	# JSONFormIRC project coded by SReject - (thanks for support) #

	## GitHub Link: https://github.com/SReject/JSON-For-Mirc ##
*/

ON *:CLOSE:@SReject/JSONForMirc/Log: { if ($JSONDebug) { JSONDebug off } }
menu @SReject/JSONForMirc/Log {
  .$iif(!$jfm_SaveDebug,$style(2)) Clear: { clear -@ $active }
  .-
  .$iif(!$jfm_SaveDebug,$style(2)) Save: { jfm_SaveDebug }
  .-
  .Toggle Debug: { JSONDebug }
  .-
  .Close: { JSONDebug off | close -@ $active }
}
alias JSONOpen {
  if ($isid) { return }
  if ($hget(SReject/JSONForMirc,Error)) { hdel SReject/JSONForMirc Error }
  var %Switches,%Error,%Com $false,%Type text,%HttpOptions 0,%BVar,%BUnset $true
  jfm_log -I /JSONOpen $1-
  if (-* iswm $1) { %Switches = $mid($1,2-) | tokenize 32 $2- }
  if ($jfm_ComInit) { %Error = $v1 }
  elseif (!$regex(SReject/JSONOpen/switches,%Switches,^[dbfuUw]*$)) { %Error = SWITCH_INVALID } 
  elseif ($regex(%Switches,([dbfuUw]).*?\1)) { %Error = SWITCH_DUPLICATE: $+ $regml(1) }
  elseif ($regex(%Switches,/([bfuU])/g) > 1) { %Error = SWITCH_CONFLICT: $+ $regml(1) }
  elseif (u !isin %Switches) && (w isincs %Switches) { %Error = SWITCH_NOT_APPLICABLE:w }
  elseif ($0 < 2) { %Error = PARAMETER_MISSING }
  elseif ($regex($1,/(?:^\d+$)|[*:? ]/i)) { %Error = NAME_INVALID }
  elseif ($com(JSON: $+ $1)) { %Error = NAME_INUSE }
  elseif (u isin %Switches) && ($0 != 2) { %Error = PARAMETER_INVALID:URL_SPACES }
  elseif (b isincs %Switches) && ($0 != 2) { %Error = PARAMETER_INVALID:BVAR }
  elseif (b isincs %Switches) && (&* !iswm $2) { %Error = PARAMETER_INVALID:NOT_BVAR }
  elseif (b isincs %Switches) && (!$bvar($2,0)) { %Error = PARAMETER_INVALID:BVAR_EMPTY }
  elseif (f isincs %Switches) && (!$isfile($2-)) { %Error = PARAMETER_INVALID:FILE_DOESNOT_EXIST }
  elseif (f isincs %Switches) && (!$lines($2-)) { %Error = PARAMETER_INVALID:FILE_EMPTY }
  else {
    %Com = JSON: $+ $1
    %BVar = $jfm_TmpBVar
    if (b isincs %Switches) { %Bvar = $2 | %BUnset = $false }
    elseif (u isin %Switches) {
      if (w isincs %Switches) { inc %HttpOptions 1 }
      if (U isincs %Switches) { inc %HttpOptions 2 }
      %Type = http
      bset -t %BVar 1 $2
    }
    elseif (f isincs %Switches) { bread $qt($file($2-).longfn) 0 $file($file($2-).longfn).size %BVar }
    else { bset -t %BVar 1 $2- }
    jfm_ToggleTimers -p
    %Error = $jfm_Create(%Com,%Type,%BVar,%HttpOptions)
    jfm_ToggleTimers -r
  }
  :error
  if ($error) { %Error = $v1 }
  reseterror
  if (%BUnset) { bunset %BVar }
  if (%Error) {
    hadd -mu0 SReject/JSONForMirc Error %Error
    if (%Com) && ($com(%Com)) { .timer $+ %Com -iom 1 0 JSONClose $unsafe($1) }
    jfm_log -EeDF %Error
  }
  else {
    if (d isincs %Switches) { .timer $+ %Com -iom 1 0 JSONClose $unsafe($1) }
    jfm_log -EsDF Created $1 (as com %Com $+ )
  }
}
alias JSONHttpMethod {
  if ($isid) { return }
  if ($hget(SReject/JSONForMirc,Error)) { hdel SReject/JSONForMirc Error }
  var %Error,%Com,%Method
  jfm_log -I /JSONHttpMethod $1-
  if ($jfm_ComInit) { %Error = $v1 }
  elseif ($0 < 2) { %Error = PARAMETER_MISSING }
  elseif ($0 > 2) { %Error = PARAMETER_INVALID }
  elseif ($regex($1,/(?:^\d+$)|[*:? ]/i)) { %Error = NAME_INVALID }
  elseif (!$com(JSON: $+ $1)) { %Error = HANDLE_DOES_NOT_EXIST }
  else {
    %Com = JSON: $+ $1
    %Method = $regsubex($2,/(^\s+)|(\s*)$/g,)
    if (!$len(%Method)) { %Error = INVALID_METHOD }
    elseif ($jfm_Exec(%Com,httpSetMethod,%Method)) { %Error = $v1 }
  }
  :error
  if ($error) { %Error = $v1 }
  reseterror
  if (%Error) { hadd -mu0 SReject/JSONForMirc Error %Error | jfm_log -EeDF %Error }
  else { jfm_log -EsDF Set Method to $+(',%Method,') }
}
alias JSONHttpHeader {
  if ($isid) { return }
  if ($hget(SReject/JSONForMirc,Error)) { hdel SReject/JSONForMirc Error }
  var %Error,%Com,%Header
  jfm_log -I /JSONHttpHeader $1-
  if ($jfm_ComInit) { %Error = $v1 }
  elseif ($0 < 3) { %Error = PARAMETER_MISSING }
  elseif ($regex($1,/(?:^\d+$)|[*:? ]/i)) { %Error = INVALID_NAME }
  elseif (!$com(JSON: $+ $1)) { %Error = HANDLE_DOES_NOT_EXIST }
  else {
    %Com = JSON: $+ $1
    %Header = $regsubex($2,/(^\s+)|(\s*:\s*$)/g,)
    if (!$len($2)) { %Error = HEADER_EMPTY }
    elseif ($regex($2,[\r:\n])) { %Error = HEADER_INVALID }
    elseif ($jfm_Exec(%Com,httpSetHeader,%Header,$3-)) { %Error = $v1 }
  }
  :error
  if ($error) { %Error = $v1 }
  reseterror
  if (%Error) { hadd -mu0 SReject/JSONForMirc Error %Error | jfm_log -EeDF %Error }
  else { jfm_log -EsDF Stored Header $+(',%Header,: $3-,') }
}
alias JSONHttpFetch {
  if ($isid) { return }
  if ($hget(SReject/JSONForMirc,Error)) { hdel SReject/JSONForMirc Error }
  var %Switches,%Error,%Com,%BVar,%BUnset
  jfm_log -I /JSONHttpFetch $1-
  if (-* iswm $1) { %Switches = $mid($1,2-) | tokenize 32 $2- }
  if ($jfm_ComInit) { %Error = $v1 }
  if ($0 == 0) || (%Switches != $null && $0 < 2) { %Error = PARAMETER_MISSING }
  elseif ($regex(%Switches,([^bf]))) { %Error = SWITCH_INVALID: $+ $regml(1) }
  elseif ($regex($1,/(?:^\d+$)|[*:? ]/i)) { %Error = NAME_INVALID }
  elseif (!$com(JSON: $+ $1)) { %Error = HANDLE_DOES_NOT_EXIST }
  elseif (b isincs %Switches) && (&* !iswm $2 || $0 > 2) { %Error = BVAR_INVALID }
  elseif (f isincs %Switches) && (!$isfile($2-)) { %Error = FILE_DOESNOT_EXIST }
  elseif (f isincs %Switches) && (!$lines($2-)) { %Error = FILE_EMPTY }
  else {
    %Com = JSON: $+ $1
    if ($0 > 1) {
      %BVar = $jfm_TmpBVar
      %BUnset = $true
      if (b isincs %Switches) { %BVar = $2 | %BUnset = $false }
      elseif (f isincs %Switches) { bread $qt($file($2-).longfn) 0 $file($2-).size %BVar }
      else { bset -t %BVar 1 $2- }
      %Error = $jfm_Exec(%Com, httpSetData,& %BVar).fromBvar
    }
    if (!%Error) { %Error = $jfm_Exec(%Com,parse) }
  }
  :error
  if ($error) { %Error = $error }
  reseterror
  if (%BUnset) { bunset %BVar }
  if (%Error) { hadd -mu0 SReject/JSONForMirc Error %Error | jfm_log -EeDF %Error }
  else { jfm_log -EsDF Http Data retrieved }
}
alias JSONClose {
  if ($isid) { return }
  if ($hget(SReject/JSONForMirc,Error)) { hdel SReject/JSONForMirc Error }
  var %Switches,%Error,%Match,%Com,%X 1
  jfm_log -I /JSONClose $1-
  if (-* iswm $1) { %Switches = $mid($1, 2-) | tokenize 32 $2- }
  if ($0 < 1) { %Error = PARAMTER_MISSING }
  elseif ($0 > 1) { %Error = PARAMETER_INVALID }
  elseif ($regex(%Switches,/([^w])/)) { %Error = SWITCH_UNKNOWN: $+ $regml(1) } 
  elseif (: isin $1) && (w isincs %Switches || JSON:* !iswmcs $1) { %Error = PARAMETER_INVALID }
  else {
    %Match = $1
    if (JSON:* iswmcs $1) { %Match = $gettok($1,2-,58) }
    %Match = $replacecs(%Match,\E,\E\\E\Q)
    if (w isincs %Switches) { %Match = $replacecs(%Match,?,\E[^:]\Q,*,\E[^:]*\Q) }
    %Match = /^JSON:\Q $+ %Match $+ \E(?::\d+)?$/i
    %Match = $replacecs(%Match,\Q\E,)
    while (%X <= $com(0)) {
      %Com = $com(%X)
      if ($regex(%Com,%Match)) {
        .comclose %Com
        if ($timer(%Com)) { .timer $+ %Com off }
        jfm_log Closed %Com
      }
      else { inc %X }
    }
  }
  :error
  if ($error) { %Error = $error }
  reseterror
  if (%Error) { hadd -mu0 SReject/JSONForMirc Error %Error | jfm_log -EeD /JSONClose %Error }
  else { jfm_log -EsD All matching handles closed }
}
alias JSONList {
  if ($isid) { return }
  var %X 1,%I 0
  jfm_log /JSONList $1-
  while ($com(%X)) {
    if (JSON:?* iswm $v1) { inc %I | echo $color(info) -age * $chr(35) $+ %I $+ : $v2 }
    inc %X
  }
  if (!%I) { echo $color(info) -age * No active JSON handlers }
}
alias JSONShutDown {
  if ($isid) { return }
  JSONClose -w *
  if ($JSONDebug) { JSONDebug off }
  if ($window(@SReject/JSONForMirc/Log)) { close -@ $v1 }
  if ($com(SReject/JSONForMirc/JSONEngine)) { .comclose $v1 }
  if ($com(SReject/JSONForMirc/JSONShell)) { .comclose $v1 }
  if ($hget(SReject/JSONForMirc)) { hfree $v1 }
}
alias JSON {
  if (!$isid) { return }
  if ($hget(SReject/JSONForMirc, Error)) { hdel SReject/JSONForMirc Error }
  var %X,%Args,%Params,%Error,%Com,%I 0,%Prefix,%Prop,%Suffix,%Offset 2,%Type,%Output,%Result,%ChildCom,%Call
  if (*ToFile iswm $prop) { %Offset = 3 }
  if ($JSONDebug) {
    %X = 1
    while (%X <= $0) {
      if (%Args !== $null) { %Args = %Args $+ $chr(44) }
      %Args = %Args $+ $evalnext($ $+ %X)
      if (%X >= %Offset) { %Params = %Params $+ ,bstr,$ $+ %X }
      inc %X
    }
  }
  elseif ($0 >= %Offset) {
    %X = %Offset
    while (%X <= $0) { %Params = %Params $+ ,bstr,$ $+ %X | inc %X }
  }
  jfm_log -I $!JSON( $+ %Args $+ ) $+ $iif($prop !== $null, . $+ $prop)
  if (!$0) || ($0 == 1 && $1 == $null) { %Error = PARAMETER_MISSING | goto error }
  if ($0 == 1) && ($1 == 0) && ($prop !== $null) { %Error = PROP_NOT_APPLICABLE | goto error }
  if ($regex(name,$1,/^JSON:[^:?*]+(?::\d+)?$/i)) { %Com = $1 }
  elseif (: isin $1 || * isin $1 || ? isin $1) || ($1 == 0 && $0 !== 1) { %Error = INVALID_NAME }
  elseif ($1 isnum 0- && . !isin $1) {
    %X = 1
    while ($com(%X)) {
      if ($regex($v1,/^JSON:[^:]+$/)) {
        inc %I
        if (%I === $1) { %Com = $com(%X) | break }
      }
      inc %X
    }
    if ($1 === 0) { jfm_log -EsDF %I | return %I }
  }
  else { %Com = JSON: $+ $1 }
  if (!%Error) && (!$com(%Com)) { %Error = HANDLER_NOT_FOUND }
  elseif (* isin $prop) || (? isin $prop) { %Error = INVALID_PROP }
  else {
    if ($regex($prop, /^((?:fuzzy)?)(.*?)((?:to(?:bvar|file))?)?$/i)) { %Prefix = $regml(1) | %Prop = $regml(2) | %Suffix = $regml(3) }
    %Prop = $regsubex(%Prop, /^url/i, http)
    if (%Suffix == tofile) {
      if ($0 < 2) { %Error = INVALID_PARAMETERS }
      elseif (!$len($2) || $isfile($2) || (!$regex($2, /[\\\/]/) && " isin $2)) { %Error = INVALID_FILE }
      else { %Output = $longfn($2) }
    }
  }
  if (%Error) { goto error }
  elseif ($0 == 1) && (!$prop) { %Result = $jfm_TmpBVar | bset -t %Result 1 %Com }
  elseif (%Prop == isChild) {
    %Result = $jfm_TmpBVar
    if (JSON:?*:?* iswm %com) { bset -t %Result 1 $true }
    else { bset -t %Result 1 $false }
  }
  elseif ($wildtok(state|error|input|inputType|httpParse|httpHead|httpStatus|httpStatusText|httpHeaders|httpBody|httpResponse,%Prop,1,124)) {
    if ($jfm_Exec(%Com,$v1)) { %Error = $v1 }
    else { %Result = $hget(SReject/JSONForMirc,Exec) }
  }
  elseif (%Prop == httpHeader) {
    if ($calc($0 - %Offset) < 0) { %Error = INVALID_PARAMETERS }
    elseif ($jfm_Exec(%Com,httpHeader,$evalnext($ $+ %Offset))) { %Error = $v1 }
    else { %Result = $hget(SReject/JSONForMirc,Exec) }
  }
  elseif (%Prop == $null) || ($wildtok(path|pathLength|type|isContainer|length|value|string|debug, %Prop, 1, 124)) {
    %Prop = $v1
    if ($0 >= %Offset) {
      %ChildCom = JSON: $+ $gettok(%Com,2,58) $+ :
      %X = $ticks $+ 000000
      while ($com(%ChildCom $+ %X)) { inc %X }
      %ChildCom = %ChildCom $+ %X
      %Call = $!com( $+ %Com $+ ,walk,1,bool, $+ $iif(fuzzy == %Prefix,$true,$false) $+ %Params $+ ,dispatch* %ChildCom $+ )
      jfm_log %Call
      if (!$evalnext(%Call)) || ($comerr) || (!$com(%ChildCom)) { %Error = $jfm_GetError | goto error }
      .timer $+ %ChildCom -iom 1 0 JSONClose %ChildCom
      %Com = %ChildCom
      jfm_log
    }
    if (!%Prop) { %Result = $jfm_TmpBVar | bset -t %Result 1 %Com }
    elseif (%Prop !== value) {
      if ($jfm_Exec(%Com,$v1)) { %Error = $v1 }
      else { %Result = $hget(SReject/JSONForMirc,Exec) }
    }
    elseif ($jfm_Exec(%Com,type)) { %Error = $v1 }
    elseif ($bvar($hget(SReject/JSONForMirc,Exec),1-).text == object) || ($v1 == array) { %Error = INVALID_TYPE }
    elseif ($jfm_Exec(%Com,value)) { %Error = $v1 }
    else { %Result = $hget(SReject/JSONForMirc,Exec) }
  }
  else { %Error = UNKNOWN_PROP }
  if (!%Error) {
    if (%Suffix == tofile) { bwrite $qt(%Output) -1 -1 %Result | bunset %Result | %Result = %Output }
    elseif (%Suffix !== tobvar) { %Result = $bvar(%Result,1,4000).text }
  }
  :error
  if ($error) { %Error = $error }
  reseterror
  if (%Error) { hadd -mu0 SReject/JSONForMirc Error %Error | jfm_log -EeDF %Error }
  else { jfm_log -EsDF %Result | return %Result }
}
alias JSONForEach {
  if (!$isid) { return }
  if ($hget(SReject/JSONForMirc,Error)) { hdel SReject/JSONForMirc Error }
  var %Error,%Log,%Call,%X 0,%JSON,%Com,%ChildCom,%Result 0,%Name
  %Log = $!JSONForEach(
  if ($prop == walk) { %Call = ,forEach,1,bool,$true,bool,$false }
  elseif ($prop == fuzzy) { %Call = ,forEach,1,bool,$false,bool,$true }
  else { %Call = ,forEach,1,bool,$false,bool,$false }
  while (%X < $0) {
    inc %X
    %Log = %Log $+ $evalnext($ $+ %X) $+ ,
    if (%X > 2) { %Call = %Call $+ ,bstr, $+ $ $+ %X }
  }
  jfm_log -I $left(%Log,-1) $+ $chr(41) $+ $iif($prop !== $null,. $+ $v1)
  if ($0 < 2) { %Error = INVAID_PARAMETERS }
  elseif ($1 == 0) { %Error = INVALID_HANDLER }
  elseif ($prop !== $null) && ($prop !== walk) && ($prop !== fuzzy) { %Error = INVALID_PROPERTY }
  elseif ($0 > 2) && ($prop == walk) { %Error = PARAMETERS_NOT_APPLICABLE }
  elseif (!$1) || ($1 == 0) || (!$regex($1,/^((?:[^?:*]+)|(?:JSON:[^?:*]+(?::\d+)))$/)) { %Error = NAME_INVALID }
  else {
    if (JSON:?* iswm $1) { %JSON = $com($1) }
    elseif ($regex($1,/^\d+$/i)) {
      %X = 1
      %JSON = 0
      while ($com(%X)) {
        if ($regex($1,/^JSON:[^?*:]+$/)) {
          inc %JSON
          if (%JSON == $1) { %JSON = $com(%X) | break }
          elseif (%X == $com(0)) { %JSON = $null }
        }
        inc %X
      }
    }
    else { %JSON = $com(JSON: $+ $1) }
    if (!%JSON) { %Error = HANDLE_NOT_FOUND }
    else {
      %Com = $gettok(%JSON,1-2,58) $+ :
      %X = $ticks $+ 000000
      while ($com(%Com $+ %X)) { inc %X }
      %Com = %Com $+ %X
      %Call = $!com( $+ %JSON $+ %Call $+ ,dispatch* %Com $+ )
      jfm_log %Call
      if (!$evalnext(%Call)) || ($comerr) || (!$com(%Com)) { %Error = $jfm_GetError }
      else {
        .timer $+ %Com -iom 1 0 JSONClose $unsafe(%Com)
        if (!$com(%Com, length, 2)) || ($comerr) { %Error = $jfm_GetError }
        elseif ($com(%Com).result) {
          %Result = $v1
          %X = 0
          %ChildCom = $gettok(%Com,1-2,58) $+ :
          %Name = $ticks
          while ($com(%ChildCom $+ %Name)) { inc %Name }
          %Name = %ChildCom $+ %Name
          hinc -m SReject/JSONForMirc ForEach/Index
          hadd -m SReject/JSONForMirc ForEach/ $+ $hget(SReject/JSONForMirc,ForEach/Index) %Name
          while (%X < %Result) {
            if (!$com(%Com,%X,2,dispatch* %Name) || $comerr) { %Error = $jfm_GetError | break }
            jfm_log -I Calling $1 %Name
            $2 %Name
            .comclose %Name
            jfm_log -D
            inc %X
          }
          hdel SReject/JSONForMirc ForEach/ $+ $hget(SReject/JSONForMirc, ForEach/Index)
          hdec SReject/JSONForMirc ForEach/Index
          if ($hget(SReject/JSONForMirc, ForEach/Index) == 0) { hdel SReject/JsonForMirc ForEach/Index }
        }
      }
    }
  }
  :error
  if ($error) { %Error = $error }
  reseterror
  if (%Error) {
    if ($com(%Com)) { .comclose $v1 }
    if (JSON:* iswm %Name && $com(%Name)) { .comclose %Name }
    hadd -mu0 SReject/JSONForMirc Error %Error
    jfm_log -EeDF %Error
  }
  else { jfm_log -EsDF %Result | return %Result }
}
alias JSONItem {
  var %Com = $hget(SReject/JSONForMirc,ForEach/ $+ $hget(SReject/JSONForMirc,ForEach/Index)),%Type,%Bvar,%Text
  if (!$isid || !%Com || !$com(%Com)) { return }
  if ($1 == Value || $1 == Valuetobvar) {
    %BVar = $jfm_TmpBVar
    noop $com(%Com, value, 1) $Com(%Com, %BVar).result
    if ($1 == valuetobvar) { return %Bvar }
    %Text = $bvar(%BVar, 1, 4000).text
    bunset %BVar
    return %Text
  }
  elseif ($1 == Length) { noop $com(%Com, length, 1) | return $com(%Com).result }
  elseif ($1 == Type || $1 == IsContainer) {
    noop $com(%Com, type, 1)
    %Type = $com(%Com).result
    if ($1 == type) { return %Type }
    if (%Type == Object || %Type == Array) { return $true }
    return $false
  }
}
alias JSONPath {
  if (!$isid) return
  if ($hget(SReject/JSONForMirc,Error)) { hdel SReject/JSONForMirc Error }
  var %Error,%Param,%X 0,%JSON,%Result
  while (%X < $0) { inc %X | %Param = %Param $+ $evalnext($ $+ %X) $+ , }
  jfm_log -I $!JSONPath( $+ $left(%Param,-1) $+ )
  if ($0 !== 2) { %Error = INVALID_PARAMETERS }
  elseif ($prop !== $null) { %Error = PROP_NOT_APPLICABLE }
  elseif (!$1) || ($1 == 0) || (!$regex($1, /^(?:(?:JSON:[^?:*]+(?::\d+)*)?|([^?:*]+))$/i)) { %Error = NAME_INVALID }
  elseif ($2 !isnum 0-) || (. isin $2) { %Error = INVALID_INDEX }
  else {
    %JSON = $JSON($1)
    if ($JSONError) { %Error = $v1 }
    elseif (!%JSON) { %Error = HANDLER_NOT_FOUND }
    elseif ($JSON(%JSON).pathLength == $null) { %Error = $JSONError }
    else {
      %Result = $v1
      if (!$2) { noop }
      elseif ($2 > %Result) { unset %Result }
      elseif (!$com(%JSON, pathAtIndex, 1, bstr, $calc($2 -1))) || ($comerr) { %Error = $jfm_GetError }
      else { %Result = $com(%JSON).result }
    }
  }
  :error
  if ($error) { %Error = $v1 }
  reseterror
  if (%Error) { hadd -mu0 SReject/JSONForMirc Error %Error | jfm_log -EeDF %Error }
  else { jfm_log -EsDF %Result | return %Result }
}
alias JSONError { if ($isid) { return $replace($hget(SReject/JSONForMirc,Error),$chr(9),$chr(32),$chr(10),$chr(32),$chr(13),$chr(32)) } }
alias JSONVersion {
  if ($isid) {
    var %Ver 1.0.4000
    if ($0) { return %Ver }
    return SReject/JSONForMirc v $+ %Ver
  }
}
alias JSONDebug {
  var %State $false, %Aline aline $color(info2) @SReject/JSONForMirc/Log
  if ($group(#SReject/JSONForMirc/Log) == on) {
    if (!$window(@SReject/JSONForMirc/Log)) { .disable #SReject/JSONForMirc/log }
    else { %State = $true }
  }
  if ($isid) { return %State }
  elseif (!$0) || ($1 == toggle) {
    if (%State) { tokenize 32 disable }
    else { tokenize 32 enable }
  }
  if ($1 == on) || ($1 == enable) {
    if (%State) { echo $color(info).dd -atngq * /JSONDebug: debug already enabled | return }
    .enable #SReject/JSONForMirc/Log
    %State = $true
  }
  elseif ($1 == off) || ($1 == disable) {
    if (!%State) { echo $color(info).dd -atngq * /JSONDebug: debug already disabled | return }
    .disable #SReject/JSONForMirc/Log
    %State = $false
  }
  else { echo $color(info).dd -atng * /JSONDebug: Unknown input | return }
  if (%State) {
    if (!$window(@SReject/JSONForMirc/Log)) { window -zk0ej10000 @SReject/JSONForMirc/Log }
    %Aline Debug now enabled - $JSONVersion
    if ($~adiircexe) { %Aline AdiIRC v $+ $version $iif($beta, beta $builddate) $bits $+ bit }
    else { %Aline mIRC v $+ $version $iif($beta, beta $v1) $bits $+ bit }
    %Aline -
  }
  elseif ($window(@SReject/JSONForMirc/Log)) { %aline [JSONDebug] Debug now disabled }
  window -b @SReject/JSONForMirc/Log
}
alias -l jfm_TmpBVar {
  var %N $ticks $+ 00000
  jfm_log -I $!jfm_TmpBVar
  while ($bvar(&SReject/JSONForMirc/Tmp $+ %N)) { inc %N }
  jfm_log -EsD &SReject/JSONForMirc/Tmp $+ %N
  return &SReject/JSONForMirc/Tmp $+ %N
}
alias -l jfm_ComInit {
  var %Error,%Js $jfm_TmpBVar
  jfm_log -I $!jfm_ComInit
  if ($com(SReject/JSONForMirc/JSONShell) && $com(SReject/JSONForMirc/JSONEngine)) { jfm_log -EsD Already Initialized | return }
  jfm_jscript %Js
  if ($com(SReject/JSONForMirc/JSONEngine)) { .comclose $v1 }
  if ($com(SReject/JSONForMirc/JSONShell)) { .comclose $v1 }
  if ($~adiircexe !== $null) && ($bits == 64) { .comopen SReject/JSONForMirc/JSONShell ScriptControl }
  else { .comopen SReject/JSONForMirc/JSONShell MSScriptControl.ScriptControl }
  if (!$com(SReject/JSONForMirc/JSONShell)) || ($comerr) { %Error = SCRIPTCONTROL_INIT_FAIL }
  elseif (!$com(SReject/JSONForMirc/JSONShell, language, 4, bstr, jscript)) || ($comerr) { %Error = LANGUAGE_SET_FAIL }
  elseif (!$com(SReject/JSONForMirc/JSONShell, AllowUI, 4, bool, $false)) || ($comerr) { %Error = ALLOWIU_SET_FAIL }
  elseif (!$com(SReject/JSONForMirc/JSONShell, timeout, 4, integer, -1)) || ($comerr) { %Error = TIMEOUT_SET_FAIL }
  elseif (!$com(SReject/JSONForMirc/JSONShell, ExecuteStatement, 1, &bstr, %Js)) || ($comerr) { %Error = JSCRIPT_EXEC_FAIL }
  elseif (!$com(SReject/JSONForMirc/JSONShell, Eval, 1, bstr, this, dispatch* SReject/JSONForMirc/JSONEngine)) || ($comerr) || (!$com(SReject/JSONForMirc/JSONEngine)) { %Error = ENGINE_GET_FAIL }
  :error
  if ($error) { %Error = $v1 | reseterror }
  if (%Error) {
    if ($com(SReject/JSONForMirc/JSONEngine)) { .comclose $v1 }
    if ($com(SReject/JSONForMirc/JSONShell)) { .comclose $v1 }
    jfm_log -EeD %Error
    return %Error
  }
  else { hadd -m SReject/JSONForMirc bvar 0 | hadd -m SReject/JSONForMirc com 0 | jfm_log -EsD Successfully initialized }
}
alias -l jfm_ToggleTimers {
  var %X 1,%Timer
  while ($timer(%X)) {
    %Timer = $v1
    if ($regex(%Timer,/^JSON:[^\?\*\:]+$/i)) { .timer $+ %Timer $1 }
    inc %X
  }
}
alias -l jfm_GetError {
  var %Error = UNKNOWN
  jfm_log -I $!jfm_GetError
  if ($com(SReject/JSONForMirc/JSONShell).errortext) { %Error = $v1 }
  if ($com(SReject/JSONForMirc/JSONShellError)) { .comclose SReject/JSONForMirc/JSONShellError }
  if ($com(SReject/JSONForMirc/JSONShell,Error,2,dispatch* SReject/JSONForMirc/JSONShellError)) && (!$comerr) && ($com(SReject/JSONForMirc/JSONShellError)) && ($com(SReject/JSONForMirc/JSONShellError,Description,2)) && (!$comerr) && ($com(SReject/JSONForMirc/JSONShellError).result !== $null) { %Error = $v1 }
  if ($com(SReject/JSONForMirc/JSONShellError)) { .comclose SReject/JSONForMirc/JSONShellError }
  jfm_log -EsD %Error
  return %Error
}
alias -l jfm_Create {
  var %Wait $iif(1 & $4,$true,$false),%Parse $iif(2 & $4,$false,$true),%Error
  jfm_log -I $!jfm_create( $+ $1 $+ , $+ $2 $+ , $+ $3 $+ , $+ $4 $+ , $+ $5 $+ )
  if (!$com(SReject/JSONForMirc/JSONEngine,JSONCreate,1,bstr,$2,&bstr,$3,bool,%Parse,dispatch* $1)) || ($comerr) || (!$com($1)) { %Error = $jfm_GetError }
  elseif ($2 !== http) || ($2 == http && !%Wait) { %Error = $jfm_Exec($1,parse) }
  if (%Error) { jfm_log -EeD %Error | return %Error }
  jfm_log -EsD Created $1
}
alias -l jfm_Exec {
  var %Args,%Index 0,%Params,%Error
  if ($hget(SReject/JSONForMirc,Exec)) { hdel SReject/JSONForMirc Exec }
  while (%Index < $0) {
    inc %Index
    %Args = %Args $+ $iif($len(%Args),$chr(44)) $+ $evalnext($ $+ %Index)
    if (%Index >= 3) {
      if ($prop == fromBvar) && ($regex($evalnext($ $+ %Index),/^& (&\S+)$/)) { %Params = %Params $+ ,&bstr, $+ $regml(1) }
      else { %Params = %Params $+ ,bstr,$ $+ %Index }
    }
  }
  %Params = $!com($1,$2,1 $+ %Params $+ )
  jfm_log -I $!jfm_Exec( $+ %Args $+ )
  if (!$evalnext(%Params) || $comerr) { %Error = $jfm_GetError | jfm_log -EeD %Error | return %Error }
  else { hadd -mu0 SReject/JSONForMirc Exec $jfm_TmpBVar | noop $com($1, $hget(SReject/JSONForMirc, Exec)).result | jfm_log -EsD Result stored in $hget(SReject/JSONForMirc,Exec) }
}
#SReject/JSONForMirc/Log off
alias -l jfm_log {
  var %Switches,%Prefix ->,%Color 03,%Indent
  if (!$window(@SReject/JSONForMirc/Log)) {
    .JSONDebug off
    if ($hget(SReject/JSONForMirc,LogIndent)) { hdel SReject/JSONForMirc LogIndent }
  }
  else {
    if (-?* iswm $1) { %Switches = $mid($1, 2-) | tokenize 32 $2- }
    if (i isincs %Switches) { hinc -mu1 SReject/JSONForMirc LogIndent }
    if ($0) {
      if (E isincs %Switches) { %Prefix = <- }
      if (e isincs %Switches) { %Color = 04 }
      elseif (s isincs %Switches) { %Color = 12 }
      elseif (l isincs %Switches) { %Color = 13 }
      %Prefix = $chr(3) $+ %Color $+ %Prefix
      if (F !isincs %Switches) { %Prefix = %Prefix $+ $chr(15) }
      %Indent = $str($chr(15) $+ $chr(32), $calc($hget(SReject/JSONForMirc, LogIndent) *4))
      echo -gi $+ $calc(($hget(SReject/JSONForMirc, LogIndent) + 1) * 4 -1) @SReject/JSONForMirc/Log %Indent %Prefix $1-
    }
    if (I isincs %Switches) { hinc -mu1 SReject/JSONForMirc LogIndent 1 }
    if (D isincs %Switches) && ($hget(SReject/JSONForMirc, LogIndent) > 0) { hdec -mu1 SReject/JSONForMirc LogIndent 1 }
  }
}
#SReject/JSONForMirc/Log end
alias -l jfm_log noop
alias -l jfm_SaveDebug {
  if ($isid) {
    if ($window(@SReject/JSONForMirc/Log)) && ($line(@SReject/JSONForMirc/Log, 0)) { return $true }
    return $false
  }
  var %File $sfile($envvar(USERPROFILE) $+ \Documents\JSONForMirc.log, JSONForMirc - Debug window, Save)
  if (%File) && (!$isfile(%File) || $input(Are you sure you want to overwrite $nopath(%File) $+ ?, qysa, @SReject/JSONForMirc/Log, Overwrite)) { savebuf @SReject/JSONForMirc/Log $qt(%File) }
}
alias -l jfm_badd { bset -t $1 $calc(1 + $bvar($1, 0)) $2- }
alias -l jfm_jscript {
  jfm_badd $1 !function(){Array.prototype.forEach=function(c){for(var s=this,i=0;i<s.length;i++)c.call(s,s[i],i)};Array.prototype.find=function(c){for(var s=this,i=0;i<s.length;i+=1)if(c.call(s,s[i]))return s[i]};I=['MSXML2.SERVERXMLHTTP.6.0','MSXML2.SERVERXMLHTTP.3.0','MSXML2.SERVERXMLHTTP'].find(function(x){try{return new ActiveXObject(x),x}catch(e){}});function A(o){if(o===null)return 'null';return Object.prototype.toString.call(o).match(/^\[object ([^\]]+)\]$/)[1].toLowerCase()}function B(o){var k=[],i;for(i in o)if(C(o,i))k.push(i);return k}
  jfm_badd $1 function C(o,k){return Object.prototype.hasOwnProperty.call(o,k)}
  jfm_badd $1 function D(s){if(s._state!=='done'||s._error||!s._parse)throw new Error('NOT_D');return s}
  jfm_badd $1 function E(s){if(s._type!=='http')throw new Error('HTTP_NOT_INUSE');if(s._state!=='http_pending')throw new Error('HTTP_NOT_PENDING');return s._http}
  jfm_badd $1 function F(s){if(s._type!=='http')throw new Error('HTTP_NOT_INUSE');if(s._state!=='done')throw new Error('HTTP_PENDING');return s._http}
  jfm_badd $1 function G(v){var t=A(v),r='[';if(v===undefined||t==='function')return;if(v===null)return'null';if(t==='number')return isFinite(v)?v.toString():'null';if(t==='boolean')return v.toString();if(t==='string')return'"'+v.replace(/[\\"\u0000-\u001F\u2028\u2029]/g,function(c){return{'"':'\\"','\\':'\\\\','\b':'\\b','\f':'\\f','\n':'\\n','\r':'\\r','\t':'\\t'}[c]||'\\u'+(c.charCodeAt(0)+0x10000).toString(16).substr(1)})+'"';if(t==='array'){v.forEach(function(i,k){i=G(i);if(i)r+=(k?',':'')+i});return r+']'}r=[];B(v).forEach(function(k,o){o=G(v[k]);if(o)r.push(G(k)+':'+o)});return'{'+r.join(',')+'}'}
  jfm_badd $1 function H(p,j,s){s=this;if(p===undefined)p={};if(j===undefined){s._isChild=!1;s._json=p._json||{}}else{s._isChild=!0;s._json=j}s._state=p._state||'init';s._type=p._type||'text';s._parse=p._parse===!1?!1:!0;s._error=p._error||!1;s._input=p._input;s._http=p._http||{method:'GET',url:'',headers:[]}}
  jfm_badd $1 H.prototype={
  jfm_badd $1 state:function(){return this._state},
  jfm_badd $1 error:function(){return this._error.message},inputType:function(){return this._type},
  jfm_badd $1 input:function(){return this._input||null},
  jfm_badd $1 httpParse:function(){return this._parse},
  jfm_badd $1 httpSetMethod:function(m){E(this).method=m},
  jfm_badd $1 httpSetHeader:function(h,v){E(this).headers.push([h,v])},
  jfm_badd $1 httpSetData:function(d){E(this).data=d},
  jfm_badd $1 httpStatus:function(){return F(this).response.status},
  jfm_badd $1 httpStatusText:function(){return F(this).response.statusText},
  jfm_badd $1 httpHeaders:function(){return F(this).response.getAllResponseHeaders()},
  jfm_badd $1 httpHeader:function(h){return F(this).response.getResponseHeader(h)},
  jfm_badd $1 httpBody:function(){return F(this).response.responseBody},
  jfm_badd $1 httpHead:function (s){return s=this,s.httpStatus()+' '+s.httpStatusText()+'\r\n'+s.httpHeaders()},
  jfm_badd $1 httpResponse:function(){return this.httpHead()+'\r\n\r\n'+this._http.response.reponseText},
  jfm_badd $1 parse:function(){var s=this,d=!0,x=!1,y=!1,r,j;s.parse=function(){throw new Error('PARSE_NOT_PENDING')};s._state='done';try{if(s._type==='http'){try{if(s._http.data==undefined){d=!1;s._http.data=null}r=new ActiveXObject(I);s._http.response=r;r.open(s._http.method,s._http.url,!1);s._http.headers.forEach(function(h){r.setRequestHeader(h[0],h[1]);if(h[0].toLowerCase()==="content-type")x=!0;if(h[0].toLowerCase()==="content-length")y=!0});if(d){if(!x)r.setRequestHeader("Content-Type","application/x-www-form-urlencoded");if(!y){if(s._http.data==null)r.setRequestHeader("Content-Length",0);else r.setRequestHeader("Content-Length",String(s._http.data).length)}}r.send(s._http.data);if(s._parse===!1)return s;s._input=r.responseText}catch(e){e.message="HTTP: "+e.message;throw e}}j=String(s._input).replace(/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,function(c){return'\\u'+('0000'+c.charCodeAt(0).toString(16)).slice(-4)});if(!/^[\],:{}\s]*$/.test(j.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,'@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,']').replace(/(?:^|:|,)(?:\s*\[)+/g,'')))throw new Error("INVALID_JSON");try{j=eval('('+j+')')}catch(e){throw new Error("INVALID_JSON")}s._json={path:[],value:j};return s}catch(e){s._error=e.message;throw e}},
  jfm_badd $1 walk:function(){var s=D(this),r=s._json.value,a=Array.prototype.slice.call(arguments),f=a.shift(),p=s._json.path.slice(0),t,m,i,k;while(a.length){t=A(r);m=String(a.shift());if(t!=='array'&&t!=='object')throw new Error('ILLEGAL_REFERENCE');if(f&&/^[~=]./.test(m)){i='~'===m.charAt(0);m=m.replace(/^[~=]\x20?/,'');if(t=='object'&&i){k=B(r);if(/^\d+$/.test(m)){m=parseInt(m,10);if(m>=k.length)throw new Error('FUZZY_INDEX_NOT_FOUND');m=k[m]}else if(!C(r,m)){m=m.toLowerCase();m=k.find(function(k){return m===k.toLowerCase()});if(m==undefined)throw new Error('FUZZY_MEMBER_NOT_FOUND')}}}if(!C(r,m))throw new Error('REFERENCE_NOT_FOUND');p.push(m);r=r[m]}return new H(s,{path:p,value:r})},
  jfm_badd $1 forEach:function(){var s=D(this),a=Array.prototype.slice.call(arguments),r=[],d=a[0]?Infinity:1;a.shift();function _(i,p,j){j=new H(s,{path:p,value:i});if(d!==Infinity&&a.length>1)j=j.walk.apply(j,a.slice(0));r.push(j)}function Z(i,p,c,t){t=A(i);p=p.slice(0);if(c>d)_(i,p);else if(t==='object')B(i).forEach(function(k,z){z=p.slice(0);z.push(k);Z(i[k],z,c+1)});else if(t==='array')i.forEach(function(v,k){z=p.slice(0);z.push(k);Z(v,z,c+1)});else _(i,p)}if(s.type()!=='object'&&s.type()!=='array')throw new Error('ILLEGAL_REFERENCE');Z(s._json.value,s._json.path.slice(0),1);return r},
  jfm_badd $1 type:function(){return A(D(this)._json.value)},
  jfm_badd $1 isContainer:function(){return(this.type()==="object"||this.type()==="array")},
  jfm_badd $1 pathLength:function(){return D(this)._json.path.length},
  jfm_badd $1 pathAtIndex:function(i){return D(this)._json.path[i]},
  jfm_badd $1 path:function(){var r='';D(this)._json.path.forEach(function(i){r+=(r?' ':'')+String(i).replace(/([\\ ])/g,function(c){return' '=== c?'\s':'\\'})});return r},
  jfm_badd $1 length:function(){var s=D(this),t=s.type();if(t==='string'||t==='array')return s._json.value.length;if(t==='object')return B(s._json.value).length;throw new Error('INVALID_TYPE')},
  jfm_badd $1 value:function(){return D(this)._json.value},
  jfm_badd $1 string:function(){return G(D(this)._json.value)},
  jfm_badd $1 debug:function(){var s=this,r={state:s._state,input:s._input,type:s._type,error:s._error,parse:s._parse,http:{url:s._http.url,method:s._http.method,headers:s._http.headers,data:s._http.data},isChild:s._isChild,json:s._json};if(s._type==="http"&&s._state==="done")r.http.response={status:s._http.response.status,statusText:s._http.response.statusText,headers:(s._http.response.getAllResponseHeaders()).split(/[\r\n]+/g),responseText:s._http.response.responseText};return G(r)}};
  jfm_badd $1 JSONCreate=function(t,i,p,s){s=new H();s._state='init';s._type=(t||'text').toLowerCase();s._parse=p===!1?!1:!0;if(s._type==='http'){if(!I){s._error='HTTP_NOT_FOUND';throw new Error('HTTP_NOT_FOUND')}s._state='http_pending';s._http.url=i}else{s._state='parse_pending';s._input=i}return s}}()
}

; --

/*

	# CheckDateFormat alias coded by SReject - (thanks for support) #

*/

alias wmm_cdate { 
  if (!$1) || (!$isid) { return 0 }
  if ($regex($1,/^(?:[^a-zA-Z0-9]*(?:oo|yy|[zmdhHnstT])+)+$/gS)) { return 1 }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

; --

/*
	# ConvertTwitchTime alias coded by SReject - (thanks for support) #

	## Official Code Link: http://pastebin.com/gTrSLpJc ##
*/

alias wmm_convertdate {
  if (!$1) || (!$isid) { return 0 }

  if ($regex($1-, /^(\d\d(?:\d\d)?)-(\d\d)-(\d\d)T(\d\d)\:(\d\d)\:(\d\d)(?:(?:\.\d\d\d)?Z|([-+])(\d\d):(\d+)|$)/i)) {

    var %m = $gettok(January February March April May June July August September October November December, $regml(2), 32)
    var %d = $ord($base($regml(3),10,10))
    var %o = +0

    if ($regml(0) > 6) && ($regml(7) isin -+) { var %o = $regml(7) $+ $calc($regml(8) * 3600 + $regml(9)) }

    var %t = $calc($ctime(%m %d $regml(1) $regml(4) $+ : $+ $regml(5) $+ : $+ $regml(6)) - %o)

    if ($regex($v1, /^([+-])(\d\d)(\d+)$/))) && ($asctime(zz) !== 0) { var %o = $regml(1) $+ $calc($regml(2) * 3600 + $regml(3)) | var %t = $calc(%t + %o ) }

    return %t
  }

  return 0

  return
  :error | wmm_werror $scriptline $error | reseterror
}

; ---

/*
	# HTML2Ascii script by rockcavera - (thanks for support) #

	## Official Code Link: http://hawkee.com/snippet/17963/ ##
*/

alias wmm_html2asc {
  if (!$1) || (!$isid) { return }

  if (!$hget(WMM_HTML)) {
    if (!$file($wmm_html_file)) && (!$wmm_html_db) { return 0 }

    hmake WMM_HTML 2798
    hload WMM_HTML $qt($wmm_html_file)
  }

  return $regsubex(nam,$regsubex(dec,$regsubex(hex,$1,/&\x23x([a-f\d]+);/gi,$chr($base(\t,16,10))),/&\x23(\d+);/g,$chr(\t)),/&(\w+);/g,$iif($hget(WMM_HTML,$wmm_escapeht(\t)),$v1,&\t;))

  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_escapeht { 
  return $lower($regsubex(esc,$1,/([A-Z])/g,:\t)) 

  :error | wmm_werror $scriptline $error | reseterror
}

alias -l wmm_html_db {
  var %c = bset -t &db $!calc(1 + $!bvar(&db,0))

  [ [ %c ] ] Ymlnb3RpbWVzDQriqIINCjpnc2NyDQrtkqINCjpwaQ0KzqANCjpjZnINCuKErQ0KOmVxdWFsDQriqbUNCjpvb3BmDQrtlYYNCjpvbWVnYQ0KzqkNCjpiZ3INCs6SDQo6Y2hpDQrOpw0KOmhhY2VrDQrLhw0KOmJmcg0K7ZSFDQo6ZGVsDQriiIcNCjpiY3kNCtCRDQo6ZnNjcg0K4oSxDQo6b21hY3INCsWMDQo6aWFjZ3INCs6KDQo6YWdyDQrOkQ0KOmlkaWdyDQrOqg0KOnJlDQrihJwNCmIuOnVwc2kNCu2avA0KOmFmcg0K7ZSEDQo6ZG90DQrCqA0KOmV1bWwNCsOLDQo6bm9wZg0K4oSVDQo6YWN5DQrQkA0KOmljaXJjDQrDjg0Kc2VhcnJvdw0K4oaYDQo6YW5kDQriqZMNCjpicmV2ZQ0Ky5gNCjpkc3Ryb2sNCsSQDQo6c2MNCuKqvA0KOmNhcA0K4ouSDQo6bHNoDQrihrANCjpyaWdodDpkb3duOnZlY3Rvcg0K4oeCDQpuOnJpZ2h0YXJyb3cNCuKHjw0KOmVzY3INCuKEsA0KOmdncg0KzpMNCjpvdmVyOmJhcg0K4oC+DQo6aWFjdXRlDQrDjQ0KOnhpDQrOng0KOmdmcg0K7ZSKDQo6bW9wZg0K7ZWEDQo6bGFwbGFjZXRyZg0K4oSSDQo6Z2N5DQrQkw0KYmJya3RicmsNCuKOtg0KYmxhY2tsb3plbmdlDQrip6sNCjpmZnINCu2UiQ0KOmZjeQ0K0KQNCjpkb3duOnRlZQ0K4oqkDQo6ZHNjcg0K7ZKfDQo6ZWdyDQrOlQ0KOmVmcg0K7ZSIDQo6bG9wZg0K7ZWDDQo6cHINCuKquw0KOmVjeQ0K0K0NCjplc2ltDQriqbMNCjpoY2lyYw0KxKQNCjpyaWdodDp2ZWN0b3INCuKHgA0KOmRncg0KzpQNCjpsZWZ0OnZlY3Rvcg0K4oa8DQo6ZGZyDQrtlIcNCmxtb3VzdGFjaGUNCuKOsA0KOmRjeQ0K0JQNCjpsYW5nDQrin6oNCmRvdGVxZG90DQriiZENCjpjc2NyDQrtkp4NCjprZ3INCs6aDQo6Z2cNCuKLmQ0KOm51DQrOnQ0KOmtmcg0K7ZSODQo6a29wZg0K7ZWCDQo6bm90DQriq6wNCjpsZXNzOmZ1bGw6ZXF1YWwNCuKJpg0KOmtjeQ0K0JoNCjpsdA0K4omqDQo6b3INCuKplA0KOmN1cA0K4ouTDQo6aGF0DQpeDQo6amZyDQrtlI0NCjpqY3kNCtCZDQo6bXUNCs6cDQo6YnNjcg0K4oSsDQo6aWdyDQrOmQ0KOmNyb3NzDQriqK8NCjpuZWdhdGl2ZTp0aGluOnNwYWNlDQrigIsNCjpkb3duOnRlZTphcnJvdw0K4oanDQo6YXVtbA0Kw4QNCjppZnINCuKEkQ0KOmpvcGYNCu2VgQ0KOmljeQ0K0JgNCjpsb25nOmxlZnQ6cmlnaHQ6YXJyb3cNCuKftw0KOmV0YQ0KzpcNCjpoZnINCuKEjA0KcGx1c2Npcg0K4qiiDQpjaXJjbGVkZGFzaA0K4oqdDQpyb3RpbWVzDQriqLUNCjphc2NyDQrtkpwNCnRoaWNrc2ltDQriiLwNCjpvZ3INCs6fDQo6Z3QNCuKJqw0KOmlkb3QNCsSwDQo6aW9wZg0K7ZWADQo6bGFycg0K4oaeDQo6b2ZyDQrtlJINCjpvY3kNCtCeDQo6bmdyDQrOnQ0KOmtjZWRpbA0KxLYNCjptYXANCuKkhQ0KOm5mcg0K7ZSRDQo6aW0NCuKEkQ0KOm5jeQ0K0J0NCjptZ3INCs6cDQo6ZmlsbGVkOnNtYWxsOnNxdWFyZQ0K4pe8DQpudHJpYW5nbGVyaWdodGVxDQrii60NCjpob3BmDQrihI0NCjptZnINCu2UkA0KOm5vdDp2ZXJ0aWNhbDpiYXINCuKIpA0KOmpjaXJjDQrEtA0KOm1j
  [ [ %c ] ] eQ0K0JwNCmRvd25hcnJvdw0K4oaTDQo6aW50DQriiKwNCjpsbA0K4ouYDQo6bm90Om5lc3RlZDpncmVhdGVyOmdyZWF0ZXINCuKqosy4DQo6bGdyDQrOmw0KOmlvdGENCs6ZDQo6cmlnaHQ6ZG91YmxlOmJyYWNrZXQNCuKfpw0KOmxmcg0K7ZSPDQpzcXN1YnNldA0K4oqPDQo6YXJpbmcNCsOFDQo6bGN5DQrQmw0KOmZvcjphbGwNCuKIgA0KOm9zY3INCu2Sqg0KOnRhYg0KCQ0KOnNncg0KzqMNCmNpcmNsZWRjaXJjDQriipoNCjpjb250b3VyOmludGVncmFsDQriiK4NCjpnZG90DQrEoA0KOmdvcGYNCu2Uvg0KOmxtaWRvdA0KxL8NCjpzZnINCu2Ulg0KOnNjeQ0K0KENCjpyZ3INCs6hDQpzcXN1YnNldGVxDQriipENCnRpbWVzYmFyDQriqLENCjpiYXJ2DQriq6cNCjpyZnINCuKEnA0KOnJjeQ0K0KANCjpyaG8NCs6hDQo6dmVlDQrii4ENCjpuc2NyDQrtkqkNCjpwaGkNCs6mDQo6Zm9wZg0K7ZS9DQo6cWZyDQrtlJQNCjpsb3dlcjpsZWZ0OmFycm93DQrihpkNCjpwZ3INCs6gDQo6YmV0YQ0KzpINCmV4cGVjdGF0aW9uDQrihLANCjpwZnINCu2Ukw0KOnBjeQ0K0J8NCmFuZ21zZGFoDQripq8NCjptc2NyDQrihLMNCjplbXB0eTpzbWFsbDpzcXVhcmUNCuKXuw0KOmVkb3QNCsSWDQo6ZW9wZg0K7ZS8DQo6d2ZyDQrtlJoNCjphdGlsZGUNCsODDQphbmdtc2RhYg0K4qapDQo6dDpoOm86cjpuDQrDng0KOnZmcg0K7ZSZDQphbmdtc2RhYw0K4qaqDQo6dGF1DQrOpA0KOnZjeQ0K0JINCnJlYWxpbmUNCuKEmw0KOmxzY3INCuKEkg0KOnVncg0KzqUNCmFuZ21zZGFhDQripqgNCjprYXBwYQ0KzpoNCjpvdmVyOmJyYWNlDQrij54NCjpzcXVhcmU6aW50ZXJzZWN0aW9uDQriipMNCmFuZ21zZGFmDQripq0NCjpkb3BmDQrtlLsNCjpkb3duOmFycm93OmJhcg0K4qSTDQo6b3VtbA0Kw5YNCjp1ZnINCu2UmA0KYW5nbXNkYWcNCuKmrg0KOnVjeQ0K0KMNCmFuZ21zZGFkDQripqsNCjp0Z3INCs6kDQphbmdtc2RhZQ0K4qasDQo6dGZyDQrtlJcNCjpsb25nbGVmdGFycm93DQrin7gNCjpleGlzdHMNCuKIgw0KOnRjeQ0K0KINCjprc2NyDQrtkqYNCjpjZG90DQrEig0KOmNvcGYNCuKEgg0KOmJ1bXBlcQ0K4omODQpjYXBicmN1cA0K4qmJDQo6aW9nb24NCsSuDQo6emdyDQrOlg0KOm5vdDpzcXVhcmU6c3VwZXJzZXQNCuKKkMy4DQo6c3VwDQrii5ENCjp6ZnINCuKEqA0KOnpjeQ0K0JcNCjppbWFjcg0KxKoNCjpqc2NyDQrtkqUNCjpvYWNncg0KzowNCjpib3BmDQrtlLkNCjppdW1sDQrDjw0KOnlmcg0K7ZScDQo6b2NpcmMNCsOUDQo6eWN5DQrQqw0KOnhncg0Kzp4NCjpvZ3JhdmUNCsOSDQo6aW50ZWdyYWwNCuKIqw0KOnhmcg0K7ZSbDQo6aXNjcg0K4oSQDQo6b21pY3Jvbg0Kzp8NCjphb3BmDQrtlLgNCjpkYXJyDQrihqENCjpkaWFjcml0aWNhbDpkb3VibGU6YWN1dGUNCsudDQo6aW1hZ2luYXJ5OmkNCuKFiA0KOnN1Yg0K4ouQDQo6cnNoDQrihrENCjpoc2NyDQrihIsNCjpsb25ncmlnaHRhcnJvdw0K4p+5DQpmYWxsaW5nZG90c2VxDQriiZINCjpzdW0NCuKIkQ0K
  [ [ %c ] ] OmltcGxpZXMNCuKHkg0KOnBzaQ0KzqgNCjp3c2NyDQrtkrINCjpkYXNodg0K4qukDQpsb25ncmlnaHRhcnJvdw0K4p+2DQo6Y2lyY2xlOnBsdXMNCuKKlQ0KcGx1c3NpbQ0K4qimDQo6dnNjcg0K7ZKxDQo6YWFjZ3INCs6GDQpzdXBuZQ0K4oqLDQo6dXVtbA0Kw5wNCjphY2lyYw0Kw4INCjppdWtjeQ0K0IYNCm11bHRpbWFwDQriirgNCnByc2ltDQriib4NCnVwdXBhcnJvd3MNCuKHiA0KOnNxcnQNCuKImg0KOnpldGENCs6WDQpzemxpZw0Kw58NCjpsZWZ0OnRlZQ0K4oqjDQo6dXNjcg0K7ZKwDQp1dWFycg0K4oeIDQo6bmNlZGlsDQrFhQ0KbnN1cHNldGVxDQriiokNCnNxc3VwDQriipANCjpzaG9ydDpyaWdodDphcnJvdw0K4oaSDQo6dHNjcg0K7ZKvDQp0cmlzYg0K4qeNDQo6ZG91YmxlOnVwOmFycm93DQrih5ENCm1lYXN1cmVkYW5nbGUNCuKIoQ0KeGxhcnINCuKftQ0Kc3RybnMNCsKvDQo6bGNhcm9uDQrEvQ0KOnNzY3INCu2Srg0KOmFscGhhDQrOkQ0KcnNxdW8NCuKAmQ0KdHJhZGUNCuKEog0KdXBsdXMNCuKKjg0Kb3RpbWVzYXMNCuKotg0KOnN1cGVyc2V0DQriioMNCnBsdXN0d28NCuKopw0KOmVvZ29uDQrEmA0KZXFzbGFudGxlc3MNCuKqlQ0KcnRyaWYNCuKWuA0Kc3FzdWINCuKKjw0KeGR0cmkNCuKWvQ0KOnVwc2kNCs+SDQpydHJpZQ0K4oq1DQo6ZW1hY3INCsSSDQo6cnNjcg0K4oSbDQpwbHVzYWNpcg0K4qijDQpzY246ZQ0K4qq2DQo6ZG90OmRvdA0K4oOcDQo6emRvdA0KxbsNCjp6b3BmDQrihKQNCnhvZG90DQriqIANCjpjY2lyYw0KxIgNCnVyY29ybmVyDQrijJ0NCjppZ3JhdmUNCsOMDQo6cTp1Om86dA0KIg0Kc3FzdXBzZXQNCuKKkA0Kc2hvcnRwYXJhbGxlbA0K4oilDQpsb3RpbWVzDQriqLQNCnRzaGN5DQrRmw0KOnFzY3INCu2SrA0KYm94OmQ6cg0K4pWUDQo6bGFjdXRlDQrEuQ0KOnJldmVyc2U6ZWxlbWVudA0K4oiLDQo6eW9wZg0K7ZWQDQp1dGRvdA0K4ouwDQo6cHNjcg0K7ZKrDQo6c3Rhcg0K4ouGDQo6bGFtYmRhDQrOmw0KOnhvcGYNCu2Vjw0KeGhhcnINCuKftw0KOmp1a2N5DQrQhA0KOmw6dA0KPA0KdHdpeHQNCuKJrA0KYWMNCuKIvg0KOm9kYmxhYw0KxZANCjpkb3VibGU6bG9uZzpyaWdodDphcnJvdw0K4p+5DQpnbA0K4om3DQo6b3ZlcjpicmFja2V0DQrijrQNCjpyYXJyDQrihqANCjp3b3BmDQrtlY4NCmJveDpkOmwNCuKVlw0KYWYNCuKBoQ0KZWwNCuKqmQ0KaXQNCuKBog0KdXJpbmcNCsWvDQo6dmJhcg0K4qurDQo6ZWFjZ3INCs6IDQpnZw0K4omrDQpudQ0Kzr0NCjpjbG9ja3dpc2U6Y29udG91cjppbnRlZ3JhbA0K4oiyDQo6bm90Om5lc3RlZDpsZXNzOmxlc3MNCuKqocy4DQptcA0K4oiTDQo6dm9wZg0K7ZWNDQpib3g6aDpkDQrilaYNCnJyYXJyDQrih4kNCjplY2lyYw0Kw4oNCmdlDQriiaUNCm5lYXJyb3cNCuKGlw0KdmFyc3Vwc2V0bmVxDQriiovvuIANCmRkDQrihYYNCmx0DQo8DQpvcg0K4oioDQplZw0K4qqaDQpjaGVja21hcmsNCuKckw0KdXBzaWgNCs+SDQplZQ0K4oWHDQptdQ0KzrwNCmljDQri
  [ [ %c ] ] gaMNCjpvYWN1dGUNCsOTDQpzdWJuZQ0K4oqKDQphcA0K4omIDQo6dW9wZg0K7ZWMDQp5Y2lyYw0KxbcNCmxsDQriiaoNCm5pDQriiIsNCnZydHJpDQriirMNCjpsY2VkaWwNCsS7DQpzcWN1cA0K4oqUDQo6Z2FtbWENCs6TDQo6ZXBzaWxvbg0KzpUNCm5lDQriiaANCmd0DQo+DQo6dG9wZg0K7ZWLDQo6bWVsbGludHJmDQrihLMNCnNyYXJyDQrihpINCmlpDQrihYgNCmJveDpoOnUNCuKVqQ0KaW4NCuKIiA0KbGUNCuKJpA0KOmxlZnRyaWdodGFycm93DQrih5QNCmxnDQriibYNCnN1YnNldGVxDQriioYNCjpuY2Fyb24NCsWHDQo6Z3JlYXRlcjpzbGFudDplcXVhbA0K4qm+DQo6c29wZg0K7ZWKDQo6cnVsZTpkZWxheWVkDQrip7QNCnhjaXJjDQril68NCjphb2dvbg0KxIQNCmIudGhldGFzDQrtm4kNCnNjDQriibsNCmFuZHNsb3BlDQriqZgNCnF1ZXN0DQo/DQpiLnRoZXRhdg0K7ZudDQo6YW1hY3INCsSADQo6Y29sb24NCuKItw0KOnJpZ2h0OmRvd246dmVjdG9yOmJhcg0K4qWVDQo6enNjcg0K7ZK1DQpwaQ0Kz4ANCjpyb3BmDQrihJ0NCjp5dW1sDQrFuA0KdHJpYW5nbGVsZWZ0DQril4MNCjpnY2lyYw0KxJwNCmR3YW5nbGUNCuKmpg0KOmFzc2lnbg0K4omUDQo6Zzp0DQo+DQpib3g6dTpyDQrilZoNCm52cjphcnINCuKkgw0KcG0NCsKxDQp0cmlhbmdsZXJpZ2h0DQrilrkNCmFzeW1wZXENCuKJjQ0KOm5vdDpzdWNjZWVkcw0K4oqBDQpzcWNhcA0K4oqTDQp2cHJvcA0K4oidDQo6cmFuZw0K4p+rDQo6ZDpkDQrihYUNCjp5c2NyDQrtkrQNCjpkZWx0YQ0KzpQNCjpuYWN1dGUNCsWDDQpwcg0K4om6DQo6cW9wZg0K4oSaDQpwcmltZQ0K4oCyDQo6dmVydA0K4oCWDQpubGVmdHJpZ2h0YXJyb3cNCuKGrg0KOnJpZ2h0OmNlaWxpbmcNCuKMiQ0KdXRyaWYNCuKWtA0KOnhzY3INCu2Ssw0KYm94OnY6cg0K4pWgDQo6bm90OmV4aXN0cw0K4oiEDQp4aQ0Kzr4NCjpvcGVuOmN1cmx5OnF1b3RlDQrigJgNCjpwb3BmDQrihJkNCjp1YXJyDQrihp8NCmJveDp2OmwNCuKVow0KcHJvZnN1cmYNCuKMkw0KcHJjdWUNCuKJvA0KcngNCuKEng0Kd3INCuKJgA0Kd3ANCuKEmA0KYm94OnY6aA0K4pWsDQpzdGFyZg0K4piFDQpiaWd3ZWRnZQ0K4ouADQpsOmUNCuKJpg0KcHJuYXANCuKquQ0Kc3dhcnINCuKGmQ0KOnVwOmFycm93OmRvd246YXJyb3cNCuKHhQ0KdXJ0cmkNCuKXuQ0KYm94OnU6bA0K4pWdDQpoYXJyY2lyDQripYgNCnNoYXJwDQrima8NCnVkaGFyDQripa4NCjpsZWZ0YXJyb3cNCuKHkA0Kc2JxdW8NCuKAmg0KdWRhcnINCuKHhQ0KOnNxdWFyZTpzdWJzZXQ6ZXF1YWwNCuKKkQ0KOnljaXJjDQrFtg0Kbm90aW46ZQ0K4ou5zLgNCndlZGdlDQriiKcNCnJoYXJkDQrih4ENCjpsc3Ryb2sNCsWBDQpyYXJyYg0K4oelDQo6ZG93bjpsZWZ0OnJpZ2h0OnZlY3Rvcg0K4qWQDQpyYXJyYw0K4qSzDQpyb2FuZw0K4p+tDQp2ZWVlcQ0K4omaDQp1ZGlncg0Kz4sNCnVhY2dyDQrPjQ0KOmFhY3V0ZQ0Kw4ENCnJhcXVvDQrCuw0KdWNpcmMNCsO7DQp2YXJzaWdtYQ0Kz4IN
  [ [ %c ] ] CnVsdHJpDQril7gNCnBydXJlbA0K4oqwDQpzdXBzdXANCuKrlg0KbGVmdGxlZnRhcnJvd3MNCuKHhw0KdHJpYW5nbGVkb3duDQrilr8NCm86cw0K4pOIDQpyYXJydw0K4oadDQp3cmVhdGgNCuKJgA0KcmhhcnUNCuKHgA0Kc2ltbmUNCuKJhg0KeHV0cmkNCuKWsw0Kc2ltZXENCuKJgw0KcHJuOmUNCuKqtQ0Kc2V0bW4NCuKIlg0Kc3Vwc3ViDQriq5QNCjp1YXJyb2Npcg0K4qWJDQo6bmV3OmxpbmUNCg0Kc3N0YXJmDQrii4YNCnJlYWxwYXJ0DQrihJwNCnJkcXVvDQrigJ0NCnNtaWxlDQrijKMNCnN1YjplDQriq4UNCnNsYXJyDQrihpANCjpwcmltZQ0K4oCzDQo6ZWdyYXZlDQrDiA0KOmdicmV2ZQ0KxJ4NCmc6ZQ0K4omnDQpwaXRjaGZvcmsNCuKLlA0KOmRvdWJsZTpkb3duOmFycm93DQrih5MNCnBob25lDQrimI4NCnJhdGlvDQriiLYNCnZuc3VwDQriioPig5INCjpkb3duOmJyZXZlDQrMkQ0KdXJjcm9wDQrijI4NCnBhcnNsDQriq70NCnJvYXJyDQrih74NCnZkYXNoDQriiqINCnN1cHNldA0K4oqDDQpyYnJrZQ0K4qaMDQp3Y2lyYw0KxbUNCnN1cHNpbQ0K4quIDQo6ZXF1YWw6dGlsZGUNCuKJgg0KOnVuaW9uOnBsdXMNCuKKjg0KOmNjZWRpbA0Kw4cNCnJsaGFyDQrih4wNCnN1Ym46ZQ0K4quLDQpybGFycg0K4oeEDQpybm1pZA0K4quuDQp2bnN1Yg0K4oqC4oOSDQpscmNvcm5lcg0K4oyfDQo6Y2Nhcm9uDQrEjA0KOnRpbGRlOmZ1bGw6ZXF1YWwNCuKJhQ0KdHJpZG90DQril6wNCm5vdG5pdmENCuKIjA0Kc2NzaW0NCuKJvw0KcmlnaHRhcnJvdw0K4oaSDQpub3RuaXZiDQrii74NCmxvemVuZ2UNCuKXig0Kbm90bml2Yw0K4ou9DQp2bHRyaQ0K4oqyDQo6bG93ZXI6cmlnaHQ6YXJyb3cNCuKGmA0Kcm9icmsNCuKfpw0Kc2lnbWENCs+DDQpzZG90ZQ0K4qmmDQo6ZW1wdHk6dmVyeTpzbWFsbDpzcXVhcmUNCuKWqw0KcmJhcnINCuKkjQ0Kc2NuYXANCuKqug0KOmJlcm5vdWxsaXMNCuKErA0Kc3F1YXJlDQrilqENCnNkb3RiDQriiqENCjpqc2VyY3kNCtCIDQpzcXVhcmYNCuKWqg0KcmVhbHMNCuKEnQ0Kcm9wYXINCuKmhg0KOmNhY3V0ZQ0KxIYNCnZhcnBpDQrPlg0KdmFydGhldGENCs+RDQo6cmlnaHQ6YXJyb3c6bGVmdDphcnJvdw0K4oeEDQpzY2N1ZQ0K4om9DQp1aGJsaw0K4paADQo6aXRpbGRlDQrEqA0KOmE6ZWxpZw0Kw4YNCnBsdXNiDQriip4NCnNtdGVzDQriqqzvuIANCjpsb25nbGVmdHJpZ2h0YXJyb3cNCuKfug0KOmNpcmNsZTp0aW1lcw0K4oqXDQpxcHJpbWUNCuKBlw0KdGhvcm4NCsO+DQp1cmNvcm4NCuKMnQ0KcGx1c2UNCuKpsg0KcmJicmsNCuKdsw0KdWJyY3kNCtGeDQpiYXJ3ZWRnZQ0K4oyFDQppbWFnbGluZQ0K4oSQDQpyYW5nZA0K4qaSDQo6ZG93bjphcnJvdw0K4oaTDQpyYW5nZQ0K4qalDQpiLnNpZ21hdg0K7ZuTDQpsZWZ0dGhyZWV0aW1lcw0K4ouLDQp1dGlsZGUNCsWpDQp0d29oZWFkbGVmdGFycm93DQrihp4NCm5vdGludmENCuKIiQ0KOm5vdDpwcmVjZWRlcw0K4oqADQp2YXJzdXBzZXRuZXFxDQriq4zvuIANCm5vdGlu
  [ [ %c ] ] dmINCuKLtw0Kbm90aW52Yw0K4ou2DQpwcm9mbGluZQ0K4oySDQpzcXN1cGUNCuKKkg0KdWhhcnINCuKGvg0KeHJhcnINCuKftg0KdW9nb24NCsWzDQp0aW1lcw0Kw5cNCm46bGVmdGFycm93DQrih40NCjp1cDp0ZWUNCuKKpQ0KdW1hY3INCsWrDQpyc3F1b3INCuKAmQ0KcmFkaWMNCuKImg0Kc3VwOmUNCuKrhg0KZXFjb2xvbg0K4omVDQpzZWFycg0K4oaYDQo6bm90Omxlc3M6ZXF1YWwNCuKJsA0Kc2NpcmMNCsWdDQpyY2VpbA0K4oyJDQpzdXBkb3QNCuKqvg0KcG91bmQNCsKjDQp0aWxkZQ0Ky5wNCm5zdXBzZXRlcXENCuKrhsy4DQo6dXJpbmcNCsWuDQo6ZWNhcm9uDQrEmg0Kc210DQriqqoNCnVtbA0KwqgNCndmcg0K7ZS0DQpwaXYNCs+WDQp1aGFybA0K4oa/DQo6b3RpbWVzDQriqLcNCnJlZw0Kwq4NCnNoeQ0Kwq0NCnRoZXRhDQrOuA0KdmZyDQrtlLMNCnRoa2FwDQriiYgNCnRhdQ0Kz4QNCnZjeQ0K0LINCnVncg0Kz4UNCjpsZWZ0OnVwOmRvd246dmVjdG9yDQripZENCmNpcjplDQrip4MNCnVmcg0K7ZSyDQpsdHI6cGFyDQrippYNCjpkb3duOmxlZnQ6dmVjdG9yDQrihr0NCnVjeQ0K0YMNCjpjb25pbnQNCuKIrw0KendqDQrigI0NCnRncg0Kz4QNCmJveDpoDQrilZANCjpoc3Ryb2sNCsSmDQpzcXN1YmUNCuKKkQ0KdGZyDQrtlLENCnNjZQ0K4qqwDQp0Y3kNCtGCDQpwYXINCuKIpQ0Kc2dyDQrPgw0KOmVhY3V0ZQ0Kw4kNCjpkb3VibGU6Y29udG91cjppbnRlZ3JhbA0K4oivDQo6ZG93bmFycm93DQrih5MNCjpyaWdodDpkb3duOnRlZTp2ZWN0b3INCuKlnQ0Kc2ZyDQrtlLANCmN1d2VkDQrii48NCmd0ZG90DQrii5cNCmhvYXJyDQrih78NCnNjeQ0K0YENCnNpbQ0K4oi8DQpjdXJhcnJtDQripLwNCjp1bmlvbg0K4ouDDQpyZ3INCs+BDQo6bm90OmxlZnQ6dHJpYW5nbGU6ZXF1YWwNCuKLrA0Kb2ZjaXINCuKmvw0KOnJpZ2h0OnRyaWFuZ2xlDQriirMNCjpjb2xvbmUNCuKptA0KOm90aWxkZQ0Kw5UNCnN1YnN1Yg0K4quVDQpncmF2ZQ0KYA0KaWlvdGENCuKEqQ0KOm86ZWxpZw0KxZINCnByaW1lcw0K4oSZDQpyZnINCu2Urw0KYmlndXBsdXMNCuKohA0KcmN5DQrRgA0KcmhvDQrPgQ0KOnVicmN5DQrQjg0KdmVlDQriiKgNCmN1dmVlDQrii44NCnBoaQ0Kz4YNCjplOmVhY2dyDQrOiQ0KcWZyDQrtlK4NCnZzdWJuZQ0K4oqK77iADQplc2RvdA0K4omQDQppZXhjbA0KwqENCmxjZWlsDQrijIgNCjpsZWZ0OnRyaWFuZ2xlDQriirINCm5lZG90DQriiZDMuA0KemVldHJmDQrihKgNCmdzaW1lDQriqo4NCm5sc2ltDQriibQNCnN3YXJoaw0K4qSmDQpwZ3INCs+ADQpjdXBvcg0K4qmFDQpub3Rpbg0K4oiJDQpiLm9tZWdhDQrtm5oNCnJsbQ0K4oCPDQpwZnINCu2UrQ0Kc29sDQovDQp0b3ANCuKKpA0KdHN0cm9rDQrFpw0KZG91YmxlYmFyd2VkZ2UNCuKMhg0KcGN5DQrQvw0KOmRjYXJvbg0KxI4NCnllbg0KwqUNCmR1aGFyDQripa8NCnByZQ0K4qqvDQpjc3VwZQ0K4quSDQplcGx1cw0K4qmxDQprYXBwYQ0KzroNCm1hbHRlc2UNCuKcoA0KeWFjdXRl
  [ [ %c ] ] DQrDvQ0KYm94OnYNCuKVkQ0KZHVhcnINCuKHtQ0KZXF1aXY6ZDpkDQriqbgNCmdzaW1sDQriqpANCm1kYXNoDQrigJQNCm53OmFycg0K4oeWDQpyaWdodGxlZnRoYXJwb29ucw0K4oeMDQpzdWINCuKKgg0KOnVvZ29uDQrFsg0KZ3RjaXINCuKpug0KaW1hdGgNCsSxDQpsbHRyaQ0K4pe6DQpub3RuaQ0K4oiMDQpyc2gNCuKGsQ0KZnJhc2wNCuKBhA0Kc3Vic3VwDQriq5MNCm5jb25nDQriiYcNCjp1bWFjcg0KxaoNCnZhcnByb3B0bw0K4oidDQpsYmFycg0K4qSMDQo6c2NpcmMNCsWcDQpzdW0NCuKIkQ0KbG5zaW0NCuKLpg0KaW5maW4NCuKIng0KaW9nb24NCsSvDQo6YWdyYXZlDQrDgA0KaWpsaWcNCsSzDQpsYXJyc2ltDQripbMNCmFzeW1wDQriiYgNCnBzaQ0Kz4gNCnNxY2Fwcw0K4oqT77iADQppbWFjcg0KxKsNCmxvcGFyDQripoUNCm9hY2dyDQrPjA0KYi5lcHNpdg0K7ZucDQpzcGFkZXMNCuKZoA0KbmRhc2gNCuKAkw0KOnZlcnRpY2FsOnNlcGFyYXRvcg0K4p2YDQpvY2lyYw0Kw7QNCnpncg0KzrYNCmZyb3duDQrijKINCmptYXRoDQrItw0KcHJvZmFsYXINCuKMrg0KOm50aWxkZQ0Kw5ENCjp0aWxkZQ0K4oi8DQo6Z2NlZGlsDQrEog0KcnRpbWVzDQrii4oNCnN1cA0K4oqDDQp6ZnINCu2Utw0KemN5DQrQtw0KZW1wdHlzZXQNCuKIhQ0KYXBwcm94ZXENCuKJig0KOnJpZ2h0OnZlY3RvcjpiYXINCuKlkw0KbmhwYXINCuKrsg0KeWZyDQrtlLYNCmVyYXJyDQripbENCnNxdQ0K4pahDQp5Y3kNCtGLDQpoYXJydw0K4oatDQpyaWdodGFycm93dGFpbA0K4oajDQp4b3RpbWUNCuKogg0KeGdyDQrOvg0KaWlpbnQNCuKIrQ0KbnNob3J0bWlkDQriiKQNCjp0aGV0YQ0KzpgNCnhmcg0K7ZS1DQpjdWxhcnJwDQripL0NCmltYWdlDQrihJENCmxiYnJrDQrinbINCmVsbA0K4oSTDQpnZ3INCs6zDQpuYWJsYQ0K4oiHDQpib3QNCuKKpQ0KZ2ZyDQrtlKQNCmJsazE0DQrilpENCmR0ZG90DQrii7ENCmxhbmdkDQrippENCm5lYXJyDQrihpcNCm9kYXNoDQriip0NCjpwYXJ0aWFsOmQNCuKIgg0KZ2N5DQrQsw0Kc3Vic2V0DQriioINCjp3ZWRnZQ0K4ouADQpzdWJzaW0NCuKrhw0KYmxrMTINCuKWkg0KZ2VzDQriqb4NCmdsYQ0K4qqlDQpnbmUNCuKqiA0KY3N1YmUNCuKrkQ0Kbmx0cmkNCuKLqg0Kb2VsaWcNCsWTDQphY2QNCuKIvw0KZmZyDQrtlKMNCmJsazM0DQrilpMNCmRpZQ0KwqgNCmZjeQ0K0YQNCmdlcQ0K4omlDQpuZ2VxcQ0K4omnzLgNCjp1YWNncg0Kzo4NCjp1ZGlncg0KzqsNCmVncg0KzrUNCmd0cXVlc3QNCuKpvA0KbmF0dXINCuKZrg0KZWdzDQriqpYNCmxhdGVzDQriqq3vuIANCmxkcXVvDQrigJwNCmVmcg0K7ZSiDQpucHINCuKKgA0Kc3VwbjplDQriq4wNCnhvcGx1cw0K4qiBDQo6bm90OmxlZnQ6dHJpYW5nbGU6YmFyDQrip4/MuA0KZWN5DQrRjQ0KOnVjaXJjDQrDmw0KYmlnc3FjdXANCuKohg0KYnNpbWUNCuKLjQ0Kb21lZ2ENCs+JDQpjaXINCuKXiw0KZGdyDQrOtA0KYXdpbnQNCuKokQ0KYW1wDQomDQpkZnINCu2UoQ0KZ2FwDQriqoYN
  [ [ %c ] ] Cmdsag0K4qqkDQpvcnYNCuKpmw0KZXhpc3QNCuKIgw0KZGN5DQrQtA0KZW5nDQrFiw0KOmxlZnQ6dmVjdG9yOmJhcg0K4qWSDQplcXVpdg0K4omhDQpvbWFjcg0KxY0NCmlhY2dyDQrOrw0KaWRpZ3INCs+KDQpibmUNCj3ig6UNCjpub3Q6bGVmdDp0cmlhbmdsZQ0K4ouqDQo6YmFyd2VkDQrijIYNCmNmcg0K7ZSgDQpzc21pbGUNCuKMow0KOnN1Y2NlZWRzOnNsYW50OmVxdWFsDQriib0NCnZzdXBuZQ0K4oqL77iADQpjdGRvdA0K4ouvDQpsb2Fycg0K4oe9DQpucjphcnINCuKHjw0KZXFzaW0NCuKJgg0KaWNpcmMNCsOuDQpsYnJrZQ0K4qaLDQpuZ3NpbQ0K4om1DQpvbGNyb3NzDQriprsNCnN1Y2NuZXFxDQriqrYNCmRpdg0Kw7cNCnBybnNpbQ0K4ouoDQpiZ3INCs6yDQpjaGkNCs+HDQpnZ2cNCuKLmQ0KYW5ncnR2YmQNCuKmnQ0KYnJldmUNCsuYDQpiZnINCu2Unw0KYmN5DQrQsQ0KZGlhbW9uZHN1aXQNCuKZpg0KcnRocmVlDQrii4wNCmFncg0KzrENCmxybQ0K4oCODQpsZWZ0cmlnaHRhcnJvdw0K4oaUDQphZnINCu2Ung0KZG90DQrLmQ0KZ2VsDQrii5sNCjpvc2xhc2gNCsOYDQpjcmFycg0K4oa1DQpsbGFycg0K4oeHDQpuaGFycg0K4oauDQphY3kNCtCwDQplZjpkb3QNCuKJkg0KOmxlZnQ6ZG93bjp2ZWN0b3I6YmFyDQripZkNCmFuZA0K4oinDQpvcmQNCuKpnQ0KZGVnDQrCsA0KbnNjDQriioENCmNlbnRlcmRvdA0KwrcNCnJpZ2h0cmlnaHRhcnJvd3MNCuKHiQ0KY2FwDQriiKkNCmxzaA0K4oawDQphbmcNCuKIoA0KZWxzDQriqpUNCm51bQ0KIw0KOmRvdWJsZTpsZWZ0OnRlZQ0K4qukDQpsbmVxcQ0K4omoDQpzcWN1cHMNCuKKlO+4gA0Kb2dyDQrOvw0KZXBzaXYNCs+1DQphcGUNCuKJig0Kb2htDQrOqQ0KYnVtcGUNCuKJjw0KbWludXMNCuKIkg0KbGFwDQriqoUNCm1pZA0K4oijDQpuZ3QNCuKJrw0Kb2ZyDQrtlKwNCm9jeQ0K0L4NCmU6ZDpkb3QNCuKptw0KaGNpcmMNCsSlDQpsaGJsaw0K4paEDQpuZXNpbQ0K4omCzLgNCm5ncg0Kzr0NCm9sY2lyDQripr4NCm5sZQ0K4omwDQpsYXQNCuKqqw0KbWFwDQrihqYNCm5mcg0K7ZSrDQpvZ3QNCuKngQ0KYnNvbGINCuKnhQ0KbmN5DQrQvQ0KbG9icmsNCuKfpg0KbWdyDQrOvA0KbGVzDQriqb0NCmxuZQ0K4qqHDQpsZWZ0aGFycG9vbnVwDQrihrwNCmxlc2NjDQriqqgNCm5sZXNzDQriia4NCjpnYW1tYWQNCs+cDQptZnINCu2Uqg0KbmFwDQriiYkNCnJzYXF1bw0K4oC6DQo6dmRhc2gNCuKKqQ0Kb2xhcnINCuKGug0KbGVxDQriiaQNCm1jeQ0K0LwNCm1obw0K4oSnDQpwdW5jc3ANCuKAiA0KcnBhcmd0DQrippQNCjp3Y2lyYw0KxbQNCjpkYWdnZXINCuKAoQ0KaW50DQriiKsNCmxncg0KzrsNCmN3aW50DQriiLENCmxoYXJkDQrihr0NCjphYnJldmUNCsSCDQpuYXBvcw0KxYkNCmlmZg0K4oeUDQpsZnINCu2UqQ0KbGFycmINCuKHpA0KbGN5DQrQuw0KbG9hbmcNCuKfrA0KbmxlcXENCuKJpsy4DQo6cnJpZ2h0YXJyb3cNCuKHmw0Kb2x0DQrip4ANCnByZWNlcQ0K4qqvDQprZ3INCs66DQpvaGJh
  [ [ %c ] ] cg0K4qa1DQo6b3ZlcjpwYXJlbnRoZXNpcw0K4o+cDQp6Y2Fyb24NCsW+DQpjcm9zcw0K4pyXDQpjdWVzYw0K4oufDQpsYXF1bw0KwqsNCmxhcnJiZnMNCuKknw0Ka2ZyDQrtlKgNCm5vdA0KwqwNCmIua2FwcGENCu2biw0Ka2N5DQrQug0KbmdlDQriibENCmV0aA0Kw7ANCmxveg0K4peKDQpubHQNCuKJrg0KcmlnaHRsZWZ0YXJyb3dzDQrih4QNCm9saW5lDQrigL4NCmFzdA0KKg0KY3VwDQriiKoNCmpmcg0K7ZSnDQpuYnVtcA0K4omOzLgNCmpjeQ0K0LkNCmlncg0KzrkNCm5pcw0K4ou8DQppZnINCu2Upg0KbmxhcnINCuKGmg0KaWN5DQrQuA0KaW5maW50aWUNCuKnnQ0Kbml2DQriiIsNCnRwcmltZQ0K4oC0DQo6bm90OnN1Y2NlZWRzOnNsYW50OmVxdWFsDQrii6ENCnJtb3VzdGFjaGUNCuKOsQ0KZXRhDQrOtw0KbGVnDQrii5oNCnN0cmFpZ2h0cGhpDQrPlQ0Kc3dud2FyDQripKoNCmxoYXJ1DQrihrwNCmhmcg0K7ZSlDQppbXBlZA0KxrUNCjpzaWdtYQ0KzqMNCjpwOnNncg0KzqgNCjpncmVhdGVyOmVxdWFsDQriiaUNCmx2bjplDQriiajvuIANCnphY3V0ZQ0KxboNCjpuZWdhdGl2ZTptZWRpdW06c3BhY2UNCuKAiw0KamNpcmMNCsS1DQpuOnZkYXNoDQriiq4NCmR0cmlmDQrilr4NCmx1cmRzaGFyDQripYoNCmN1ZXByDQrii54NCm5hcGlkDQriiYvMuA0KYXJpbmcNCsOlDQpic2VtaQ0K4oGPDQptaWNybw0KwrUNCm5leGlzdHMNCuKIhA0KaXByb2QNCuKovA0KbnJhcnINCuKGmw0Kc3ViZG90DQriqr0NCmduYXBwcm94DQriqooNCjpoOmE6cjpkY3kNCtCqDQpuc2ltZQ0K4omEDQpzdWJzZXRuZXENCuKKig0Kc3NldG1uDQriiJYNCjp0c3Ryb2sNCsWmDQpwcm9wdG8NCuKInQ0Kc3Vic2V0ZXFxDQriq4UNCnN1Y2NlcQ0K4qqwDQpyYXRpb25hbHMNCuKEmg0KZWFjZ3INCs6tDQp1ZmlzaHQNCuKlvg0KOnlhY3V0ZQ0Kw50NCmVtcHR5DQriiIUNCnVkYmxhYw0KxbENCm51bXNwDQrigIcNCnZlbGxpcA0K4ouuDQplY2lyYw0Kw6oNCmxvbmdsZWZ0cmlnaHRhcnJvdw0K4p+3DQphbGVwaA0K4oS1DQphbmdydA0K4oifDQo6dGhpbjpzcGFjZQ0K4oCJDQpwZXJjbnQNCiUNCmxlc2RvdG8NCuKqgQ0KZzplbA0K4qqMDQphbmdzdA0Kw4UNCmNjdXBzDQriqYwNCnNoY2hjeQ0K0YkNCmZvcmt2DQriq5kNCm9wZXJwDQriprkNCmRkYXJyDQrih4oNCjpkb3VibGU6cmlnaHQ6YXJyb3cNCuKHkg0KbGRyZGhhcg0K4qWnDQpvbWljcm9uDQrOvw0Kb3JhcnINCuKGuw0KcGhtbWF0DQrihLMNCmJsYW5rDQrikKMNCmduc2ltDQrii6cNCjpwcmVjZWRlczplcXVhbA0K4qqvDQpucGFydA0K4oiCzLgNCnByZWNjdXJseWVxDQriibwNCjpub3Q6cmlnaHQ6dHJpYW5nbGU6YmFyDQrip5DMuA0KZ2FtbWENCs6zDQo6Y2FwaXRhbDpkaWZmZXJlbnRpYWw6ZA0K4oWFDQpkaXNpbg0K4ouyDQpvdmJhcg0K4oy9DQpyZHF1b3INCuKAnQ0KbmFwOmUNCuKpsMy4DQp1YWN1dGUNCsO6DQpuc21pZA0K4oikDQp1d2FuZ2xlDQripqcNCjplbGVtZW50DQriiIgNCnBhcnNpbQ0K4quz
  [ [ %c ] ] DQptdW1hcA0K4oq4DQo6dXBwZXI6cmlnaHQ6YXJyb3cNCuKGlw0KZmx0bnMNCuKWsQ0KY2Fyb24NCsuHDQpscmhhcg0K4oeLDQpzdWNjYXBwcm94DQriqrgNCndlaWVycA0K4oSYDQphbmdsZQ0K4oigDQpiZHF1bw0K4oCeDQpkYmxhYw0Ky50NCmxzaW1nDQriqo8NCnh1cGx1cw0K4qiEDQpscmFycg0K4oeGDQo6cG9pbmNhcmVwbGFuZQ0K4oSMDQphbWFsZw0K4qi/DQpsc2ltZQ0K4qqNDQo6dDpoZ3INCs6YDQphb2dvbg0KxIUNCmJlcHNpDQrPtg0KY29tbWENCiwNCmFtYWNyDQrEgQ0KY29sb24NCjoNCm9yZGVyDQrihLQNCnRjYXJvbg0KxaUNCmNoZWNrDQrinJMNCjpzdWJzZXQNCuKLkA0KY3VkYXJybA0K4qS4DQpud2Fycg0K4oaWDQpubDphcnINCuKHjQ0Kc3BhZGVzdWl0DQrimaANCmdjaXJjDQrEnQ0KbHRjaXINCuKpuQ0Kc2Vzd2FyDQripKkNCmNhcmV0DQrigYENCjpub3Q6Z3JlYXRlcjplcXVhbA0K4omxDQppbWFncGFydA0K4oSRDQpzaWdtYXYNCs+CDQpzb2xiYXINCuKMvw0KYWN1dGUNCsK0DQpibG9jaw0K4paIDQpkZWx0YQ0KzrQNCmIuYWxwaGENCu2bgg0KcGVybWlsDQrigLANCnJhdGFpbA0K4qSaDQpkb3RlcQ0K4omQDQpmZmxpZw0K76yADQo6aTpqbGlnDQrEsg0Kc3VjY25zaW0NCuKLqQ0Kc29mdGN5DQrRjA0KY3VkYXJycg0K4qS1DQpwbGFua3YNCuKEjw0KYi5waQ0K7ZuRDQpvcGx1cw0K4oqVDQpuOmd0DQriiavig5INCnRlbHJlYw0K4oyVDQpsZWZ0aGFycG9vbmRvd24NCuKGvQ0KbHRkb3QNCuKLlg0KdG9wYm90DQrijLYNCjp0OnNjeQ0K0KYNCmw6ZWcNCuKqiw0Kc21hc2hwDQriqLMNCmxlc3NzaW0NCuKJsg0KcmJyYWNlDQp9DQpib3h1cg0K4pSUDQpzaWdtYWYNCs+CDQpyYnJhY2sNCl0NCmRhc2h2DQriiqMNCnN1cHBsdXMNCuKrgA0KbnZzaW0NCuKIvOKDkg0KY29tcGxleGVzDQrihIINCm46bGwNCuKLmMy4DQpiYWNrY29uZw0K4omMDQpudmw6YXJyDQripIINCnRvcGNpcg0K4quxDQpkaWFtcw0K4pmmDQpwbGFuY2sNCuKEjw0KYm94dnINCuKUnA0KcGVyaW9kDQouDQphYWNncg0KzqwNCm46Z2cNCuKLmcy4DQpyYXJybHANCuKGrA0KYi54aQ0K7ZuPDQpndm46ZQ0K4omp77iADQpuc3VwZQ0K4oqJDQpnaW1lbA0K4oS3DQpsYnJrc2xkDQripo8NCjpsZWZ0OnVwOnRlZTp2ZWN0b3INCuKloA0Kc2ltZG90DQriqaoNCmFjaXJjDQrDog0KaXVrY3kNCtGWDQpwcmVjbmVxcQ0K4qq1DQpuOmx0DQriiarig5INCmZpbGlnDQrvrIENCm5ydHJpDQrii6sNCjpyaWdodGFycm93DQrih5INCjpncmVhdGVyOmZ1bGw6ZXF1YWwNCuKJpw0KbmFwcHJveA0K4omJDQo6dW5kZXI6YnJhY2UNCuKPnw0KbGFlbXB0eXYNCuKmtA0Kd2VkYmFyDQriqZ8NCmNpcmZuaW50DQriqJANCmdlcXNsYW50DQriqb4NCmdlc2NjDQriqqkNCjphcHBseTpmdW5jdGlvbg0K4oGhDQpjbHVicw0K4pmjDQpuOnY6ZGFzaA0K4oqvDQpzZnJvd24NCuKMog0KdmFuZ3J0DQrippwNCmZqbGlnDQpmag0KY2VkaWwNCsK4DQo6bGVmdDpyaWdodDp2ZWN0b3IN
  [ [ %c ] ] CuKljg0Kcm1vdXN0DQrijrENCjpzOmhjeQ0K0KgNCnhzcWN1cA0K4qiGDQo6emNhcm9uDQrFvQ0KYm94dmwNCuKUpA0Kc3Vwc2V0bmVxcQ0K4quMDQo6ZG91YmxlOnVwOmRvd246YXJyb3cNCuKHlQ0KYi5udQ0K7ZuODQo6bGVmdDpyaWdodDphcnJvdw0K4oaUDQo6cmlnaHQ6dGVlOnZlY3Rvcg0K4qWbDQo6dmVydGljYWw6YmFyDQriiKMNCnVwYXJyb3cNCuKGkQ0KbGJya3NsdQ0K4qaNDQptaW51c2R1DQriqKoNCnJhcnJoaw0K4oaqDQpib3h2aA0K4pS8DQphZWxpZw0Kw6YNCmJveHVsDQrilJgNCnRjZWRpbA0KxaMNCmIubXUNCu2bjQ0KYmNvbmcNCuKJjA0KY2NhcHMNCuKpjQ0KcmFycmZzDQripJ4NCndlZGdlcQ0K4omZDQphbHBoYQ0KzrENCm5wcmVjDQriioANCmJveGRyDQrilIwNCnJhcnJhcA0K4qW1DQpkb3duaGFycG9vbnJpZ2h0DQrih4INCmlzaW5zDQrii7QNCjpwOmhncg0KzqYNCmVvZ29uDQrEmQ0KOmRvd246cmlnaHQ6dmVjdG9yOmJhcg0K4qWXDQpleHBvbmVudGlhbGUNCuKFhw0KZmxsaWcNCu+sgg0KOmN1cDpjYXANCuKJjQ0KaXNpbnYNCuKIiA0KZ25lcXENCuKJqQ0KZW1hY3INCsSTDQpuc3Bhcg0K4oimDQpiLmdhbW1hDQrtm4QNCnZlZWJhcg0K4oq7DQo6emFjdXRlDQrFuQ0KbnN1Y2MNCuKKgQ0Kbmg6YXJyDQrih44NCmNjaXJjDQrEiQ0KY3VybHl2ZWUNCuKLjg0KYm94aGQNCuKUrA0KZGhhcmwNCuKHgw0KcmFycnBsDQripYUNCjpsZWZ0OnVwOnZlY3RvcjpiYXINCuKlmA0KbHJ0cmkNCuKKvw0KbnJpZ2h0YXJyb3cNCuKGmw0KbnN1YmUNCuKKiA0KbnN1YnNldGVxcQ0K4quFzLgNCmJveG1pbnVzDQriip8NCm5jb25nZG90DQriqa3MuA0KcmhhcnVsDQripawNCjpyZXZlcnNlOmVxdWlsaWJyaXVtDQrih4sNCmRvdHNxdWFyZQ0K4oqhDQpuYXR1cmFsDQrima4NCmJsYWNrc3F1YXJlDQrilqoNCjpsZWZ0OnRlZTp2ZWN0b3INCuKlmg0KZGhhcnINCuKHgg0KaW50cHJvZA0K4qi8DQpsZXNzZG90DQrii5YNCm50cmlhbmdsZWxlZnQNCuKLqg0KOmRvdWJsZTp2ZXJ0aWNhbDpiYXINCuKIpQ0KcmFycnRsDQrihqMNCjpzdXBlcnNldDplcXVhbA0K4oqHDQpuOmxlZnRyaWdodGFycm93DQrih44NCjpub3Q6Y29uZ3J1ZW50DQriiaINCnZhcnRyaWFuZ2xlbGVmdA0K4oqyDQo6Y2VkaWxsYQ0KwrgNCjpsbGVmdGFycm93DQrih5oNCnVkaWFncg0KzrANCjpsZWZ0OmRvd246dmVjdG9yDQrih4MNCmxzcXVvDQrigJgNCjpkb3Q6ZXF1YWwNCuKJkA0KZXBzaWxvbg0KzrUNCjpub3Q6Z3JlYXRlcg0K4omvDQo6aHVtcDpkb3duOmh1bXANCuKJjg0KanVrY3kNCtGUDQpib3hkbA0K4pSQDQpsdHJpZg0K4peCDQpzcXN1cHNldGVxDQriipINCmJveGh1DQrilLQNCjpsZWZ0OmRvd246dGVlOnZlY3Rvcg0K4qWhDQpsdHJpZQ0K4oq0DQo6bm90OnByZWNlZGVzOmVxdWFsDQriqq/MuA0KYi5kZWx0YQ0K7ZuFDQo6eTp1Y3kNCtCuDQpndHJsZXNzDQriibcNCnRycGV6aXVtDQrij6INCmx2ZXJ0bmVxcQ0K4omo77iADQp4d2VkZ2UNCuKLgA0K
  [ [ %c ] ] OnI6ZTpnDQrCrg0KdGhpbnNwDQrigIkNCmxlc3NndHINCuKJtg0KdGltZXNiDQriiqANCmVyOmRvdA0K4omTDQo6aGlsYmVydDpzcGFjZQ0K4oSLDQp0aW1lc2QNCuKosA0KZnBhcnRpbnQNCuKojQ0KOnN1cHNldA0K4ouRDQpzdXBoc3ViDQriq5cNCnJjZWRpbA0KxZcNCjpyaWdodDp0ZWU6YXJyb3cNCuKGpg0Kc2ltbDplDQriqp8NCjpkOmRvdHJhaGQNCuKkkQ0KdHJpdGltZQ0K4qi7DQo6YmVjYXVzZQ0K4oi1DQpzdXBtdWx0DQriq4INCmJldHdlZW4NCuKJrA0KYm5lcXVpdg0K4omh4oOlDQo6Y2lyY2xlOmRvdA0K4oqZDQo6bGVmdDp0ZWU6YXJyb3cNCuKGpA0Kc3VwZWRvdA0K4quEDQpiaWdjaXJjDQril68NCjpsZXNzOnNsYW50OmVxdWFsDQriqb0NCjpyaWdodDp0cmlhbmdsZTplcXVhbA0K4oq1DQp0cmlwbHVzDQriqLkNCjpkaWFtb25kDQrii4QNCnNlYXJoaw0K4qSlDQo6c3F1YXJlDQrilqENCnRoZXRhdg0Kz5ENCmFsZWZzeW0NCuKEtQ0KdWdyYXZlDQrDuQ0KdWxjb3JuDQrijJwNCnByZWNuc2ltDQrii6gNCnJmbG9vcg0K4oyLDQpuZTphcnINCuKHlw0KbDphdGFpbA0K4qSbDQpzY25zaW0NCuKLqQ0KY2lyY2xlZGFzdA0K4oqbDQo6Y29uZ3J1ZW50DQriiaENCnJpc2luZ2RvdHNlcQ0K4omTDQpzaW1nOmUNCuKqoA0Kc2NlZGlsDQrFnw0KOm5vdDpzdWJzZXQNCuKKguKDkg0KOmNjb25pbnQNCuKIsA0KY29uZ2RvdA0K4qmtDQpzaG9ydG1pZA0K4oijDQpub3RpbmRvdA0K4ou1zLgNCjp6OmhjeQ0K0JYNCnNjYXJvbg0KxaENCnRhcmdldA0K4oyWDQp6aWdyYXJyDQrih50NCjp1dGlsZGUNCsWoDQo6cHJlY2VkZXM6c2xhbnQ6ZXF1YWwNCuKJvA0KOmRvd246bGVmdDp2ZWN0b3I6YmFyDQripZYNCjp5OmFjeQ0K0K8NCnRoa3NpbQ0K4oi8DQo6dGhlcmVmb3JlDQriiLQNCmxvb3BhcnJvd3JpZ2h0DQrihqwNCnN1cGhzb2wNCuKfiQ0KZWxpbnRlcnMNCuKPpw0KOm5vdDpyaWdodDp0cmlhbmdsZTplcXVhbA0K4outDQpkaXZpZGVvbnRpbWVzDQrii4cNCnNhY3V0ZQ0KxZsNCjpsZWZ0OmFycm93OmJhcg0K4oekDQo6aW52aXNpYmxlOnRpbWVzDQrigaINCnRyaWFuZ2xlbGVmdGVxDQriirQNCnVwZG93bmFycm93DQrihpUNCmNsdWJzdWl0DQrimaMNCnZhcnJobw0Kz7ENCnZlcmJhcg0KfA0KYi46Z2FtbWFkDQrtn4oNCnZhcnBoaQ0Kz5UNCjp2dmRhc2gNCuKKqg0KOm5vdDpzdXBlcnNldDplcXVhbA0K4oqJDQpkZW1wdHl2DQriprENCnRoZXJlNA0K4oi0DQp2YXJzdWJzZXRuZXFxDQriq4vvuIANCnJjYXJvbg0KxZkNCnJmaXNodA0K4qW9DQpkZG90c2VxDQriqbcNCnJhbmdsZQ0K4p+pDQplcXNsYW50Z3RyDQriqpYNCnBsdXNkbw0K4oiUDQpnZXNkb3RvbA0K4qqEDQo6eTppY3kNCtCHDQo6ZG91YmxlOmRvdA0KwqgNCnVicmV2ZQ0Kxa0NCnJwYXINCikNCnNzY3INCu2TiA0KOm5vdDpwcmVjZWRlczpzbGFudDplcXVhbA0K4ougDQpwbHVzbW4NCsKxDQpwcmVjDQriiboNCnJhY3V0ZQ0KxZUNCmJveHRpbWVzDQriiqANCmN1cGJyY2Fw
  [ [ %c ] ] DQriqYgNCnByb3ANCuKInQ0Kc3VwZHN1Yg0K4quYDQp1cHNpDQrPhQ0KOnplcm86d2lkdGg6c3BhY2UNCuKAiw0KcnNjcg0K7ZOHDQpzcGFyDQriiKUNCjplOmVncg0KzpcNCnNjcG9saW50DQriqJMNCjpub3Q6c3VwZXJzZXQNCuKKg+KDkg0Kc3VjYw0K4om7DQpyaWdodHNxdWlnYXJyb3cNCuKGnQ0KcGx1c2R1DQriqKUNCnJvcGx1cw0K4qiuDQp6ZG90DQrFvA0Kem9wZg0K7ZWrDQo6bm90OmVxdWFsDQriiaANCjpkb3VibGU6bGVmdDphcnJvdw0K4oeQDQpud2Fycm93DQrihpYNCnN1YmUNCuKKhg0KbnZpbmZpbg0K4qeeDQpzbWFsbHNldG1pbnVzDQriiJYNCnVsY3JvcA0K4oyPDQpyaWdodHRocmVldGltZXMNCuKLjA0KcXNjcg0K7ZOGDQpwc2dyDQrPiA0KcHJvZA0K4oiPDQp5b3BmDQrtlaoNCnhyOmFycg0K4p+5DQp5YWN5DQrRjw0Kc3VwbGFycg0K4qW7DQppaW5maW4NCuKnnA0KdXRyaQ0K4pa1DQpxdW90DQoiDQo6cmNlZGlsDQrFlg0KZGRhZ2dlcg0K4oChDQo6ZzpqY3kNCtCDDQpzdW5nDQrimaoNCjpkb3duOnJpZ2h0OnRlZTp2ZWN0b3INCuKlnw0KbWNvbW1hDQriqKkNCnBzY3INCu2ThQ0Kc3Rhcg0K4piGDQpicnZiYXINCsKmDQpidW1wOmUNCuKqrg0KbW5wbHVzDQriiJMNCnByYXANCuKqtw0KeG9wZg0K7ZWpDQplcGFyc2wNCuKnow0KbmVhcmhrDQripKQNCjpzdWNjZWVkczp0aWxkZQ0K4om/DQpiaWdvZG90DQriqIANCmhvbXRodA0K4oi7DQp4Y2FwDQrii4INCmxvbmdsZWZ0YXJyb3cNCuKftQ0Kd3Njcg0K7ZOMDQpsb3diYXINCl8NCm9yZGVyb2YNCuKEtA0Kc2U6YXJyDQrih5gNCmRia2Fyb3cNCuKkjw0KaWlpaW50DQriqIwNCmNvbG9uZXENCuKJlA0KbmdlcXNsYW50DQriqb7MuA0KeG1hcA0K4p+8DQo6bm90Omxlc3M6dGlsZGUNCuKJtA0KOmQ6amN5DQrQgg0KbmNlZGlsDQrFhg0KdnNjcg0K7ZOLDQpzdXBlDQriiocNCnV1bWwNCsO8DQpzdWJwbHVzDQriqr8NCnByZWNuYXBwcm94DQriqrkNCmhlcmNvbg0K4oq5DQpydHJpDQrilrkNCjp1Z3JhdmUNCsOZDQp6ZXRhDQrOtg0KbmxlcXNsYW50DQriqb3MuA0KOnNxdWFyZTpzdXBlcnNldDplcXVhbA0K4oqSDQp6aGN5DQrQtg0Kc3F1Zg0K4paqDQp1c2NyDQrtk4oNCmduOmUNCuKJqQ0KbGNhcm9uDQrEvg0KbGZpc2h0DQripbwNCmxhbmdsZQ0K4p+oDQp0c2N5DQrRhg0KeWljeQ0K0ZcNCmFjOmUNCuKIvsyzDQo6c2NlZGlsDQrFng0KeGN1cA0K4ouDDQp0c2NyDQrtk4kNCmdsOmUNCuKqkg0KeG5pcw0K4ou7DQpicHJpbWUNCuKAtQ0KcnNxYg0KXQ0KY3VycmVuDQrCpA0KbGFncmFuDQrihJINCmlncmF2ZQ0Kw6wNCmFwcHJveA0K4omIDQp0cmllDQriiZwNCjpzY2Fyb24NCsWgDQo6bGVmdDphcnJvdw0K4oaQDQpucGFyYWxsZWwNCuKIpg0Kc210ZQ0K4qqsDQpsYWN1dGUNCsS6DQpzZG90DQrii4UNCnNvcGYNCu2VpA0KdmFycg0K4oaVDQo6ZDpzY3kNCtCFDQpzd2Fycm93DQrihpkNCnl1Y3kNCtGODQo6bmVnYXRpdmU6dmVyeTp0aGluOnNwYWNlDQrigIsNCnN1YnJh
  [ [ %c ] ] cnINCuKluQ0Kc2NhcA0K4qq4DQpyZGNhDQripLcNCnRicmsNCuKOtA0KOmNsb3NlOmN1cmx5OmRvdWJsZTpxdW90ZQ0K4oCdDQp6c2NyDQrtk48NCjp1bmRlcjpicmFja2V0DQrijrUNCnBsdXMNCisNCjpjb3VudGVyOmNsb2Nrd2lzZTpjb250b3VyOmludGVncmFsDQriiLMNCmxhbWJkYQ0KzrsNCmxvcGx1cw0K4qitDQpyZWFsDQrihJwNCnJvcGYNCu2Vow0KeXVtbA0Kw78NCnN0cmFpZ2h0ZXBzaWxvbg0Kz7UNCm52OmRhc2gNCuKKrQ0KdGludA0K4oitDQpsZzplDQriqpENCmRyYmthcm93DQripJANCmluY2FyZQ0K4oSFDQpkcmNyb3ANCuKMjA0KbG93YXN0DQriiJcNCnJhbmcNCuKfqQ0Kbmx0cmllDQrii6wNCnlzY3INCu2Tjg0KOnNhY3V0ZQ0KxZoNCm9kYmxhYw0KxZENCnFvcGYNCu2Vog0KYmxhY2t0cmlhbmdsZXJpZ2h0DQrilrgNCmJveDpkcg0K4pWTDQp2ZXJ0DQp8DQpiaWd0cmlhbmdsZWRvd24NCuKWvQ0KOm5vdDpsZXNzOmxlc3MNCuKJqsy4DQpyZWN0DQrilq0NCmN1cGN1cA0K4qmKDQpyYWNlDQriiL3MsQ0KdG9lYQ0K4qSoDQp4dmVlDQrii4ENCjp2ZXJiYXINCuKAlg0KeHNjcg0K7ZONDQpwb3BmDQrtlaENCnVhcnINCuKGkQ0Kenduag0K4oCMDQp2c3VwbjplDQriq4zvuIANCmxlc3NhcHByb3gNCuKqhQ0KdGhncg0KzrgNCnNmZ3INCs+CDQpib3g6aGQNCuKVpA0Kbmc6ZQ0K4omnzLgNCnN1cDENCsK5DQpzZWN0DQrCpw0Kc3VwMg0KwrINCjpjOmhjeQ0K0KcNCnNlbWkNCjsNCnN1cDMNCsKzDQpoYXJkY3kNCtGKDQppbnRlZ2Vycw0K4oSkDQpwZXJwDQriiqUNCjpyY2Fyb24NCsWYDQprZ3JlZW4NCsS4DQpwYXJhDQrCtg0Kc2ltZw0K4qqeDQpvYWN1dGUNCsOzDQpyYXJyDQrihpINCndvcGYNCu2VqA0KY3VyYXJyDQrihrcNCnNpbWUNCuKJgw0KdHJpYW5nbGVxDQriiZwNCnBoaXYNCs+VDQpxaW50DQriqIwNCjpkOnpjeQ0K0I8NCmxjZWRpbA0KxLwNCnNoY3kNCtGIDQpzZXh0DQrinLYNCmxuOmUNCuKJqA0KbnZsdHJpZQ0K4oq04oOSDQpzaW1sDQriqp0NCnZvcGYNCu2Vpw0KdmFybm90aGluZw0K4oiFDQpib3g6ZGwNCuKVlg0KOnVicmV2ZQ0KxawNCmJveDpodQ0K4pWnDQpyZHNoDQrihrMNCm5sZWZ0YXJyb3cNCuKGmg0KcmluZw0Ky5oNCmJveDp1cg0K4pWZDQpuY2Fyb24NCsWIDQpubDplDQriiabMuA0KOnJhY3V0ZQ0KxZQNCjpyaWdodDp0cmlhbmdsZTpiYXINCuKnkA0KdW9wZg0K7ZWmDQpiaWdzdGFyDQrimIUNCjpsZWZ0OmRvdWJsZTpicmFja2V0DQrin6YNCmlub2RvdA0KxLENCjpyaWdodDp1cDp0ZWU6dmVjdG9yDQripZwNCm52OmhhcnINCuKkhA0KcGFydA0K4oiCDQpyY3ViDQp9DQprYXBwYXYNCs+wDQpib3g6dnINCuKVnw0Kcmhvdg0Kz7ENCmFwOmUNCuKpsA0Kc21pZA0K4oijDQp0ZG90DQrig5sNCnRvcGYNCu2VpQ0KY3VwZG90DQriio0NCnRvc2ENCuKkqQ0KZXFjaXJjDQriiZYNCnBoZ3INCs+GDQphbmd6YXJyDQrijbwNCmJsYWNrdHJpYW5nbGUNCuKWtA0KY3lsY3R5DQrijK0NCnNvbGINCuKnhA0K
  [ [ %c ] ] Y3VwY2FwDQriqYYNCmRyY29ybg0K4oyfDQpjc2NyDQrtkrgNCjpsZWZ0OmNlaWxpbmcNCuKMiA0KbGZsb29yDQrijIoNCjp1ZGJsYWMNCsWwDQpjY3Vwc3NtDQriqZANCmV4Y2wNCiENCmtvcGYNCu2VnA0KbWxkcg0K4oCmDQpuYWN1dGUNCsWEDQpic2ltDQriiL0NCmllY3kNCtC1DQpsbmVxDQriqocNCjpkb3duOmxlZnQ6dGVlOnZlY3Rvcg0K4qWeDQpsY3ViDQp7DQo6bm90OnNxdWFyZTpzdXBlcnNldDplcXVhbA0K4oujDQpvaGdyDQrPiQ0KYXBvcw0KJw0KbmN1cA0K4qmCDQplcHNpDQrOtQ0KbGVxcQ0K4ommDQo6bjpqY3kNCtCKDQpuamN5DQrRmg0KYnNjcg0K7ZK3DQphbmdydHZiDQriir4NCmJveDp2bA0K4pWiDQpsYXRlDQriqq0NCmF1bWwNCsOkDQpqb3BmDQrtlZsNCmxuYXANCuKqiQ0KOm5vdDpzdWNjZWVkczp0aWxkZQ0K4om/zLgNCmxlc3NlcXFndHINCuKqiw0KYm94OnZoDQrilasNCmJzb2wNClwNCmJ1bXANCuKJjg0KbWxjcA0K4qubDQpuYnNwDQrCoA0Kb2FzdA0K4oqbDQo6c2hvcnQ6ZG93bjphcnJvdw0K4oaTDQpib3g6dWwNCuKVnA0KOmE6bTpwDQomDQphc2NyDQrtkrYNCmJ1bGwNCuKAog0KbGFycmxwDQrihqsNCjp1YWN1dGUNCsOaDQppb3BmDQrtlZoNCmxhcnINCuKGkA0Kbm1pZA0K4oikDQpkb3RwbHVzDQriiJQNCm9pbnQNCuKIrg0Kc3VjY2N1cmx5ZXENCuKJvQ0KbGVzZw0K4oua77iADQpuZ3RyDQriia8NCjpyaWdodDp1cDp2ZWN0b3I6YmFyDQripZQNCnNtZXBhcnNsDQrip6QNCmR6Y3kNCtGfDQpldXJvDQrigqwNCmxqY3kNCtGZDQpuZXhpc3QNCuKIhA0KY3VydmVhcnJvd3JpZ2h0DQrihrcNCmhiYXINCuKEjw0KOnZkYXNobA0K4qumDQo6dGhpY2s6c3BhY2UNCuKBn+KAig0KYi5zaWdtYQ0K7ZuUDQpuZXF1aXYNCuKJog0Kbmxlcw0K4qm9zLgNCmhhbGYNCsK9DQpob3BmDQrtlZkNCm5sZHINCuKApQ0Kb21pZA0K4qa2DQpubGVxDQriibANCjpvOmhncg0KzqkNCmR0cmkNCuKWvw0KaW90YQ0KzrkNCmFwaWQNCuKJiw0KZHN0cm9rDQrEkQ0KbGRzaA0K4oayDQpsZXNnZXMNCuKqkw0KOnRyaXBsZTpkb3QNCuKDmw0KOnVwOmVxdWlsaWJyaXVtDQripa4NCmxtb3VzdA0K4o6wDQpkb3duZG93bmFycm93cw0K4oeKDQpnc2NyDQrihIoNCm1hbHQNCuKcoA0KOnRjYXJvbg0KxaQNCmF3Y29uaW50DQriiLMNCmhhbWlsdA0K4oSLDQppYWN1dGUNCsOtDQpvZG90DQriipkNCm9vcGYNCu2VoA0KOm5vdDpodW1wOmVxdWFsDQriiY/MuA0KbGVzZG90DQriqb8NCmltb2YNCuKKtw0KbGFycmhrDQrihqkNCmtoZ3INCs+HDQpzYzplDQriqrQNCjpsb25nOmxlZnQ6YXJyb3cNCuKftQ0KOnJpZ2h0OmFycm93OmJhcg0K4oelDQpjaXJjbGVhcnJvd3JpZ2h0DQrihrsNCm5wb2xpbnQNCuKolA0KOmludmlzaWJsZTpjb21tYQ0K4oGjDQpraGN5DQrRhQ0KOmw6amN5DQrQiQ0KZnNjcg0K7ZK7DQpsYXJyZnMNCuKknQ0KZXVtbA0Kw6sNCm5idW1wZQ0K4omPzLgNCm5vcGYNCu2Vnw0KZ3NpbQ0K4omzDQppb2N5DQrRkQ0KOmU6dDpo
  [ [ %c ] ] DQrDkA0KbWFwc3RvDQrihqYNCm9kaXYNCuKouA0KZ3RjYw0K4qqnDQpjc3VwDQriq5ANCmhrc3dhcm93DQripKYNCmxvemYNCuKnqw0KbmNhcA0K4qmDDQo6cGx1czptaW51cw0KwrENCmJ1bGxldA0K4oCiDQpramN5DQrRnA0KbmFuZw0K4oig4oOSDQo6ZGlmZmVyZW50aWFsOmQNCuKFhg0KYi5lcHNpDQrtm4YNCmVzY3INCuKErw0KOmxlZnQ6Zmxvb3INCuKMig0KbWFsZQ0K4pmCDQo6bm90OmdyZWF0ZXI6c2xhbnQ6ZXF1YWwNCuKpvsy4DQpoYXJyDQrihpQNCm1vcGYNCu2Vng0KY3VsYXJyDQrihrYNCmRzY3kNCtGVDQppbnRjYWwNCuKKug0Kb3JzbG9wZQ0K4qmXDQpndHJzaW0NCuKJsw0Kb2Npcg0K4oqaDQpvZ29uDQrLmw0KOmdyZWF0ZXI6dGlsZGUNCuKJsw0KbGFycnBsDQripLkNCm5nZXMNCuKpvsy4DQpudHJpYW5nbGVsZWZ0ZXENCuKLrA0KOmRpYWNyaXRpY2FsOmFjdXRlDQrCtA0KbmlzZA0K4ou6DQo6ZGlhY3JpdGljYWw6ZG90DQrLmQ0KbGRjYQ0K4qS2DQpsaGFydWwNCuKlqg0KbmdlcQ0K4omxDQpkc2NyDQrtkrkNCmVwYXINCuKLlQ0KbWFjcg0Kwq8NCmIuOmxhbWJkYQ0K7ZqyDQpsb3BmDQrtlZ0NCmVzaW0NCuKJgg0KY3N1Yg0K4quPDQo6bGVmdDphbmdsZTpicmFja2V0DQrin6gNCmxhcnJ0bA0K4oaiDQpwcmVjc2ltDQriib4NCjpub3Q6dGlsZGUNCuKJgQ0KZHNvbA0K4qe2DQpjdXBzDQriiKrvuIANCmxhbmcNCuKfqA0Ka3Njcg0K7ZOADQptb2RlbHMNCuKKpw0KOm5vdDpncmVhdGVyOmZ1bGw6ZXF1YWwNCuKJp8y4DQpmcmFjMTYNCuKFmQ0KY2RvdA0KxIsNCmNvcGYNCu2VlA0KOmZpbGxlZDp2ZXJ5OnNtYWxsOnNxdWFyZQ0K4paqDQpmcmFjMTQNCsK8DQpmcmFjNzgNCuKFng0KY2VudA0KwqINCmZyYWMxNQ0K4oWVDQpmcmFjMjMNCuKFlA0KaXNpbmRvdA0K4ou1DQpmcmFjMTINCsK9DQpxdWVzdGVxDQriiZ8NCmRvd25oYXJwb29ubGVmdA0K4oeDDQpiLmlvdGENCu2big0KZnJhYzEzDQrihZMNCmZyYWMyNQ0K4oWWDQpnZXNsDQrii5vvuIANCm5zdXANCuKKhQ0KZnJhYzM0DQrCvg0KZnJhYzU4DQrihZ0NCmtjZWRpbA0KxLcNCmZyYWMzNQ0K4oWXDQpqc2NyDQrtkr8NCmZyYWM1Ng0K4oWaDQpob3JiYXINCuKAlQ0KOm1pbnVzOnBsdXMNCuKIkw0Kb2hhY2dyDQrPjg0KYm9wZg0K7ZWTDQpib3h2DQrilIINCmRhc2gNCuKAkA0KZnJhYzQ1DQrihZgNCml1bWwNCsOvDQpvbWludXMNCuKKlg0KZGlhbQ0K4ouEDQo6ZTpuOmcNCsWKDQpmcmFjMzgNCuKFnA0KOmk6ZWN5DQrQlQ0KOnJpZ2h0OnVwOmRvd246dmVjdG9yDQripY8NCnZzdWJuOmUNCuKri++4gA0KbHNxYg0KWw0KbnN1YnNldGVxDQriiogNCmZyYWMxOA0K4oWbDQpnamN5DQrRkw0KOnByZWNlZGVzOnRpbGRlDQriib4NCmZub2YNCsaSDQppc2NyDQrtkr4NCm5wcmUNCuKqr8y4DQphb3BmDQrtlZINCmRhcnINCuKGkw0KZ25hcA0K4qqKDQo6bGVmdDp0cmlhbmdsZTpiYXINCuKnjw0Kc3VibXVsdA0K4quBDQpndHJhcnINCuKluA0KaGVsbGlwDQrigKYNCmxtaWRv
  [ [ %c ] ] dA0KxYANCmJveGgNCuKUgA0KOmV4cG9uZW50aWFsOmUNCuKFhw0KbnN1Yg0K4oqEDQpzdWJlZG90DQriq4MNCmIuYmV0YQ0K7ZuDDQpmbGF0DQrima0NCjp0Y2VkaWwNCsWiDQo6Z3JlYXRlcjpncmVhdGVyDQriqqINCjpzdWJzZXQ6ZXF1YWwNCuKKhg0KZGpjeQ0K0ZINCmludGVyY2FsDQriiroNCjprOmpjeQ0K0IwNCmhzY3INCu2SvQ0KaXNpbg0K4oiIDQpsZXNkb3Rvcg0K4qqDDQpydWx1aGFyDQripagNCmNpcmMNCsuGDQpnbmVxDQriqogNCm1pZGRvdA0KwrcNCjpub3Q6c3F1YXJlOnN1YnNldDplcXVhbA0K4ouiDQo6azpoZ3INCs6nDQo6Z3JlYXRlcjpsZXNzDQriibcNCm5zdWJzZXQNCuKKguKDkg0KOnQ6cjphOmQ6ZQ0K4oSiDQpjaXJlDQriiZcNCmNvcHkNCsKpDQpsdHJpDQril4MNCm5lc2Vhcg0K4qSoDQo6YzpvOnA6eQ0KwqkNCnF1YXRpbnQNCuKolg0KZ3RyZXFxbGVzcw0K4qqMDQpnZXFxDQriiacNCjprOmhjeQ0K0KUNCm5wYXINCuKIpg0Kb3Njcg0K4oS0DQplZWdyDQrOtw0KbGRxdW9yDQrigJ4NCmJub3QNCuKMkA0KZ2RvdA0KxKENCmdvcGYNCu2VmA0KbnRnbA0K4om5DQpmb3JrDQrii5QNCjppOm9jeQ0K0IENCm5zaW0NCuKJgQ0KbnZnZQ0K4oml4oOSDQo6bm90OnJpZ2h0OnRyaWFuZ2xlDQrii6sNCmJldGgNCuKEtg0KZWNpcg0K4omWDQpudmx0DQo84oOSDQo6Y2F5bGV5cw0K4oStDQptYXJrZXINCuKWrg0Kc2V0bWludXMNCuKIlg0KYXRpbGRlDQrDow0KZW5zcA0K4oCCDQpvc29sDQriipgNCmNoY3kNCtGHDQp2emlnemFnDQrippoNCmVxdWFscw0KPQ0KbnNjcg0K7ZODDQpvcGFyDQriprcNCjpkb3duOnJpZ2h0OnZlY3Rvcg0K4oeBDQo6bGVmdDp1cDp2ZWN0b3INCuKGvw0Kb2Rzb2xkDQriprwNCnN1YnNldG5lcXENCuKriw0KOm86aGFjZ3INCs6PDQplbXNwDQrigIMNCmZvcGYNCu2Vlw0KbWFwc3RvdXANCuKGpQ0KOm5vdDpncmVhdGVyOnRpbGRlDQriibUNCjpyYXJydGwNCuKklg0KYi5sYW1iZGENCu2bjA0KYmV0YQ0KzrINCm1pZGNpcg0K4quwDQphbmR2DQriqZoNCmNvbXANCuKIgQ0KOnNob3J0OnVwOmFycm93DQrihpENCmNhcHMNCuKIqe+4gA0KbHBhcg0KKA0KbXNjcg0K7ZOCDQplZG90DQrElw0KZW9wZg0K7ZWWDQo6bm90OnN1YnNldDplcXVhbA0K4oqIDQpudmd0DQo+4oOSDQpsc2ltDQriibINCmJ1bXBlcQ0K4omPDQphcGFjaXINCuKprw0KbGxoYXJkDQripasNCmx0Y2MNCuKqpg0KbnZsZQ0K4omk4oOSDQpvcmRtDQrCug0KYmJyaw0K4o61DQpoYWlyc3ANCuKAig0KbWlkYXN0DQoqDQpsc2NyDQrtk4ENCjpub3Q6Z3JlYXRlcjpsZXNzDQriibkNCnByOmUNCuKqsw0KOnJpZ2h0OnRlZQ0K4oqiDQpkb3BmDQrtlZUNCm52YXANCuKJjeKDkg0Kb3VtbA0Kw7YNCnVwc2lsb24NCs+FDQphbmdlDQripqQNCmd0cmRvdA0K4ouXDQpsYXRhaWwNCuKkmQ0KcmlnaHRoYXJwb29uZG93bg0K4oeBDQphbmRkDQriqZwNCmhlYXJ0cw0K4pmlDQpvcm9yDQriqZYNCjpyaWdodDphcnJvdw0K4oaSDQpoZWFydHN1aXQN
  [ [ %c ] ] CuKZpQ0KOmhvcml6b250YWw6bGluZQ0K4pSADQpzdWNjc2ltDQriib8NCjpubzpicmVhaw0K4oGgDQpvZ3JhdmUNCsOyDQpvcmRmDQrCqg0KOm5vdDplcXVhbDp0aWxkZQ0K4omCzLgNCmNvbmcNCuKJhQ0KZXF2cGFyc2wNCuKnpQ0KbnNjZQ0K4qqwzLgNCm50bGcNCuKJuA0KOnN1Y2NlZWRzDQriibsNCjpsZXNzOmxlc3MNCuKqoQ0KbWludXNiDQriip8NCmlkaWFncg0KzpANCmI6bm90DQriq60NCmxlZnRyaWdodGFycm93cw0K4oeGDQo6bm90OnRpbGRlOnRpbGRlDQriiYkNCnN1cHNldG5lcQ0K4oqLDQpiYWNrc2ltDQriiL0NCmR6aWdyYXJyDQrin78NCm1pbnVzZA0K4oi4DQpzdXBzZXRlcXENCuKrhg0KOmRvdWJsZTpsb25nOmxlZnQ6cmlnaHQ6YXJyb3cNCuKfug0KbGJyYWNlDQp7DQo6dXA6dGVlOmFycm93DQrihqUNCmxlZnRhcnJvd3RhaWwNCuKGog0KbnByZWNlcQ0K4qqvzLgNCm52cnRyaWUNCuKKteKDkg0KbGJyYWNrDQpbDQo6dXA6ZG93bjphcnJvdw0K4oaVDQplcXVlc3QNCuKJnw0KdHJpYW5nbGVyaWdodGVxDQriirUNCmhvb2tsZWZ0YXJyb3cNCuKGqQ0KZWNhcm9uDQrEmw0KaHlidWxsDQrigYMNCm50cmlhbmdsZXJpZ2h0DQrii6sNCjpkaWFjcml0aWNhbDpncmF2ZQ0KYA0KOmRvd246YXJyb3c6dXA6YXJyb3cNCuKHtQ0KYi46Z2FtbWENCu2aqg0KYm94dTpyDQrilZgNCjp1bmRlcjpwYXJlbnRoZXNpcw0K4o+dDQpkYWxldGgNCuKEuA0KOmludGVyc2VjdGlvbg0K4ouCDQpscmhhcmQNCuKlrQ0KbnduZWFyDQripKcNCmIuemV0YQ0K7ZuHDQpvdGltZXMNCuKKlw0KOnByb2R1Y3QNCuKIjw0KY2FwY3VwDQriqYcNCmIua2FwcGF2DQrtm54NCmx0aHJlZQ0K4ouLDQpudW1lcm8NCuKElg0KdmFydHJpYW5nbGVyaWdodA0K4oqzDQpwb2ludGludA0K4qiVDQplY29sb24NCuKJlQ0KbnNjY3VlDQrii6ENCmNvbmludA0K4oiuDQpscGFybHQNCuKmkw0KZmZpbGlnDQrvrIMNCmhzdHJvaw0KxKcNCjpjb3Byb2R1Y3QNCuKIkA0KYm94djpyDQrilZ4NCmJveHY6bA0K4pWhDQplYWN1dGUNCsOpDQo6YmFja3NsYXNoDQriiJYNCjpjZW50ZXI6ZG90DQrCtw0KYm94djpoDQrilaoNCnRvcGZvcmsNCuKrmg0KY29sb25lDQriiZQNCm90aWxkZQ0Kw7UNCnByZWNhcHByb3gNCuKqtw0KbnN1Y2NlcQ0K4qqwzLgNCmxzYXF1bw0K4oC5DQo6djpkYXNoDQriiqsNCmNvbW1hdA0KQA0KOmh1bXA6ZXF1YWwNCuKJjw0KYi46ZGVsdGENCu2aqw0KYm94dTpsDQrilZsNCmNlbXB0eXYNCuKmsg0KOmdyZWF0ZXI6ZXF1YWw6bGVzcw0K4oubDQpiaWdjdXANCuKLgw0KYi51cHNpDQrtm5YNCmludGxhcmhrDQriqJcNCmRjYXJvbg0KxI8NCmRmaXNodA0K4qW/DQpmZW1hbGUNCuKZgA0KZWxzZG90DQriqpcNCmxsY29ybmVyDQrijJ4NCmZmbGxpZw0K76yEDQplZWFjZ3INCs6uDQpuc3VwOmUNCuKrhsy4DQpjYXBkb3QNCuKpgA0KOmxlZnQ6dHJpYW5nbGU6ZXF1YWwNCuKKtA0KbndhcmhrDQripKMNCmNhcGFuZA0K4qmEDQo6cmV2ZXJzZTp1cDplcXVpbGli
  [ [ %c ] ] cml1bQ0K4qWvDQphZ3JhdmUNCsOgDQpjaXJzY2lyDQrip4INCmIuOm9tZWdhDQrtm4ANCmFuZ21zZA0K4oihDQpjYXBjYXANCuKpiw0Kc3c6YXJyDQrih5kNCnI6YXRhaWwNCuKknA0KdHJpYW5nbGUNCuKWtQ0KbnRpbGRlDQrDsQ0KYmlnY2FwDQrii4INCmdjZWRpbA0KxKMNCmxvbmdtYXBzdG8NCuKfvA0KOnNxdWFyZTpzdWJzZXQNCuKKjw0KcmJya3NsZA0K4qaODQpsOmJhcnINCuKkjg0KdmFyc3Vic2V0bmVxDQriiorvuIANCm5zdXBzZXQNCuKKg+KDkg0KYi5waGl2DQrtm58NCmFuZGFuZA0K4qmVDQo6ZG91YmxlOmxvbmc6bGVmdDphcnJvdw0K4p+4DQo6bm90OnRpbGRlOmVxdWFsDQriiYQNCjpzdWNoOnRoYXQNCuKIiw0KbGVzc2VxZ3RyDQrii5oNCnBhcmFsbGVsDQriiKUNCmJveHBsdXMNCuKKng0KcGxhbmNraA0K4oSODQplbXB0eXYNCuKIhQ0KZ2VzZG90bw0K4qqCDQpib3hkOnINCuKVkg0KbnJhcnJjDQripLPMuA0KYnNvbGhzdWINCuKfiA0KYmVjYXVzZQ0K4oi1DQpkaXZpZGUNCsO3DQplOmRvdA0K4omRDQpyYnJrc2x1DQrippANCm9yaWdvZg0K4oq2DQpkOmhhcg0K4qWlDQpsZWZ0cmlnaHRoYXJwb29ucw0K4oeLDQpiLnJob3YNCu2boA0KOm5vdDpsZXNzDQriia4NCmRpZ2FtbWENCs+dDQpkOmFycg0K4oeTDQpnYWN1dGUNCse1DQppc2luOmUNCuKLuQ0KbDphYXJyDQrih5oNCmJhcndlZA0K4oyFDQpsdGxhcnINCuKltg0KbnJhcnJ3DQrihp3MuA0KZGlhbW9uZA0K4ouEDQpiYXJ2ZWUNCuKKvQ0KbnNpbWVxDQriiYQNCmJveGQ6bA0K4pWVDQpkaXZvbngNCuKLhw0KOnN1Y2NlZWRzOmVxdWFsDQriqrANCmd0bDpwYXINCuKmlQ0Kb3NsYXNoDQrDuA0KOnJpZ2h0OmZsb29yDQrijIsNCjpuZWdhdGl2ZTp0aGljazpzcGFjZQ0K4oCLDQphbmdzcGgNCuKIog0KYmVtcHR5dg0K4qawDQpib3hoOmQNCuKVpQ0KOm5vdDpsZXNzOnNsYW50OmVxdWFsDQriqb3MuA0KbnN1YjplDQriq4XMuA0Kc2ltcmFycg0K4qWyDQpsdGltZXMNCuKLiQ0KY2lyY2xlZDpyDQrCrg0KOnByZWNlZGVzDQriiboNCmNpcmNsZWQ6cw0K4pOIDQo6ZGlhY3JpdGljYWw6dGlsZGUNCsucDQo6czpvOmY6dGN5DQrQrA0KZ2FtbWFkDQrPnQ0KbnBhcnNsDQriq73ig6UNCm52ZGFzaA0K4oqsDQpkYWdnZXINCuKAoA0KOmxlc3M6dGlsZGUNCuKJsg0KYWJyZXZlDQrEgw0KY3VybHl3ZWRnZQ0K4ouPDQo6bm90OnNxdWFyZTpzdWJzZXQNCuKKj8y4DQpmb3JhbGwNCuKIgA0KZ3ZlcnRuZXFxDQriianvuIANCm1hcHN0b2xlZnQNCuKGpA0KYm94aDp1DQrilagNCjpyOmJhcnINCuKkkA0KbHVydWhhcg0K4qWmDQpuc3FzdXBlDQrii6MNCmJlcm5vdQ0K4oSsDQpiLmNoaQ0K7ZuYDQpsdHF1ZXN0DQriqbsNCjpuZXN0ZWQ6bGVzczpsZXNzDQriiaoNCmJrYXJvdw0K4qSNDQpyOmJhcnINCuKkjw0KY29tcGZuDQriiJgNCnRoaWNrYXBwcm94DQriiYgNCmlxdWVzdA0Kwr8NCmJpZ3ZlZQ0K4ouBDQpjb3B5c3INCuKElw0KOnZlcnk6dGhpbjpzcGFjZQ0K4oCKDQpjaXJtaWQN
  [ [ %c ] ] CuKrrw0KY29wcm9kDQriiJANCnVwaGFycG9vbnJpZ2h0DQrihr4NCnN1cHNldGVxDQriiocNCnNpbXBsdXMNCuKopA0KbHN0cm9rDQrFgg0KZGxjb3JuDQrijJ4NCmxvb3BhcnJvd2xlZnQNCuKGqw0KYm93dGllDQrii4gNCmN3Y29uaW50DQriiLINCmlzaW5zdg0K4ouzDQphYWN1dGUNCsOhDQpoOmFycg0K4oeUDQpyOmFhcnINCuKHmw0KZWdzZG90DQriqpgNCnN1Y2NuYXBwcm94DQriqroNCnZhcmVwc2lsb24NCs+1DQpib3R0b20NCuKKpQ0KcmFycnNpbQ0K4qW0DQpuc3FzdWJlDQrii6INCjp2ZXJ0aWNhbDp0aWxkZQ0K4omADQo6cmlnaHQ6dXA6dmVjdG9yDQrihr4NCjp1bmRlcjpiYXINCl8NCnR3b2hlYWRyaWdodGFycm93DQrihqANCmIuZXRhDQrtm4gNCmVhc3Rlcg0K4qmuDQpsc3F1b3INCuKAmg0KbWFwc3RvZG93bg0K4oanDQo6bm90OmdyZWF0ZXI6Z3JlYXRlcg0K4omrzLgNCnhoOmFycg0K4p+6DQo6bGVmdDphcnJvdzpyaWdodDphcnJvdw0K4oeGDQplZ3JhdmUNCsOoDQpnYnJldmUNCsSfDQpycHBvbGludA0K4qiSDQo6dXA6YXJyb3cNCuKGkQ0KbnNob3J0cGFyYWxsZWwNCuKIpg0KbnByY3VlDQrii6ANCmNjZWRpbA0Kw6cNCmIucmhvDQrtm5INCmNpcmNlcQ0K4omXDQpiLnBoaQ0K7ZuXDQpoc2xhc2gNCuKEjw0KbGRydXNoYXINCuKliw0KaGtzZWFyb3cNCuKkpQ0KbXN0cG9zDQriiL4NCjpub3Q6ZWxlbWVudA0K4oiJDQpib3hib3gNCuKniQ0KcXVhdGVybmlvbnMNCuKEjQ0KcmFlbXB0eXYNCuKmsw0KY2Nhcm9uDQrEjQ0KZ2VzbGVzDQriqpQNCm46Z3R2DQriiavMuA0KOm5vdDpodW1wOmRvd246aHVtcA0K4omOzLgNCmIucGl2DQrtm6ENCjpub3Q6c3VjY2VlZHM6ZXF1YWwNCuKqsMy4DQpiLnRhdQ0K7ZuVDQo6dXBzaWxvbg0KzqUNCmJsYWNrdHJpYW5nbGVsZWZ0DQril4INCnVwaGFycG9vbmxlZnQNCuKGvw0KOnJpZ2h0OmFuZ2xlOmJyYWNrZXQNCuKfqQ0KdGhlcmVmb3JlDQriiLQNCjpkb3VibGU6cmlnaHQ6dGVlDQriiqgNCmpzZXJjeQ0K0ZgNCmw6aGFyDQripaINCmd0cmFwcHJveA0K4qqGDQpjYWN1dGUNCsSHDQpsOmFycg0K4oeQDQpndHJlcWxlc3MNCuKLmw0KdmFya2FwcGENCs+wDQppdGlsZGUNCsSpDQo6dDpzOmhjeQ0K0IsNCjpsb25nOnJpZ2h0OmFycm93DQrin7YNCnJhcnJiZnMNCuKkoA0KOmNsb3NlOmN1cmx5OnF1b3RlDQrigJkNCmRsY3JvcA0K4oyNDQpucnRyaWUNCuKLrQ0KYmlndHJpYW5nbGV1cA0K4pazDQo6dmVydGljYWw6bGluZQ0KfA0KeGw6YXJyDQrin7gNCmIuOnRoZXRhDQrtmq8NCjpsZXNzOmdyZWF0ZXINCuKJtg0KY3VydmVhcnJvd2xlZnQNCuKGtg0KbjpsdHYNCuKJqsy4DQpiLnBzaQ0K7ZuZDQpyOmhhcg0K4qWkDQpkb2xsYXINCiQNCjpzcXVhcmU6c3VwZXJzZXQNCuKKkA0KcjphcnINCuKHkg0KY2lyY2xlYXJyb3dsZWZ0DQrihroNCmdlc2RvdA0K4qqADQpsbmFwcHJveA0K4qqJDQo6cHJvcG9ydGlvbmFsDQriiJ0NCmh5cGhlbg0K4oCQDQpwZXJ0ZW5rDQrigLENCmJhY2twcmlt
  [ [ %c ] ] ZQ0K4oC1DQpiZWNhdXMNCuKItQ0KOm5vdDp0aWxkZTpmdWxsOmVxdWFsDQriiYcNCjp1cDphcnJvdzpiYXINCuKkkg0KYmxhY2t0cmlhbmdsZWRvd24NCuKWvg0KOnVwZG93bmFycm93DQrih5UNCjpuZXN0ZWQ6Z3JlYXRlcjpncmVhdGVyDQriiasNCmVtc3AxMw0K4oCEDQo6c21hbGw6Y2lyY2xlDQriiJgNCnY6YmFydg0K4qupDQplbXNwMTQNCuKAhQ0KOnVwcGVyOmxlZnQ6YXJyb3cNCuKGlg0KcmlnaHRoYXJwb29udXANCuKHgA0KOm5vdDpsZXNzOmdyZWF0ZXINCuKJuA0KOnRpbGRlOnRpbGRlDQriiYgNCjpub3Q6Y3VwOmNhcA0K4omtDQo6czpoOmM6aGN5DQrQqQ0KYi5nYW1tYWQNCu2fiw0KOmxlc3M6ZXF1YWw6Z3JlYXRlcg0K4ouaDQpuYXR1cmFscw0K4oSVDQp0aGV0YXN5bQ0Kz5ENCjptZWRpdW06c3BhY2UNCuKBnw0KbGVmdGFycm93DQrihpANCnVsY29ybmVyDQrijJwNCjpub246YnJlYWtpbmc6c3BhY2UNCsKgDQo6b3BlbjpjdXJseTpkb3VibGU6cXVvdGUNCuKAnA0KcmRsZGhhcg0K4qWpDQpjdXJseWVxcHJlYw0K4oueDQp2OmRhc2gNCuKKqA0KY3VybHllcXN1Y2MNCuKLnw0KYi46c2lnbWENCu2aug0KdHJpbWludXMNCuKoug0KOnVwYXJyb3cNCuKHkQ0KYi46eGkNCu2atQ0KdjphcnINCuKHlQ0KOnByb3BvcnRpb24NCuKItw0KOmNpcmNsZTptaW51cw0K4oqWDQo6bm90OmRvdWJsZTp2ZXJ0aWNhbDpiYXINCuKIpg0KOm5vdDpyZXZlcnNlOmVsZW1lbnQNCuKIjA0KbGVxc2xhbnQNCuKpvQ0KcnRyaWx0cmkNCuKnjg0KYi46cGkNCu2atw0KbGVmdHJpZ2h0c3F1aWdhcnJvdw0K4oatDQpiYWNrZXBzaWxvbg0Kz7YNCmNvbXBsZW1lbnQNCuKIgQ0KbTpkOmRvdA0K4oi6DQo6ZXF1aWxpYnJpdW0NCuKHjA0KOnNxdWFyZTp1bmlvbg0K4oqUDQo6dGlsZGU6ZXF1YWwNCuKJgw0KYi46cHNpDQrtmr8NCnY6YmFyDQriq6gNCjpkb3VibGU6bGVmdDpyaWdodDphcnJvdw0K4oeUDQo6cm91bmQ6aW1wbGllcw0K4qWwDQo6c2hvcnQ6bGVmdDphcnJvdw0K4oaQDQpiaWdvcGx1cw0K4qiBDQpkb3RtaW51cw0K4oi4DQp1Omhhcg0K4qWjDQpiLjpwaGkNCu2avQ0KYmFja3NpbWVxDQrii40NCnU6YXJyDQrih5ENCmhvb2tyaWdodGFycm93DQrihqoNCjpmb3VyaWVydHJmDQrihLENCg==

  if (!$decode(&db,mb)) { return 0 }
  if ($fopen(wmm_html_entities_decode_db)) { .fclose wmm_html_entities_decode_db }

  .fopen -on wmm_html_entities_decode_db $qt($wmm_html_file)
  .fwrite -b wmm_html_entities_decode_db &db
  .fclose wmm_html_entities_decode_db

  return 1

  :error | wmm_werror $scriptline $error | reseterror
}

; --- End of other aliases ---

; ------------------------------------------------------------------------------ EOF ------------------------------------------------------------------------------