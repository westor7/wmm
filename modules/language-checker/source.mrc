/*

#########################################

	 #    Language-Checker   #
	  # v1.2 - (14/10/2018) #
	   # Thanks Supporters #

#########################################

*/

; --- Start of dialogs ---

dialog -l wlc_sets {
  title ""
  size -1 -1 327 154
  option dbu disable
  icon $scriptdir $+ $mod $+ _main.ico, 0
  button "Close this window", 1, 77 136 193 17, default ok
  icon 280, 295 136 30 9, $wmm_dir $+ donate.png, 1, noborder center
  tab "Settings 1", 2, 2 2 324 122
  text "Ignore channel(s):", 3, 4 20 75 8, tab 2 center
  list 4, 4 30 78 92, disable tab 2 size hsbar vsbar
  button "Add", 6, 84 30 43 10, tab 2
  button "Del", 7, 84 40 43 10, disable tab 2
  button "Clear", 8, 84 111 43 12, disable tab 2
  button "Add", 16, 200 30 43 10, tab 2
  text "Ignore user(s):", 14, 248 20 76 8, tab 2 center
  button "Del", 17, 200 40 43 10, disable tab 2
  list 15, 245 30 78 92, disable tab 2 size hsbar vsbar
  button "Clear", 18, 200 111 43 12, disable tab 2
  tab "Settings 2", 13
  text "Private Notice Command:", 9, 4 20 125 8, tab 13
  edit "", 5, 130 19 18 9, tab 13 limit 1 center
  text "Channel Message Command:", 11, 4 30 125 8, tab 13
  edit "", 10, 130 29 18 9, tab 13 limit 1 center
  combo 19, 4 55 63 57, tab 13 size drop
  text "Language:", 20, 4 45 63 8, tab 13 center
  check "Enable", 12, 2 141 54 10
  text "", 21, 301 144 22 8, center disable
  check "Show the 'Language' information", 29, 160 18 164 10, tab 13
  check "Show the 'Language Code' information", 30, 160 28 164 10, tab 13
  check "Show the 'Probability' information", 31, 160 38 164 10, tab 13
  check "Show color/bold/underline in informations", 52, 4 112 290 10, tab 13
  check "Display the module output messages", 620, 4 102 150 10, tab 13
  text "Supported Languages", 53, 150 50 125 50, tab 13 center
  list 538, 160 60 40 50, disable tab 13 size hsbar vsbar
  list 539, 201 60 60 50, disable tab 13 size hsbar vsbar
  tab "Settings 3", 530
  check "Display the 'menubar' module menu", 54, 4 20 200 10, tab 530
  check "Display the 'status' module menu", 55, 4 30 200 10, tab 530
  check "Display the 'channel' module menu", 56, 4 40 200 10, tab 530
  check "Display the 'query' module menu", 57, 4 50 200 10, tab 530
  check "Display the 'nicklist' module menu", 58, 4 60 200 10, tab 530
  menu "Menu", 22
  item "Help", 23, 22
  item break, 501
  item "About", 24, 22
  item break, 502
  item "Restart", 25, 22
  item break, 503
  item "Exit", 26, 22
}

; --- End of dialogs ---

; --- Start of events ---

ON *:DIALOG:wlc_sets:*:*: {
  if ($devent == init) {
    dialog -t $dname $addon v $+ $ [ $+ [ $mod ] $+ ] _ver $lang(4) $wmm_bel (/ [ $+ [ $mod ] $+ ] _sets)
    .timer[ $+ $mod $+ _ANIMATE_TITLE_NOW] -ho 1 2000 wmm_dtitle $dname $dialog($dname).title
    did -ra $dname 1 $lang(3)
    did -ra $dname 2 $lang(4) 1
    did -ra $dname 3 $lang(5)
    did -ra $dname 6 $lang(6)
    did -ra $dname 7 $lang(7)
    did -ra $dname 8 $lang(8)
    did -ra $dname 16 $lang(6)
    did -ra $dname 14 $lang(9)
    did -ra $dname 17 $lang(7)
    did -ra $dname 18 $lang(8)
    did -ra $dname 13 $lang(4) 2
    did -ra $dname 9 $lang(10)
    did -ra $dname 11 $lang(11)
    did -ra $dname 20 $lang(12)
    did -ra $dname 12 $lang(13)
    did -ra $dname 21 v $+ $ [ $+ [ $mod ] $+ ] _ver
    did -o $dname 22 $lang(14)
    did -o $dname 23 $lang(15)
    did -o $dname 24 $lang(16)
    did -o $dname 25 $lang(17)
    did -o $dname 26 $lang(18)

    did -ra $dname 29 $lang(47) $qt($lang(43)) $lang(48)
    did -ra $dname 30 $lang(47) $qt($lang(44)) $lang(48)
    did -ra $dname 31 $lang(47) $qt($lang(46)) $lang(48)

    did -ra $dname 52 $lang(49)
    did -ra $dname 53 $lang(53) $+ :
    did -ra $dname 620 $lang(56)

    did -ra $dname 530 $lang(4) 3
    did -ra $dname 54 $lang(54) $qt(menubar) $lang(55)
    did -ra $dname 55 $lang(54) $qt(status) $lang(55)
    did -ra $dname 56 $lang(54) $qt(channel) $lang(55)
    did -ra $dname 57 $lang(54) $qt(query) $lang(55)
    did -ra $dname 58 $lang(54) $qt(nicklist) $lang(55)

    if ($group(# [ $+ [ $mod ] $+ ] _menu_menubar) == on) { did -c $dname 54 }
    if ($group(# [ $+ [ $mod ] $+ ] _menu_status) == on) { did -c $dname 55 }
    if ($group(# [ $+ [ $mod ] $+ ] _menu_channel) == on) { did -c $dname 56 }
    if ($group(# [ $+ [ $mod ] $+ ] _menu_query) == on) { did -c $dname 57 }
    if ($group(# [ $+ [ $mod ] $+ ] _menu_nicklist) == on) { did -c $dname 58 }

    if ($istok(% [ $+ [ $mod ] $+ ] _show,language_name,32)) { did -c $dname 29 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,language_code,32)) { did -c $dname 30 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,probability,32)) { did -c $dname 31 }

    if (% [ $+ [ $mod ] $+ ] _status) { did -c $dname 12 }
    if (% [ $+ [ $mod ] $+ ] _strip) { did -c $dname 52 }
    if (% [ $+ [ $mod ] $+ ] _output) { did -c $dname 620 }

    if (% [ $+ [ $mod ] $+ ] _prefix_chan) { did -ra $dname 10 % [ $+ [ $mod ] $+ ] _prefix_chan }
    if (% [ $+ [ $mod ] $+ ] _prefix_nick) { did -ra $dname 5 % [ $+ [ $mod ] $+ ] _prefix_nick }

    var %f = $scriptdir $+ $mod $+ _lang.ini
    if ($ini(%f,0)) { 
      var %t = $v1
      var %i = 1
      while (%i <= %t) {
        var %l = $ini(%f,%i)
        if (%l) && (%l !== % [ $+ [ $mod ] $+ ] _lang) { did -a $dname 19 %l }
        inc %i
      }
      if (% [ $+ [ $mod ] $+ ] _lang) { did -ca $dname 19 % [ $+ [ $mod ] $+ ] _lang }
    }
    else { did -b $dname 19 }

    var %z = 1
    while (%z <= $numtok($langs,44)) { did -a $dname 538 $gettok($langs,%z,44) | did -a $dname 539 $gettok($dlangs,%z,44) | inc %z }
    did -e $dname 538,539

    wmm_ignore_cn_list
  }
  if ($devent == menu) {
    if ($did == 23) { url $wmm_page }
    if ($did == 24) { wmm_input ok 60 $addon v $+ $ [ $+ [ $mod ] $+ ] _ver $lang(36) $ [ $+ [ $mod ] $+ ] _crdate $lang(26) $wmm_owner }
    if ($did == 25) { dialog -k $dname | .timer -mo 1 500 $mod $+ _sets }
    if ($did == 26) { dialog -k $dname }
  }
  if ($devent == close) {
    .timer[ $+ $mod $+ _*] off
    if (!% [ $+ [ $mod ] $+ ] _show) { set % $+ $mod $+ _show language_name language_code }
    if (!$did(5)) || ($did(5) isalnum) { set % $+ $mod $+ _prefix_chan @ }
    if (!$did(10)) || ($did(10) isalnum) { set % $+ $mod $+ _prefix_nick ! }
    if ($did(19)) { set % $+ $mod $+ _lang $did(19) }
  }
  if ($devent == edit) {
    if ($did == 5) {
      if ($did($did).text) { set % $+ $mod $+ _prefix_nick $v1 }
      else { unset % $+ $mod $+ _prefix_nick }
    }
    if ($did == 10) {
      if ($did($did).text) { set % $+ $mod $+ _prefix_chan $v1 }
      else { unset % $+ $mod $+ _prefix_chan }
    }
  }
  if ($devent == dclick) {
    if ($did == 538) && ($did($did).seltext) { did -c $dname 539 $didwm($did,$did($did).seltext) }
    if ($did == 539) && ($did($did).seltext) { did -c $dname 538 $didwm($did,$did($did).seltext) }
  }
  if ($devent == sclick) {
    if ($did == 280) { url $wmm_donate }
    if ($did == 29) {
      var %v = language_name
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 30) {
      var %v = language_code
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 31) {
      var %v = probability
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 620) {
      if (!% [ $+ [ $mod ] $+ ] _output) { set % $+ $mod $+ _output 1 }
      else { set % $+ $mod $+ _output 0 }
    }
    if ($did == 12) {
      if (!% [ $+ [ $mod ] $+ ] _status) { set % $+ $mod $+ _status 1 }
      else { set % $+ $mod $+ _status 0 }
    }
    if ($did == 52) {
      if (!% [ $+ [ $mod ] $+ ] _strip) { set % $+ $mod $+ _strip 1 }
      else { set % $+ $mod $+ _strip 0 }
    }
    if ($did == 54) {
      if ($group(# [ $+ [ $mod ] $+ ] _menu_menubar) == on) { .disable # [ $+ [ $mod ] $+ ] _menu_menubar }
      else { .enable # [ $+ [ $mod ] $+ ] _menu_menubar }
    }
    if ($did == 55) {
      if ($group(# [ $+ [ $mod ] $+ ] _menu_status) == on) { .disable # [ $+ [ $mod ] $+ ] _menu_status }
      else { .enable # [ $+ [ $mod ] $+ ] _menu_status }
    }
    if ($did == 56) {
      if ($group(# [ $+ [ $mod ] $+ ] _menu_channel) == on) { .disable # [ $+ [ $mod ] $+ ] _menu_channel }
      else { .enable # [ $+ [ $mod ] $+ ] _menu_channel }
    }
    if ($did == 57) {
      if ($group(# [ $+ [ $mod ] $+ ] _menu_query) == on) { .disable # [ $+ [ $mod ] $+ ] _menu_query }
      else { .enable # [ $+ [ $mod ] $+ ] _menu_query }
    }
    if ($did == 58) {
      if ($group(# [ $+ [ $mod ] $+ ] _menu_nicklist) == on) { .disable # [ $+ [ $mod ] $+ ] _menu_nicklist }
      else { .enable # [ $+ [ $mod ] $+ ] _menu_nicklist }
    }
    if ($did == 4) { 
      if ($did($did).seltext) { did -e $dname 7 }    
    }
    if ($did == 15) { 
      if ($did($did).seltext) { did -e $dname 17 }    
    }
    if ($did == 7) {
      did -b $dname $did
      var %s = $did(4).seltext
      if (!%s) { return }
      var %net = $gettok(%s,1,32)
      var %chan = $gettok(%s,3,32)
      set % $+ $mod $+ _ignore_ $+ %net $+ _chans $remtok(% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _chans,%chan,1,32)
      if (!% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _chans) { 
        unset % [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _chans
        set % $+ $mod $+ _ignore_chans_networks $remtok(% [ $+ [ $mod ] $+ ] _ignore_chans_networks,%net,1,32)
        if (!% [ $+ [ $mod ] $+ ] _ignore_chans_networks) { unset % $+ $mod $+ _ignore_chans_networks }
      }
      wmm_ignore_cn_list
    }
    if ($did == 17) {
      did -b $dname $did
      var %s = $did(15).seltext
      if (!%s) { return }
      var %net = $gettok(%s,1,32)
      var %nick = $gettok(%s,3,32)
      set % $+ $mod $+ _ignore_ $+ %net $+ _nicks $remtok(% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _nicks,%nick,1,32)
      if (!% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _nicks) { 
        unset % [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _nicks
        set % $+ $mod $+ _ignore_nicks_networks $remtok(% [ $+ [ $mod ] $+ ] _ignore_nicks_networks,%net,1,32)
        if (!% [ $+ [ $mod ] $+ ] _ignore_nicks_networks) { unset % [ $+ [ $mod ] $+ ] _ignore_nicks_networks }
      }
      wmm_ignore_cn_list
    }
    if ($did == 6) {
      var %net = $input($lang(27),eidbk60,$addon $wmm_bel $lang(22))
      if (!$dialog($dname)) { return }
      if (!%net) { $mod $+ _sets | return }
      if ($numtok(%net,32) !== 1) { wmm_input error 60 $lang(28) | $mod $+ _sets | return }
      if ($len(%net) > 50) { wmm_input error 60 $lang(29) | $mod $+ _sets | return }
      var %chan = $input($lang(30),eidbk60,$addon $wmm_bel $lang(22))
      if (!$dialog($dname)) { return }
      if (!%chan) { $mod $+ _sets | return }
      if ($numtok(%chan,32) !== 1) { wmm_input error 60 $lang(31) | $mod $+ _sets | return }
      if ($numtok(%chan,44) !== 1) { wmm_input error 60 $lang(31) | $mod $+ _sets | return }
      if ($left(%chan,1) !== $chr(35)) { wmm_input error 60 $lang(32) | $mod $+ _sets | return }
      if ($istok(% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _chans,%chan,32)) { wmm_input error 60 $lang(33) | $mod $+ _sets | return }
      set % $+ $mod $+ _ignore_ $+ %net $+ _chans $addtok(% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _chans,%chan,32)
      if (!$istok(% [ $+ [ $mod ] $+ ] _ignore_chans_networks,%net,32)) { set % $+ $mod $+ _ignore_chans_networks $addtok(% [ $+ [ $mod ] $+ ] _ignore_chans_networks,%net,32) }
      wmm_ignore_cn_list
      $mod $+ _sets
    }
    if ($did == 16) {
      var %net = $input($lang(27),eidbk60,$addon $wmm_bel $lang(22))
      if (!$dialog($dname)) { return }
      if (!%net) { $mod $+ _sets | return }
      if ($numtok(%net,32) !== 1) { wmm_input error 60 $lang(28) | $mod $+ _sets | return }
      if ($len(%net) > 50) { wmm_input error 60 $lang(29) | $mod $+ _sets | return }
      var %nick = $input($lang(21),eidbk60,$addon $wmm_bel $lang(22))
      if (!$dialog($dname)) { return }
      if (!%nick) { $mod $+ _sets | return }
      if ($numtok(%nick,32) !== 1) { wmm_input error 60 $lang(35) | $mod $+ _sets | return }
      if ($istok(% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _nicks,%nick,32)) { wmm_input error 60 $lang(34) | $mod $+ _sets | return }
      set % $+ $mod $+ _ignore_ $+ %net $+ _nicks $addtok(% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _nicks,%nick,32)
      if (!$istok(% [ $+ [ $mod ] $+ ] _ignore_nicks_networks,%net,32)) { set % $+ $mod $+ _ignore_nicks_networks $addtok(% [ $+ [ $mod ] $+ ] _ignore_nicks_networks,%net,32) }
      wmm_ignore_cn_list
      $mod $+ _sets
    }
    if ($did == 8) {
      did -b $dname 8,7
      var %z = 1
      while (%z <= $numtok(% [ $+ [ $mod ] $+ ] _ignore_chans_networks,32)) {
        var %net = $gettok(% [ $+ [ $mod ] $+ ] _ignore_chans_networks,%z,32)     
        if (% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _chans) { unset % [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _chans }
        inc %z
      }
      unset % $+ $mod $+ _ignore_chans_networks
      wmm_ignore_cn_list
    }
    if ($did == 18) {
      did -b $dname 18,17
      var %z = 1
      while (%z <= $numtok(% [ $+ [ $mod ] $+ ] _ignore_nicks_networks,32)) {
        var %net = $gettok(% [ $+ [ $mod ] $+ ] _ignore_nicks_networks,%z,32)     
        if (% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _nicks) { unset % [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ %net ] $+ ] _nicks }
        inc %z
      }
      unset % $+ $mod $+ _ignore_nicks_networks
      wmm_ignore_cn_list
    }
  }
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

ON *:LOAD: { 
  if (!$manager) { noop $input(You must first download and install the $qt($upper($wmm_owner) Module Manager) and install that module from the manager in order to work that module!,houdbk60,Error) | .unload -nrs $qt($script) | return }
  if ($wmm_error) { noop $input(There was an error due installing that module because there are missing some several functions from the $qt($upper($wmm_owner) Module Manager) project source code!!! $+ $+ $crlf $crlf Error Code: $wmm_error,houdbk60,WMM -> Error) | .unload -nrs $qt($script) | return }
  if ($group(# [ $+ [ $lower($addon) ] ] ).fname !== $script) { wmm_input error 60 This module cannot work more than one time into this client because you already have this module installed! | .unload -nrs $qt($script) | return }
  wmm_dl $main_ico_url $qt($scriptdir $+ $mod $+ _main.ico)
  wmm_dl $lang_url $qt($scriptdir $+ $mod $+ _lang.ini)
  .enable $chr(35) $+ $mod $+ _menu_menubar
  if (% [ $+ [ $mod ] $+ ] _status == $null) { set % $+ $mod $+ _status 1 }
  if (% [ $+ [ $mod ] $+ ] _strip == $null) { set % $+ $mod $+ _strip 0 }
  if (% [ $+ [ $mod ] $+ ] _output == $null) { set % $+ $mod $+ _output 0 }
  if (% [ $+ [ $mod ] $+ ] _lang == $null) { set % $+ $mod $+ _lang English }
  if (% [ $+ [ $mod ] $+ ] _prefix_nick == $null) { set % $+ $mod $+ _prefix_nick ! }
  if (% [ $+ [ $mod ] $+ ] _prefix_chan == $null) { set % $+ $mod $+ _prefix_chan @ }
  if (% [ $+ [ $mod ] $+ ] _show == $null) { set % $+ $mod $+ _show language_name language_code probability }
  hfree -w  $mod $+ _*
  .signal -n wmm_close
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

ON *:UNLOAD: {
  if ($dialog( [ $+ [ $mod ] $+ ] _sets)) { dialog -x $v1 }
  var %1 = $scriptdir $+ $mod $+ _main.ico
  var %2 = $scriptdir $+ $mod $+ _lang.ini
  if ($isfile(%1)) { .remove $qt(%1) }
  if ($isfile(%2)) { .remove $qt(%2) }
  .timer[ $+ $mod $+ _*] off
  unset % $+ $mod $+ _*
  hfree -w $mod $+ _*
  .signal -n wmm_close
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

ON *:INPUT:#: {
  if (!$manager) || ($wmm_error) || (!% [ $+ [ $mod ] $+ ] _status) || (!% [ $+ [ $mod ] $+ ] _output) || ($inpaste) || ($ctrlenter) || ($left($1,1) == $comchar) || ($status !== connected) || ($me !ison $chan) { return }
  tokenize 32 $strip($1-)
  var %cn = $network $+ ~ $+ $me $+ ~ $+ $chan
  if ($hget( [ $+ [ $mod ] $+ ] _FLOOD,%cn)) { return }

  var %c_char = $evalnext($+(%,$mod,_prefix_chan))
  var %n_char = $evalnext($+(%,$mod,_prefix_nick))

  if ($left($1,1) == %n_char) && ($1 == $+(%n_char,$command)) { var %action = $iif(% [ $+ [ $mod ] $+ ] _output,notice,.notice) $me }
  if ($left($1,1) == %c_char) && ($1 == $+(%c_char,$command)) { var %action = $iif(% [ $+ [ $mod ] $+ ] _output,msg,.msg) $chan }

  if (%action) {
    hadd -mu6 $upper($mod) $+ _FLOOD %cn 1
    if (!$2) { .timer -h 1 0 %action ( $++ $wmm_bold($me) $++ ): $lang(37) - $lang(38) $wmm_bold($1 < $+ $wmm_under($lang(50)) $+ >) - ( $++ $lang(39) $wmm_bold($1 $wmm_under($lang(52))) $+ ) | return }
    .timer -h 1 0 $mod $+ _ $+ $replace($addon,$chr(45),$chr(95)) $me $chan $gettok(%action,1,32) $unsafe($2-)
  }

  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

ON $*:TEXT:$(/^(\Q $+ $replacecs($evalnext($+(%,$mod,_prefix_nick)),\E,\E\\E\Q) $+ \E|\Q $+ $replacecs($evalnext($+(%,$mod,_prefix_chan)),\E,\E\\E\Q) $+ \E).*/Si):#: {
  if (!$manager) || ($wmm_error) || (!% [ $+ [ $mod ] $+ ] _status) || ($istok(% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ $network ] $+ ] _chans,$chan,32)) || ($istok(% [ $+ [ $mod ] $+ ] _ignore_ [ $+ [ $network ] $+ ] _nicks,$nick,32)) { return }
  tokenize 32 $strip($1-)
  var %cn = $network $+ ~ $+ $nick $+ ~ $+ $chan
  if ($hget( [ $+ [ $mod ] $+ ] _FLOOD,%cn)) { return }

  var %c_char = $evalnext($+(%,$mod,_prefix_chan))
  var %n_char = $evalnext($+(%,$mod,_prefix_nick))

  if ($left($1,1) == %n_char) && ($1 == $+(%n_char,$command)) { var %action = $iif(% [ $+ [ $mod ] $+ ] _output,notice,.notice) $nick }
  if ($left($1,1) == %c_char) && ($1 == $+(%c_char,$command)) { var %action = $iif(% [ $+ [ $mod ] $+ ] _output,msg,.msg) $chan }

  if (%action) {
    hadd -mu6 $upper($mod) $+ _FLOOD %cn 1
    if (!$2) { %action ( $++ $wmm_bold($nick) $++ ): $lang(37) - $lang(38) $wmm_bold($1 < $+ $wmm_under($lang(50)) $+ >) - ( $++ $lang(39) $wmm_bold($1 $wmm_under($lang(52))) $+ ) | return }
    $mod $+ _ $+ $replace($addon,$chr(45),$chr(95)) $nick $chan $gettok(%action,1,32) $2-
  }

  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

; --- End of events ---

; --- Start of aliases ---

alias wlc_ver { return $right($gettok($read($script,n,6),3,32),3) }
alias wlc_crdate { return $remove($gettok($read($script,n,6),5,32),$chr(40),$chr(41)) }

alias -l mod { return wlc }
alias -l command { return lang }
alias -l manager { return $iif($isalias(wmm_ver),$wmm_ver,0) }
alias -l addon { return $gettok($read($script,n,5),3,32) }
alias -l dlangs { return English,Afrikaans,Arabic,Azerbaijani,Belarusian,Bulgarian,Bengali,Bosnian,Catalan,Cebuano,Czech,Welsh,Danish,German,Greek,Esperanto,Spanish,Estonian,Basque,Persian,Finnish,French,Irish,Galician,Gujarati,Hausa,Hindi,Hmong,Croatian,Haitian Creole,Hungarian,Armenian,Indonesian,Igbo,Icelandic,Italian,Hebrew,Japanese,Javanese,Georgian,Kazakh,Khmer,Kannada,Korean,Latin,Laotian,Lithuanian,Latvian,Malagasy,Maori,Macedonian,Malayalam,Mongolian,Marathi,Malay,Maltese,Nepali,Dutch,Norwegian,Chichewa,Punjabi,Polish,Portuguese,Romanian,Russian,Sinhala,Slovak,Slovenian,Albanian,Serbian,Sesotho,Sundanese,Swedish,Swahili,Tamil,Telugu,Tajik,Thai,Turkish,Ukrainian,Urdu,Uzbek,Vietnamese,Fillipino,Yiddish,Yoruba,Chinese Simplified,Chinese Traditional,Zulu,Oromo,Pulaar,Kurdish,Tagalog,Madurese,Quichua,Kinyarwanda,Lingala,Qiandong Miao,Iloko,Uighur,Akan,Hiligaynon,Shona,Xhosa,Minangkabau,Luba-Kasai,Rundi,Turkmen,Sukuma,Sango,Nynorsk,Mossi,Sotho,Central Bikol,Umbundu,Tswana,Northern Sotho,Balinese,Buginese,Kanuri,Ibibio,Luganda,Acehnese,Bambara,Kimbundu,Lunda,Tamazight,Waray,Wolof,Low German,Makhuwa,Ewe,Aymara,Bemba,Baoulé,Pampanga,Tiv,Tok Pisin,Kirghiz,Swati,Nyankole,Yao,Cusco Quechua,Vlax Romani,Logudorese Sardinian,Scots,Tsonga,Mende,Fon,Central Nahuatl,Dinka,Makonde,Siona,Kabiyè,Timne,Tonga,Soninke,Chokwe,Adangme,Bini,Ga,Kongo,Ndonga,Ayacucho Quechua,Balkan Romani,Tatar,Maithili,Bhojpuri,Magahi,Amharic,Tigrinya,Maninka }
alias -l langs { return en,af,ar,az,be,bg,bn,bs,ca,ceb,cs,cy,da,de,el,eo,es,et,eu,fa,fi,fr,ga,gl,gu,ha,hi,hmn,hr,ht,hu,hy,id,ig,is,it,iw,ja,jw,ka,kk,km,kn,ko,la,lo,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,ne,nl,no,ny,pa,pl,pt,ro,ru,si,sk,sl,so,sq,sr,st,su,sv,sw,ta,te,tg,th,tr,uk,ur,uz,vi,fil,yi,yo,zh,zhh,zu,gax,fuc,ckb,tgl,mad,qug,kin,lin,hms,ilo,uig,aka,hil,sna,xho,min,lua,run,tuk,suk,sag,nno,mos,sot,bcl,umb,tsn,nso,ban,bug,knc,ibb,lug,ace,bam,kmb,lun,tzm,war,wol,nds,vmw,ewe,ayr,bem,bci,pam,tiv,tpi,kir,ssw,nyn,yao,quz,rmy,src,sco,tso,men,fon,nhn,dip,kde,snn,kbp,tem,toi,snk,cjk,ada,bin,gaa,kng,ndo,quy,rmn,tat,mai,bho,mag,amh,tir,emk }
alias -l lang_url { return $+(http://,$wmm_owner,.ucoz.com/wmm/languages/,$mod,_lang.ini) }
alias -l main_ico_url { return $+(http://,$wmm_owner,.ucoz.com/wmm/images/,$mod,_main.ico) }

alias -l lang {
  var %f = $scriptdir $+ $mod $+ _lang.ini
  if (!% [ $+ [ $mod ] $+ ] _lang) { set % $+ $mod $+ _lang English }
  if (!$file(%f)) || (!$isid) || (!$1) || ($1 !isnum) { return 0 }
  var %h = $upper($mod) $+ _LANG_ $+ % [ $+ [ $mod ] $+ ] _lang
  if (!$hget(%h)) && ($ini(%f,% [ $+ [ $mod ] $+ ] _lang)) { hmake %h 1000 | hload -i %h $qt(%f) % [ $+ [ $mod ] $+ ] _lang }
  var %r = $hget(%h,$1)
  if (%r) { return %r }
  else { return N/A }
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

; ########################################################## 

alias wlc_sets { 
  if (!$manager) { noop $input(You must first download and install the $qt($upper($wmm_owner) Module Manager) and install that module from the manager in order to work that module!,houdbk60,Error) | .unload -nrs $qt($script) | return }
  if ($wmm_error) { noop $input(There was an error due installing that module because there are missing some several functions from the $qt($upper($wmm_owner) Module Manager) Module Manager) project source code!!! $+ $+ $crlf $crlf Error Code: $wmm_error,houdbk60,WMM -> Error) | .unload -nrs $qt($script) | return }
  if ($group(# [ $+ [ $lower($addon) ] ] ).fname !== $script) { wmm_input error 60 This module cannot work more than one time into this client because you already have this module installed! | .unload -nrs $qt($script) | return }
  var %d = $mod $+ _sets
  if ($dialog(%d)) { dialog -ve %d %d | return }
  var %i = $scriptdir $+ $mod $+ _main.ico
  var %l = $scriptdir $+ $mod $+ _lang.ini
  var %n = $wmm_dir $+ donate.png
  if (!$file(%l)) || (!$file(%i)) || (!$file(%n)) { var %delay = 1 }
  if (%delay) {
    if (!$wmm_internet) { wmm_input error 60 There are some require files that missing from this module, there must be an internet connection in order to download them! | return }
    wmm_dl $main_ico_url $qt(%i)
    wmm_dl $lang_url $qt(%l)
    wmm_dl $wmm_donate_png_url $qt(%n)
    .timer[ $+ $mod $+ _DELAY_DL_AND_OPEN] -o 1 3 $mod $+ _sets_reopen 
    wmm_input warn 3 Downloading some require module files...
    return 
  }
  dialog -md %d %d
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

alias -l wlc_sets_reopen {
  var %i = $scriptdir $+ $mod $+ _main.ico
  var %l = $scriptdir $+ $mod $+ _lang.ini
  var %n = $wmm_dir $+ donate.png
  if (!$file(%l)) || (!$file(%i)) || (!$file(%n)) { wmm_input error 60 FATAL ERROR! @newline@ @newline@ $+ Error Code: 0xm001 | return }
  $mod $+ _sets
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

alias wlc_language_checker {
  if (!$wmm_internet) || (!$1-) || (!$wmm_apikey($addon)) { return }
  if (msg isin $3) { var %output = $3 $2 }
  elseif (notice isin $3) { var %output = $3 $1 }
  if (!% [ $+ [ $mod ] $+ ] _show) { set % $+ $mod $+ _show language_name language_code }

  var %v = language_checker_ $+ $wmm_random

  jsonopen -ud %v http://apilayer.net/api/detect?access_key= $+ $wmm_apikey($addon) $+ &query= $+ $wmm_urlencode($4-)
  if ($jsonerror) { var %m = ( $+ $wmm_bold($1) $+ ): $lang(40) - ( $+ $lang(41) $wmm_bold($jsonerror) $+ ) | %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%m),%m) | return }

  var %status = $json(%v,success).value
  if (%status !== $true) { var %m = ( $+ $wmm_bold($1) $+ ): $lang(42) | %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%m),%m) | return }

  if ($istok(% [ $+ [ $mod ] $+ ] _show,language_name,32)) { var %name = $json(%v,results,0,language_name).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,language_code,32)) { var %code = $json(%v,results,0,language_code).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,probability,32)) { var %per = $int($json(%v,results,0,probability).value) }

  var %msg = 8,2 $+ $gettok($addon,1,45) $+ -0,14 $+ $gettok($addon,2,45) $+ : $wmm_bel $iif(%name,$wmm_bold($lang(43)) $+ :4 %name $+ ) $iif(%code,$wmm_sep $wmm_bold($lang(44)) $+ :3 %code $+ ) $iif(%per,$wmm_sep $wmm_bold($lang(46)) $+ :10 %per $+ $chr(37) $+ )
  %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%msg),%msg)
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

; --- End of aliases ---

; --- Start of menus ---

#wlc_menu_menubar off
menu menubar { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wlc_menu_menubar end
#wlc_menu_status off
menu status { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wlc_menu_status end
#wlc_menu_channel off
menu channel { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wlc_menu_channel end
#wlc_menu_nicklist off
menu nicklist { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wlc_menu_nicklist end
#wlc_menu_query off
menu query { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wlc_menu_query end

; --- End of menus ---

; --- Start of groups ---

#language-checker off
#language-checker end

; --- End of groups ---

; ------------------------------------------------------------------------------ WLC EOF ------------------------------------------------------------------------------