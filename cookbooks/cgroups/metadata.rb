maintainer       "Dusty Hall"
maintainer_email "draper7@gmail.com"
license          "All rights reserved"
description      "Install / Setup Control Groups"
version          "0.1.0"

recipe           "cgroups", "Installs and creates control groups."

%w{ubuntu debian}.each do |os|
  supports os
end
