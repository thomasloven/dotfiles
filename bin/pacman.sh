#!/bin/sh

# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.

initializeANSI()
{
 esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"

  bblackf="${esc}[90m";   bredf="${esc}[91m";    bgreenf="${esc}[92m"
  byellowf="${esc}[93m"   bbluef="${esc}[94m";   bpurplef="${esc}[95m"
  bcyanf="${esc}[96m";    bwhitef="${esc}[97m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

clear 

initializeANSI

cat << EOF

 ${yellowf}  ▄███████▄${reset}   ${redf}  ▄██████▄${reset}    ${greenf}  ▄██████▄${reset}    ${bluef}  ▄██████▄${reset}    ${purplef}  ▄██████▄${reset}    ${cyanf}  ▄██████▄${reset}
 ${yellowf}▄█████████▀▀${reset}  ${redf}▄${whitef}█▀█${redf}██${whitef}█▀█${redf}██▄${reset}  ${greenf}▄${whitef}█▀█${greenf}██${whitef}█▀█${greenf}██▄${reset}  ${bluef}▄${whitef}█▀█${bluef}██${whitef}█▀█${bluef}██▄${reset}  ${purplef}▄${whitef}█▀█${purplef}██${whitef}█▀█${purplef}██▄${reset}  ${cyanf}▄${whitef}█▀█${cyanf}██${whitef}█▀█${cyanf}██▄${reset}
 ${yellowf}███████▀${reset}      ${redf}█${whitef}▄▄█${redf}██${whitef}▄▄█${redf}███${reset}  ${greenf}█${whitef}▄▄█${greenf}██${whitef}▄▄█${greenf}███${reset}  ${bluef}█${whitef}▄▄█${bluef}██${whitef}▄▄█${bluef}███${reset}  ${purplef}█${whitef}▄▄█${purplef}██${whitef}▄▄█${purplef}███${reset}  ${cyanf}█${whitef}▄▄█${cyanf}██${whitef}▄▄█${cyanf}███${reset}
 ${yellowf}███████▄${reset}      ${redf}████████████${reset}  ${greenf}████████████${reset}  ${bluef}████████████${reset}  ${purplef}████████████${reset}  ${cyanf}████████████${reset}
 ${yellowf}▀█████████▄▄${reset}  ${redf}██▀██▀▀██▀██${reset}  ${greenf}██▀██▀▀██▀██${reset}  ${bluef}██▀██▀▀██▀██${reset}  ${purplef}██▀██▀▀██▀██${reset}  ${cyanf}██▀██▀▀██▀██${reset}
 ${yellowf}  ▀███████▀${reset}   ${redf}▀   ▀  ▀   ▀${reset}  ${greenf}▀   ▀  ▀   ▀${reset}  ${bluef}▀   ▀  ▀   ▀${reset}  ${purplef}▀   ▀  ▀   ▀${reset}  ${cyanf}▀   ▀  ▀   ▀${reset}


 ${byellowf}  ▄███████▄${reset}   ${bredf}  ▄██████▄${reset}    ${bgreenf}  ▄██████▄${reset}    ${bbluef}  ▄██████▄${reset}    ${bpurplef}  ▄██████▄${reset}    ${bcyanf}  ▄██████▄${reset}
 ${byellowf}▄█████████▀▀${reset}  ${bredf}▄${whitef}█▀█${bredf}██${whitef}█▀█${bredf}██▄${reset}  ${bgreenf}▄${whitef}█▀█${bgreenf}██${whitef}█▀█${bgreenf}██▄${reset}  ${bbluef}▄${whitef}█▀█${bbluef}██${whitef}█▀█${bbluef}██▄${reset}  ${bpurplef}▄${whitef}█▀█${bpurplef}██${whitef}█▀█${bpurplef}██▄${reset}  ${bcyanf}▄${whitef}█▀█${bcyanf}██${whitef}█▀█${bcyanf}██▄${reset}
 ${byellowf}███████▀${reset}      ${bredf}█${whitef}▄▄█${bredf}██${whitef}▄▄█${bredf}███${reset}  ${bgreenf}█${whitef}▄▄█${bgreenf}██${whitef}▄▄█${bgreenf}███${reset}  ${bbluef}█${whitef}▄▄█${bbluef}██${whitef}▄▄█${bbluef}███${reset}  ${bpurplef}█${whitef}▄▄█${bpurplef}██${whitef}▄▄█${bpurplef}███${reset}  ${bcyanf}█${whitef}▄▄█${bcyanf}██${whitef}▄▄█${bcyanf}███${reset}
 ${byellowf}███████▄${reset}      ${bredf}████████████${reset}  ${bgreenf}████████████${reset}  ${bbluef}████████████${reset}  ${bpurplef}████████████${reset}  ${bcyanf}████████████${reset}
 ${byellowf}▀█████████▄▄${reset}  ${bredf}██▀██▀▀██▀██${reset}  ${bgreenf}██▀██▀▀██▀██${reset}  ${bbluef}██▀██▀▀██▀██${reset}  ${bpurplef}██▀██▀▀██▀██${reset}  ${bcyanf}██▀██▀▀██▀██${reset}
 ${byellowf}  ▀███████▀${reset}   ${bredf}▀   ▀  ▀   ▀${reset}  ${bgreenf}▀   ▀  ▀   ▀${reset}  ${bbluef}▀   ▀  ▀   ▀${reset}  ${bpurplef}▀   ▀  ▀   ▀${reset}  ${bcyanf}▀   ▀  ▀   ▀${reset}

EOF
