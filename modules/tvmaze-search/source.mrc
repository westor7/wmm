/*

#########################################

	 #     TVMaze-Search     #
	  # v1.1 - (14/10/2018) #
	   # Thanks Supporters #

#########################################

*/

; --- Start of dialogs ---

dialog -l wtv_sets {
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
  combo 19, 4 60 63 57, tab 13 size drop
  text "Language:", 20, 4 50 63 8, tab 13 center
  text "Max Search Results:", 27, 4 40 126 8, tab 13
  edit "", 28, 130 39 18 9, tab 13 limit 1 center
  check "Enable", 12, 2 141 54 10
  text "", 21, 301 144 22 8, center disable
  check "Show the 'Title' information", 29, 190 18 125 10, tab 13
  check "Show the 'Description' information", 30, 190 28 125 10, tab 13
  check "Show the 'Language' information", 31, 190 38 125 10, tab 13
  check "Show the 'Genre' information", 32, 190 48 125 10, tab 13
  check "Show the 'Status", 33, 190 58 125 10, tab 13
  check "Show the 'Schedule' information", 34, 190 68 125 10, tab 13
  check "Show the 'Premiere' information", 35, 190 78 125 10, tab 13
  check "Show the 'Website' information", 36, 190 88 125 10, tab 13
  check "Show the 'Rating' information", 38, 190 98 125 10, tab 13
  check "Show the 'Network' information", 39, 190 108 125 10, tab 13
  check "Show the 'Country Name' information", 40, 4 73 125 10, tab 13
  check "Show the 'Prev. Episode' information", 41, 4 83 125 10, tab 13
  check "Show the 'Next Episode' information", 42, 4 93 125 10, tab 13
  check "Show the 'Type' information", 43, 4 103 125 10, tab 13
  check "Show the 'Link' information", 440, 4 113 125 10, tab 13
  tab "Settings 3", 45
  check "Show color/bold/underline in informations", 52, 4 50 170 10, tab 45
  text "Max 'Description' information characters", 46, 4 30 175 8, tab 45
  edit "", 47, 185 29 18 9, tab 45 limit 3 center
  text "Max 'Name' information characters", 460, 4 20 175 8, tab 45
  edit "", 470, 185 19 18 9, tab 45 limit 3 center
  check "Allow all output links to be shorten", 520, 185 50 137 10, tab 45
  check "Display the module output messages", 620, 185 60 137 10, tab 45
  check "Display the 'menubar' module menu", 54, 4 70 200 10, tab 45
  check "Display the 'status' module menu", 55, 4 80 200 10, tab 45
  check "Display the 'channel' module menu", 56, 4 90 200 10, tab 45
  check "Display the 'query' module menu", 57, 4 100 200 10, tab 45
  check "Display the 'nicklist' module menu", 58, 4 110 200 10, tab 45
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

ON *:DIALOG:wtv_sets:*:*: {
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
    did -ra $dname 27 $lang(19)

    did -o $dname 22 $lang(14)
    did -o $dname 23 $lang(15)
    did -o $dname 24 $lang(16)
    did -o $dname 25 $lang(17)
    did -o $dname 26 $lang(18)

    did -ra $dname 29 $lang(47) $qt($lang(43)) $lang(48)
    did -ra $dname 30 $lang(47) $qt($lang(44)) $lang(48)
    did -ra $dname 31 $lang(47) $qt($lang(45)) $lang(48)
    did -ra $dname 32 $lang(47) $qt($lang(50)) $lang(48)
    did -ra $dname 33 $lang(47) $qt($lang(52)) $lang(48)
    did -ra $dname 34 $lang(47) $qt($lang(53)) $lang(48)
    did -ra $dname 35 $lang(47) $qt($lang(54)) $lang(48)
    did -ra $dname 36 $lang(47) $qt($lang(55)) $lang(48)
    did -ra $dname 38 $lang(47) $qt($lang(56)) $lang(48)
    did -ra $dname 39 $lang(47) $qt($lang(57)) $lang(48)
    did -ra $dname 40 $lang(47) $qt($lang(59)) $lang(48)
    did -ra $dname 41 $lang(47) $qt($lang(61)) $lang(48)
    did -ra $dname 42 $lang(47) $qt($lang(65)) $lang(48)
    did -ra $dname 43 $lang(47) $qt($lang(62)) $lang(48)
    did -ra $dname 440 $lang(47) $qt($lang(58)) $lang(48)

    did -ra $dname 45 $lang(4) 3
    did -ra $dname 52 $lang(66)
    did -ra $dname 46 $lang(63) $qt($lang(44)) $lang(64)
    did -ra $dname 460 $lang(63) $qt($lang(43)) $lang(64)

    did -ra $dname 54 $lang(68) $qt(menubar) $lang(69)
    did -ra $dname 55 $lang(68) $qt(status) $lang(69)
    did -ra $dname 56 $lang(68) $qt(channel) $lang(69)
    did -ra $dname 57 $lang(68) $qt(query) $lang(69)
    did -ra $dname 58 $lang(68) $qt(nicklist) $lang(69)
    did -ra $dname 520 $lang(49)
    did -ra $dname 620 $lang(51)

    if ($group(# [ $+ [ $mod ] $+ ] _menu_menubar) == on) { did -c $dname 54 }
    if ($group(# [ $+ [ $mod ] $+ ] _menu_status) == on) { did -c $dname 55 }
    if ($group(# [ $+ [ $mod ] $+ ] _menu_channel) == on) { did -c $dname 56 }
    if ($group(# [ $+ [ $mod ] $+ ] _menu_query) == on) { did -c $dname 57 }
    if ($group(# [ $+ [ $mod ] $+ ] _menu_nicklist) == on) { did -c $dname 58 }

    if ($istok(% [ $+ [ $mod ] $+ ] _show,title,32)) { did -c $dname 29 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,description,32)) { did -c $dname 30 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,language,32)) { did -c $dname 31 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,genre,32)) { did -c $dname 32 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,status,32)) { did -c $dname 33 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,schedule,32)) { did -c $dname 34 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,premiere,32)) { did -c $dname 35 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,site,32)) { did -c $dname 36 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,rating,32)) { did -c $dname 38 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,network,32)) { did -c $dname 39 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,country_name,32)) { did -c $dname 40 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,prev_episode,32)) { did -c $dname 41 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,next_episode,32)) { did -c $dname 42 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,type,32)) { did -c $dname 43 }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,link,32)) { did -c $dname 440 }

    if (% [ $+ [ $mod ] $+ ] _tiny) { did -c $dname 520 }
    if (% [ $+ [ $mod ] $+ ] _status) { did -c $dname 12 }
    ;  if (% [ $+ [ $mod ] $+ ] _show_empty) { did -c $dname 44 }
    if (% [ $+ [ $mod ] $+ ] _strip) { did -c $dname 52 }
    if (% [ $+ [ $mod ] $+ ] _output) { did -c $dname 620 }

    if (% [ $+ [ $mod ] $+ ] _prefix_chan) { did -ra $dname 10 % [ $+ [ $mod ] $+ ] _prefix_chan }
    if (% [ $+ [ $mod ] $+ ] _prefix_nick) { did -ra $dname 5 % [ $+ [ $mod ] $+ ] _prefix_nick }

    if (% [ $+ [ $mod ] $+ ] _title_chars_max) { did -ra $dname 470 % [ $+ [ $mod ] $+ ] _title_chars_max }
    if (% [ $+ [ $mod ] $+ ] _desc_chars_max) { did -ra $dname 47 % [ $+ [ $mod ] $+ ] _desc_chars_max }
    if (% [ $+ [ $mod ] $+ ] _max_results) { did -ra $dname 28 % [ $+ [ $mod ] $+ ] _max_results }

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
    if (!% [ $+ [ $mod ] $+ ] _show) { set % $+ $mod $+ _show title link }
    if (!$did(5)) || ($did(5) isalnum) { set % $+ $mod $+ _prefix_chan @ }
    if (!$did(10)) || ($did(10) isalnum) { set % $+ $mod $+ _prefix_nick ! }
    if (!$did(28)) || (!$wmm_isdigit($did(28))) || ($did(28) > 9) { set % $+ $mod $+ _max_results 3 }
    if (!$did(47)) || (!$wmm_isdigit($did(47))) || ($did(47) > 300) { set % $+ $mod $+ _desc_chars_max 50 }
    if (!$did(470)) || (!$wmm_isdigit($did(470))) || ($did(470) > 300) { set % $+ $mod $+ _title_chars_max 100 }
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
    if ($did == 28) {
      if ($did($did).text) { set % $+ $mod $+ _max_results $v1 }
      else { unset % $+ $mod $+ _max_results }
    }
    if ($did == 47) {
      if ($did($did).text) { set % $+ $mod $+ _desc_chars_max $v1 }
      else { unset % $+ $mod $+ _desc_chars_max }
    }
    if ($did == 470) {
      if ($did($did).text) { set % $+ $mod $+ _title_chars_max $v1 }
      else { unset % $+ $mod $+ _title_chars_max }
    }
  }
  if ($devent == sclick) {
    if ($did == 280) { url $wmm_donate }
    if ($did == 29) {
      var %v = title
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 30) {
      var %v = description
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 31) {
      var %v = language
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 32) {
      var %v = genre
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 33) {
      var %v = status
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 34) {
      var %v = schedule
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 35) {
      var %v = premiere
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 36) {
      var %v = site
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 38) {
      var %v = rating
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 39) {
      var %v = network
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 40) {
      var %v = country_name
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 41) {
      var %v = prev_episode
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 42) {
      var %v = next_episode
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 43) {
      var %v = type
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 440) {
      var %v = link
      if (!$istok(% [ $+ [ $mod ] $+ ] _show,%v,32)) { set % $+ $mod $+ _show $addtok(% [ $+ [ $mod ] $+ ] _show,%v,32) }
      else { set % $+ $mod $+ _show $remtok(% [ $+ [ $mod ] $+ ] _show,%v,1,32) }
    }
    if ($did == 620) {
      if (!% [ $+ [ $mod ] $+ ] _output) { set % $+ $mod $+ _output 1 }
      else { set % $+ $mod $+ _output 0 }
    }
    if ($did == 520) {
      if (!% [ $+ [ $mod ] $+ ] _tiny) { set % $+ $mod $+ _tiny 1 }
      else { set % $+ $mod $+ _tiny 0 }
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
  if (% [ $+ [ $mod ] $+ ] _tiny == $null) { set % $+ $mod $+ _tiny 1 }
  if (% [ $+ [ $mod ] $+ ] _strip == $null) { set % $+ $mod $+ _strip 0 }
  if (% [ $+ [ $mod ] $+ ] _output == $null) { set % $+ $mod $+ _output 0 }
  if (% [ $+ [ $mod ] $+ ] _lang == $null) { set % $+ $mod $+ _lang English }
  if (% [ $+ [ $mod ] $+ ] _max_results == $null) { set % $+ $mod $+ _max_results 3 }
  if (% [ $+ [ $mod ] $+ ] _prefix_nick == $null) { set % $+ $mod $+ _prefix_nick ! }
  if (% [ $+ [ $mod ] $+ ] _prefix_chan == $null) { set % $+ $mod $+ _prefix_chan @ }
  if (% [ $+ [ $mod ] $+ ] _title_chars_max == $null) { set % $+ $mod $+ _title_chars_max 100 }
  if (% [ $+ [ $mod ] $+ ] _desc_chars_max == $null) { set % $+ $mod $+ _desc_chars_max 50 }
  if (% [ $+ [ $mod ] $+ ] _show == $null) { set % $+ $mod $+ _show link title type network rating site schedule status genre language description }
  hfree -w $mod $+ _*
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
    if (!$2) { .timer -h 1 0 %action ( $++ $wmm_bold($me) $++ ): $lang(37) - $lang(38) $wmm_bold($1 < $+ $wmm_under($lang(46)) $+ >) - ( $++ $lang(39) $wmm_bold($1 $wmm_under(westworld)) $+ ) | return }
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
    if (!$2) { %action ( $++ $wmm_bold($nick) $++ ): $lang(37) - $lang(38) $wmm_bold($1 < $+ $wmm_under($lang(46)) $+ >) - ( $++ $lang(39) $wmm_bold($1 $wmm_under(westworld)) $+ ) | return }
    $mod $+ _ $+ $replace($addon,$chr(45),$chr(95)) $nick $chan $gettok(%action,1,32) $2-
  }

  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

; --- End of events ---

; --- Start of aliases ---

alias wtv_ver { return $right($gettok($read($script,n,6),3,32),3) }
alias wtv_crdate { return $remove($gettok($read($script,n,6),5,32),$chr(40),$chr(41)) }

alias -l mod { return wtv }
alias -l command { return tvmaze }
alias -l manager { return $iif($isalias(wmm_ver),$wmm_ver,0) }
alias -l addon { return $gettok($read($script,n,5),3,32) }
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

alias wtv_sets { 
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

alias -l wtv_sets_reopen {
  var %i = $scriptdir $+ $mod $+ _main.ico
  var %l = $scriptdir $+ $mod $+ _lang.ini
  var %n = $wmm_dir $+ donate.png
  if (!$file(%l)) || (!$file(%i)) || (!$file(%n)) { wmm_input error 60 FATAL ERROR! @newline@ @newline@ $+ Error Code: 0xm001 | return }
  $mod $+ _sets
  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

alias wtv_tvmaze_search {
  if (!$wmm_internet) || (!$1-) { return }
  if (msg isin $3) { var %output = $3 $2 }
  elseif (notice isin $3) { var %output = $3 $1 }
  if (!% [ $+ [ $mod ] $+ ] _show) { set % $+ $mod $+ _show title link }
  if (!% [ $+ [ $mod ] $+ ] _max_results) || (!$wmm_isdigit(% [ $+ [ $mod ] $+ ] _max_results)) || (% [ $+ [ $mod ] $+ ] _max_results > 9) { set % $+ $mod $+ _max_results 3 }
  if (!% [ $+ [ $mod ] $+ ] _desc_chars_max) || (!$wmm_isdigit(% [ $+ [ $mod ] $+ ] _desc_chars_max)) || (% [ $+ [ $mod ] $+ ] _desc_chars_max > 300) { set % $+ $mod $+ _desc_chars_max 50 }
  if (!% [ $+ [ $mod ] $+ ] _title_chars_max) || (!$wmm_isdigit(% [ $+ [ $mod ] $+ ] _title_chars_max)) || (% [ $+ [ $mod ] $+ ] _title_chars_max > 300) { set % $+ $mod $+ _title_chars_max 100 }

  var %v = tvmaze_ $+ $wmm_random
  jsonopen -ud %v https://api.tvmaze.com/search/shows?q= $+ $wmm_urlencode($4-)
  if ($jsonerror) { var %m = ( $+ $wmm_bold($1) $+ ): $lang(70) - ( $+ $lang(41) $wmm_bold($jsonerror) $+ ) | %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%m),%m) | return }

  var %tot = $json(%v).length
  if (!%tot) { var %m = ( $+ $wmm_bold($1) $+ ): $lang(42) | %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%m),%m) | return }

  var %x = 0
  while (%x < % [ $+ [ $mod ] $+ ] _max_results) {
    var %id = $json(%v,%x,show,id).value
    if (!%id) { goto next }
    var %total = $calc(%total +1)

    if ($istok(% [ $+ [ $mod ] $+ ] _show,language,32)) { var %lang = $json(%v,%x,show,language).value }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,status,32)) { var %status = $json(%v,%x,show,status).value }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,premiere,32)) { var %premiere = $json(%v,%x,show,premiered).value }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,rating,32)) { var %rating = $json(%v,%x,show,rating,average).value }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,network,32)) { var %network = $json(%v,%x,show,network,name).value }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,country_name,32)) { var %country = $json(%v,%x,show,network,country,name).value }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,type,32)) { var %type = $json(%v,%x,show,type).value }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,site,32)) { 
      var %site = $json(%v,%x,show,officialSite).value
      if (% [ $+ [ $mod ] $+ ] _tiny) { var %site = $wmm_tinycom(%site) }
    }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,title,32)) { 
      var %title = $json(%v,%x,show,name).value 
      if (%title) && ($len(%title) >= % [ $+ [ $mod ] $+ ] _title_chars_max) { var %title = $left(%title,$calc(% [ $+ [ $mod ] $+ ] _title_chars_max -3)) $++ ... }
    }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,description,32)) { 
      var %desc = $wmm_html2asc($wmm_nohtml($json(%v,%x,show,summary).value))
      if (%desc) && ($len(%desc) >= % [ $+ [ $mod ] $+ ] _desc_chars_max) { var %desc = $left(%desc,$calc(% [ $+ [ $mod ] $+ ] _desc_chars_max -3)) $++ ... }
    }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,prev_episode,32)) { 
      var %prev_episode = $json(%v,%x,show,_links,previousepisode,href).value
      if (% [ $+ [ $mod ] $+ ] _tiny) { var %prev_episode = $wmm_tinycom(%prev_episode) }
    }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,next_episode,32)) { 
      var %next_episode = $json(%v,%x,show,_links,nextepisode,href).value
      if (% [ $+ [ $mod ] $+ ] _tiny) { var %next_episode = $wmm_tinycom(%next_episode) }
    }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,link,32)) { 
      var %url = $json(%v,%x,show,url).value
      if (% [ $+ [ $mod ] $+ ] _tiny) { var %url = $wmm_tinycom(%url) }
    }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,schedule,32)) {
      unset %days_tot
      var %schedule_duration = $json(%v,%x,show,runtime).value
      var %schedule_time = $json(%v,%x,show,schedule,time).value

      var %td = $json(%v,%x,show,schedule,days).length
      var %n = 0
      while (%n <= %td) {
        var %d = $json(%v,%x,show,schedule,days,%n).value
        if (%d) { var %days_tot = $addtok(%days_tot,%d,44) }
        inc %n
      }

      if (!%days_tot) && (!%schedule_time) { unset %schedule_duration }
      var %schedule = %days_tot $iif(%schedule_time,$lang(60) %schedule_time) $iif(%schedule_duration,$chr(40) $+ $v1 $lang(67) $+ $chr(41))
    }
    if ($istok(% [ $+ [ $mod ] $+ ] _show,genre,32)) {
      unset %genre_tot
      var %t = $json(%v,%x,show,genres).length
      var %z = 0
      while (%z <= %t) {
        var %g = $json(%v,%x,show,genres,%z).value
        if (%g) { var %genre_tot = $addtok(%genre_tot,%g,44) }
        inc %z
      }
      var %genre = %genre_tot
    }

    var %msg = 10,15 $+ $gettok($addon,1,45) $+ -0,14 $+ $gettok($addon,2,45) $+ : $wmm_bel $iif(%title,$wmm_bold($lang(43)) $+ :6 %title $+ ) $iif(%desc,$wmm_sep $wmm_bold($lang(44)) $+ :14 %desc $+ ) $iif(%lang,$wmm_sep $wmm_bold($lang(45)) $+ :13 %lang $+ ) $iif(%genre,$wmm_sep $wmm_bold($lang(50)) $+ :5 %genre $+ ) $iif(%status,$wmm_sep $wmm_bold($lang(52)) $+ :3 %status $+ ) $iif(%schedule,$wmm_sep $wmm_bold($lang(53)) $+ :7 %schedule $+ ) $iif(%premiere,$wmm_sep $wmm_bold($lang(54)) $+ :7 %premiere $+ ) $iif(%site,$wmm_sep $wmm_bold($lang(55)) $+ :12 $wmm_under(%site) $+ ) $iif(%rating,$wmm_sep $wmm_bold($lang(56)) $+ :3 %rating $+ ) $iif(%network,$wmm_sep $wmm_bold($lang(57)) $+ :9 %network $+ ) $iif(%country,$wmm_sep $wmm_bold($lang(59)) $+ :10 %country $+ ) $iif(%prev_episode,$wmm_sep $wmm_bold($lang(61)) $+ :12 $wmm_under(%prev_episode) $+ ) $iif(%next_episode,$wmm_sep $wmm_bold($lang(65)) $+ :12 $wmm_under(%next_episode) $+ ) $iif(%type,$wmm_sep $wmm_bold($lang(62)) $+ :4 %type $+ ) $iif(%url,$wmm_sep $wmm_bold($lang(58)) $+ :12 $wmm_under(%url) $+ )
    %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%msg),%msg)

    :next
    inc %x
  }
  if (!%total) { var %m = ( $+ $wmm_bold($1) $+ ): $lang(42) | %output $iif(% [ $+ [ $mod ] $+ ] _strip,$strip(%m),%m) }

  return
  :error | wmm_werror $addon $scriptline $error | reseterror
}

; --- End of aliases ---

; --- Start of menus ---

#wtv_menu_menubar off
menu menubar { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wtv_menu_menubar end
#wtv_menu_status off
menu status { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wtv_menu_status end
#wtv_menu_channel off
menu channel { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wtv_menu_channel end
#wtv_menu_nicklist off
menu nicklist { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wtv_menu_nicklist end
#wtv_menu_query off
menu query { 
  -
  $iif($isalias(wmm_isadi) && $wmm_isadi && $file($scriptdir $+ $mod $+ _main.ico),$menuicon($scriptdir $+ $mod $+ _main.ico)) $iif($dialog( [ $+ [ $mod ] $+ ] _sets),$style(1)) $iif($isalias(wmm_qd),$wmm_qd($addon v $+ $ [ $+ [ $mod ] $+ ] _ver - $iif($lang(4),$v1,Settings) $+ ),* $addon v $+ $ [ $+ [ $mod ] $+ ] _ver - Settings *): $+ $mod $+ _sets
  -
}
#wtv_menu_query end

; --- End of menus ---

; -- Start of groups ---

#tvmaze-search off
#tvmaze-search end

; -- End of groups ---

; ------------------------------------------------------------------------------ WTV EOF ------------------------------------------------------------------------------