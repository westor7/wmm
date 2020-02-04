/*

#########################################

	 #  PhoneNumber-Checker  #
	  # v1.1 - (14/10/2018) #
	   # Thanks Supporters #

#########################################

*/

; --- Start of dialogs ---

dialog -l wpn_sets {
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
  check "Show the 'Phone Number", 29, 153 18 164 10, tab 13
  check "Show the 'Local Number' information", 30, 153 28 164 10, tab 13
  check "Show the 'International Number' information", 31, 153 38 164 10, tab 13
  check "Show the 'Prefix Number' information", 32, 153 48 164 10, tab 13
  check "Show the 'CountryCode Number' information", 33, 153 58 168 10, tab 13
  check "Show the 'CountryName Number' information", 34, 153 68 168 10, tab 13
  check "Show the 'Location Number", 35, 153 78 164 10, tab 13
  check "Show the 'Carrier Number' information", 36, 153 88 164 10, tab 13
  check "Show the 'Number Type' information", 37, 153 98 164 10, tab 13
  check "Show color/bold/underline in informations", 52, 4 112 180 10, tab 13
  check "Display the module output messages", 620, 4 102 145 10, tab 13
  tab "Settings 3", 530
  check "Display the 'menubar' module menu", 54, 4 20 180 10, tab 530
  check "Display the 'status' module menu", 55, 4 30 180 10, tab 530
  check "Display the 'channel' module menu", 56, 4 40 180 10, tab 530
  check "Display the 'query' module menu", 57, 4 50 180 10, tab 530
  check "Display the 'nicklist' module menu", 58, 4 60 180 10, tab 530
  text "Supported Countries", 53, 215 60 105 50, tab 530 center
  list 538, 200 70 123 50, disable tab 530 size hsbar vsbar
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

ON *:DIALOG:wpn_sets:*:*: {
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
    did -ra $dname 31 $lang(47) $qt($lang(57)) $lang(48)
    did -ra $dname 32 $lang(47) $qt($lang(58)) $lang(48)
    did -ra $dname 33 $lang(47) $qt($lang(59)) $lang(48)
    did -ra $dname 34 $lang(47) $qt($lang(60)) $lang(48)
    did -ra $dname 35 $lang(47) $qt($lang(61)) $lang(48)
    did -ra $dname 36 $lang(47) $qt($lang(62)) $lang(48)
    did -ra $dname 37 $lang(47) $qt($lang(63)) $lang(48)

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

    if ($istok(% [ $+ [ $mod ] $+ ] _show,number,32)) { did -c $dname 29 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,local_number,32)) { did -c $dname 30 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,international_number,32)) { did -c $dname 31 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,prefix,32)) { did -c $dname 32 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,countrycode,32)) { did -c $dname 33 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,countryname,32)) { did -c $dname 34 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,location,32)) { did -c $dname 35 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,carrier,32)) { did -c $dname 36 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,type,32)) { did -c $dname 37 }

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
    while (%z <= $numtok($ncodes,44)) { did -a $dname 538 $gettok($ncodes,%z,44) $gettok($codes,%z,44) $gettok($countries,%z,44) | inc %z }
    did -e $dname 538

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
    if (!% [ $+ [ $mod ] $+ ] _show) { set % $+ $mod $+ _show international_number countrycode  }
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
  if ($devent == sclick) {
    if ($did == 280) { url $wmm_donate }
    if ($did == 29) {
      var %v = number
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 30) {
      var %v = local_number
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 31) {
      var %v = international_number
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 32) {
      var %v = prefix
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 33) {
      var %v = countrycode
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 34) {
      var %v = countryname
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 35) {
      var %v = location
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 36) {
      var %v = carrier
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 37) {
      var %v = type
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
  if (% [ $+ [ $mod ] $+ ] _show == $null) { set % $+ $mod $+ _show number local_number international_number prefix countrycode countryname location carrier type }
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
    if (!$2) { .timer -h 1 0 %action ( $++ $wmm_bold($me) $++ ): $lang(37) - $lang(38) $wmm_bold($1 $chr(91) $+ $wmm_under($lang(59)) $+ $chr(93) < $+ $wmm_under(+ $+ $lang(43)) $+ >) - ( $++ $lang(39) $+ 1: $wmm_bold($1 +306980000000) $+ ) - ( $++ $lang(39) $+ 2: $wmm_bold($1 GR 6980000000) $+ ) | return }
    if ($len($2) == 2) && (!$3) { .timer -h 1 0 %action ( $++ $wmm_bold($me) $++ ): $lang(37) - $lang(38) $wmm_bold($1 $chr(91) $+ $wmm_under($lang(59)) $+ $chr(93) < $+ $wmm_under(+ $+ $lang(43)) $+ >) - ( $++ $lang(39) $+ 1: $wmm_bold($1 +306980000000) $+ ) - ( $++ $lang(39) $+ 2: $wmm_bold($1 GR 6980000000) $+ ) | return }
    if ($len($2) == 2) && (!$istok($codes,$2,44)) { .timer -h 1 0 %action ( $++ $wmm_bold($me) $++ ): $lang(45) - $lang(20) $qt($wmm_bold($2)) $lower($lang(59)) $lang(50) | return }
    if ($len($2) == 2) && ($3 !isnum) { .timer -h 1 0 %action ( $++ $wmm_bold($me) $++ ): $lang(45) - $lang(20) $qt($wmm_bold($3)) $lang(52) | return }
    if ($len($2) !== 2) && ($2 !isnum) { .timer -h 1 0 %action ( $++ $wmm_bold($me) $++ ): $lang(45) - $lang(20) $qt($wmm_bold($2)) $lang(52) | return }
    if ($len($2) !== 2) && ($left($2,1) !== $chr(43)) { .timer -h 1 0 %action ( $++ $wmm_bold($me) $++ ): $lang(45) - $lang(51) | return }
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
    if (!$2) { %action ( $++ $wmm_bold($nick) $++ ): $lang(37) - $lang(38) $wmm_bold($1 $chr(91) $+ $wmm_under($lang(59)) $+ $chr(93) < $+ $wmm_under(+ $+ $lang(43)) $+ >) - ( $++ $lang(39) $+ 1: $wmm_bold($1 +306980000000) $+ ) - ( $++ $lang(39) $+ 2: $wmm_bold($1 GR 6980000000) $+ ) | return }
    if ($len($2) == 2) && (!$3) { %action ( $++ $wmm_bold($nick) $++ ): $lang(37) - $lang(38) $wmm_bold($1 $chr(91) $+ $wmm_under($lang(59)) $+ $chr(93) < $+ $wmm_under(+ $+ $lang(43)) $+ >) - ( $++ $lang(39) $+ 1: $wmm_bold($1 +306980000000) $+ ) - ( $++ $lang(39) $+ 2: $wmm_bold($1 GR 6980000000) $+ ) | return }
    if ($len($2) == 2) && (!$istok($codes,$2,44)) { %action ( $++ $wmm_bold($nick) $++ ): $lang(45) - $lang(20) $qt($wmm_bold($2)) $lower($lang(59)) $lang(50) | return }
    if ($len($2) == 2) && ($3 !isnum) { %action ( $++ $wmm_bold($nick) $++ ): $lang(45) - $lang(20) $qt($wmm_bold($3)) $lang(52) | return }
    if ($len($2) !== 2) && ($2 !isnum) { %action ( $++ $wmm_bold($nick) $++ ): $lang(45) - $lang(20) $qt($wmm_bold($2)) $lang(52) | return }
    if ($len($2) !== 2) && ($left($2,1) !== $chr(43)) { %action ( $++ $wmm_bold($nick) $++ ): $lang(45) - $lang(51) | return }
    $mod $+ _ $+ $replace($addon,$chr(45),$chr(95)) $nick $chan $gettok(%action,1,32) $2-
  }

  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

; --- End of events ---

; --- Start of aliases ---

alias wpn_ver { return $right($gettok($read($script,n,6),3,32),3) }
alias wpn_crdate { return $remove($gettok($read($script,n,6),5,32),$chr(40),$chr(41)) }

alias -l mod { return wpn }
alias -l command { return phone }
alias -l manager { return $iif($isalias(wmm_ver),$wmm_ver,0) }
alias -l addon { return $gettok($read($script,n,5),3,32) }
alias -l countries { return Afghanistan,Albania,Algeria,American Samoa,Andorra,Angola,Argentina,Armenia,Aruba,Australia,Austria,Azerbaijan,Bahrain,Bangladesh,Belarus,Belgium,Belize,Benin,Bhutan,Bolivia,Bosnia and Herzegovina,Botswana,Brazil,British Indian Ocean Territory,Brunei,Bulgaria,Burkina Faso,Burma Myanmar,Burundi,Cambodia,Cameroon,Cape Verde,Central African Republic,Chad,Chile,China,Colombia,Comoros,Cook Islands,Costa Rica,Côte d'Ivoire,Croatia,Cuba,Cyprus,Czech Republic,Democratic Republic of Congo,Denmark,Djibouti,Ecuador,Egypt,El Salvador,Equatorial Guinea,Eritrea,Estonia,Ethiopia,Falkland Islands,Faroe Islands,Federated States of Micronesia,Fiji,Finland,France,French Guiana,French Polynesia,Gabon,Georgia,Germany,Ghana,Gibraltar,Greece,Greenland,Guadeloupe,Guatemala,Guinea,Guinea-Bissau,Guyana,Haiti,Honduras,Hong Kong,Hungary,Iceland,India,Indonesia,Iran,Iraq,Ireland,Israel,Italy,Japan,Jordan,Kazakhstan,Kenya,Kiribati,Kosovo,Kuwait,Kyrgyzstan,Laos,Latvia,Lebanon,Lesotho,Liberia,Libya,Liechtenstein,Lithuania,Luxembourg,Macau,Macedonia,Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Marshall Islands,Martinique,Mauritania,Mauritius,Mayotte,Mexico,Moldova,Monaco,Mongolia,Montenegro,Morocco,Mozambique,Namibia,Nauru,Nepal,Netherlands,Netherlands Antilles,New Caledonia,New Zealand,Nicaragua,Niger,Nigeria,Niue,Norfolk Island,North Korea,Norway,Oman,Pakistan,Palau,Palestine,Panama,Papua New Guinea,Paraguay,Peru,Philippines,Poland,Portugal,Qatar,Republic of the Congo,Romania,Rwanda,Saint Helena,Saint Pierre and Miquelon,Samoa,San Marino,São Tomé and Príncipe,Saudi Arabia,Senegal,Seychelles,Sierra Leone,Singapore,Slovakia,Slovenia,Solomon Islands,Somalia,South Africa,South Korea,Spain,Sri Lanka,Sudan,Suriname,Swaziland,Sweden,Switzerland,Syria,Taiwan,Tajikistan,Tanzania,Thailand,The Gambia,Timor-Leste,Togo,Tokelau,Tonga,Tunisia,Turkey,Turkmenistan,Tuvalu,Uganda,Ukraine,United Arab Emirates,United Kingdom,Uruguay,Uzbekistan,Vanuatu,Venezuela,Vietnam,Wallis and Futuna,Yemen,Zambia,Zimbabwe,Anguilla,Antigua,Barbados,Bermuda,British Virgin Islands,Canada,Cayman Islands,Dominica,Dominican Republic,Grenada,Guam,Jamaica,Montserrat,Northern Mariana Islands,Puerto Rico,Réunion,Russia,Saint Barthélemy,Saint Kitts and Nevis,Saint Martin,Saint Vincent and the Grenadines,Serbia,St. Lucia,The Bahamas,Trinidad and Tobago,Turks and Caicos Islands,United States,US Virgin Islands,Vatican City }
alias -l ncodes { return +93,+355,+213,+1,+376,+244,+54,+374,+297,+61,+43,+994,+973,+880,+375,+32,+501,+229,+975,+591,+387,+267,+55,+246,+673,+359,+226,+95,+257,+855,+237,+238,+236,+235,+56,+86,+57,+269,+682,+506,+225,+385,+53,+357,+420,+243,+45,+253,+593,+20,+503,+240,+291,+372,+251,+500,+298,+691,+679,+358,+33,+594,+689,+241,+995,+49,+233,+350,+30,+299,+590,+502,+224,+245,+592,+509,+504,+852,+36,+354,+91,+62,+98,+964,+353,+972,+39,+81,+962,+7,+254,+686,+381,+965,+996,+856,+371,+961,+266,+231,+218,+423,+370,+352,+853,+389,+261,+265,+60,+960,+223,+356,+692,+596,+222,+230,+262,+52,+373,+377,+976,+382,+212,+258,+264,+674,+977,+31,+599,+687,+64,+505,+227,+234,+683,+672,+850,+47,+968,+92,+680,+970,+507,+675,+595,+51,+63,+48,+351,+974,+242,+40,+250,+290,+508,+685,+378,+239,+966,+221,+248,+232,+65,+421,+386,+677,+252,+27,+82,+34,+94,+249,+597,+268,+46,+41,+963,+886,+992,+255,+66,+220,+670,+228,+690,+676,+216,+90,+993,+688,+256,+380,+971,+44,+598,+998,+678,+58,+84,+681,+967,+260,+263,+1,+1,+1,+1,+1,+1,+1,+1,+1,+1,+1,+1,+1,+1,+1,+262,+7,+590,+1,+590,+1,+381,+1,+1,+1,+1,+1,+1,+39 }
alias -l codes { return AF,AL,DZ,AS,AD,AO,AR,AM,AW,AU,AT,AZ,BH,BD,BY,BE,BZ,BJ,BT,BO,BA,BW,BR,IO,BN,BG,BF,MM,BI,KH,CM,CV,CF,TD,CL,CN,CO,KM,CK,CR,CI,HR,CU,CY,CZ,CD,DK,DJ,EC,EG,SV,GQ,ER,EE,ET,FK,FO,FM,FJ,FI,FR,GF,PF,GA,GE,DE,GH,GI,GR,GL,GP,GT,GN,GW,GY,HT,HN,HK,HU,IS,IN,ID,IR,IQ,IE,IL,IT,JP,JO,KZ,KE,KI,XK,KW,KG,LA,LV,LB,LS,LR,LY,LI,LT,LU,MO,MK,MG,MW,MY,MV,ML,MT,MH,MQ,MR,MU,YT,MX,MD,MC,MN,ME,MA,MZ,NA,NR,NP,NL,AN,NC,NZ,NI,NE,NG,NU,NF,KP,NO,OM,PK,PW,PS,PA,PG,PY,PE,PH,PL,PT,QA,CG,RO,RW,SH,PM,WS,SM,ST,SA,SN,SC,SL,SG,SK,SI,SB,SO,ZA,KR,ES,LK,SD,SR,SZ,SE,CH,SY,TW,TJ,TZ,TH,GM,TL,TG,TK,TO,TN,TR,TM,TV,UG,UA,AE,GB,UY,UZ,VU,VE,VN,WF,YE,ZM,ZW,AI,AG,BB,BM,VG,CA,KY,DM,DO,GD,GU,JM,MS,MP,PR,RE,RU,BL,KN,MF,VC,RS,LC,BS,TT,TC,US,VI,VA }
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

alias wpn_sets { 
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

alias -l wpn_sets_reopen {
  var %i = $scriptdir $+ $mod $+ _main.ico
  var %l = $scriptdir $+ $mod $+ _lang.ini
  var %n = $wmm_dir $+ donate.png
  if (!$file(%l)) || (!$file(%i)) || (!$file(%n)) { wmm_input error 60 FATAL ERROR! @newline@ @newline@ $+ Error Code: 0xm001 | return }
  $mod $+ _sets
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

alias wpn_phonenumber_checker {
  if (!$wmm_internet) || (!$1-) || (!$wmm_apikey($addon)) { return }
  if (msg isin $3) { var %output = $3 $2 }
  elseif (notice isin $3) { var %output = $3 $1 }
  if (!% [ $+ [ $mod ] $+ ] _show) { set % $+ $mod $+ _show international_number countrycode }
  var %v = phone_ $+ $wmm_random

  if ($4 !isnum) && ($5) && ($left($5,1) !== $chr(43)) { var %ph = $gettok($ncodes,$findtok($codes,$4,1,44),44) $+ $5 }

  jsonopen -ud %v http://apilayer.net/api/validate?access_key= $+ $wmm_apikey($addon) $+ &format=1&number= $+ $iif(%ph,$v1,$4)
  if ($jsonerror) { var %m = ( $+ $wmm_bold($1) $+ ): $lang(40) - ( $+ $lang(41) $wmm_bold($jsonerror) $+ ) | %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%m),%m) | return }

  var %error = $json(%v,valid).value
  if (!%error) { var %m = ( $+ $wmm_bold($1) $+ ): $lang(42) | %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%m),%m) | return }

  if ($istok(% [ $+ [ $mod ] $+ ] _show,number,32)) { var %number = $json(%v,number).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,local_number,32)) { var %local = $json(%v,local_format).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,international_number,32)) { var %international = $json(%v,international_format).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,prefix,32)) { var %prefix = $json(%v,country_prefix).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,countrycode,32)) { var %countrycode = $json(%v,country_code).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,countryname,32)) { var %countryname = $json(%v,country_name).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,location,32)) { var %location = $json(%v,location).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,carrier,32)) { var %carrier = $json(%v,carrier).value }
  if ($istok(% [ $+ [ $mod ] $+ ] _show,type,32)) { var %type = $json(%v,line_type).value }

  var %msg = 9,2 $+ $gettok($addon,1,45) $+ -0,14 $+ $gettok($addon,2,45) $+ : $wmm_bel $iif(%number,$wmm_bold($lang(43)) $+ :6 %number $+ ) $iif(%local,$wmm_sep $wmm_bold($lang(44)) $+ :2 %local $+ ) $iif(%international,$wmm_sep $wmm_bold($lang(57)) $+ :5 %international $+ ) $iif(%prefix,$wmm_sep $wmm_bold($lang(58)) $+ :7 %prefix $+ ) $iif(%countrycode,$wmm_sep $wmm_bold($lang(59)) $+ :13 %countrycode $+ ) $iif(%countryname,$wmm_sep $wmm_bold($lang(60)) $+ :12 %countryname $+ ) $iif(%location,$wmm_sep $wmm_bold($lang(61)) $+ :3 %location $+ ) $iif(%carrier,$wmm_sep $wmm_bold($lang(62)) $+ :10 %carrier $+ ) $iif(%type,$wmm_sep $wmm_bold($lang(63)) $+ :4 %type $+ )
  %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%msg),%msg)

  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

; --- End of aliases ---

; --- Start of menus ---

#wpn_menu_menubar off
menu menubar { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wpn_menu_menubar end
#wpn_menu_status off
menu status { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wpn_menu_status end
#wpn_menu_channel off
menu channel { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wpn_menu_channel end
#wpn_menu_nicklist off
menu nicklist { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wpn_menu_nicklist end
#wpn_menu_query off
menu query { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wpn_menu_query end

; --- End of menus ---

; --- Start of groups ---

#phonenumber-checker off
#phonenumber-checker end

; --- End of groups ---

; ------------------------------------------------------------------------------ WPN EOF ------------------------------------------------------------------------------