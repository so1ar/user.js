#!/bin/sh

if ! [[ -d "$./custom-overrides" ]]; then
    mkdir custom-overrides
fi

# Download Peskyfox and Fastfox
wget https://raw.githubusercontent.com/yokoffing/Betterfox/refs/heads/main/Peskyfox.js -O custom-overrides/Peskyfox.js
wget https://raw.githubusercontent.com/yokoffing/Betterfox/refs/heads/main/Fastfox.js -O custom-overrides/Fastfox.js

# Download Arkenfox updater
wget https://raw.githubusercontent.com/arkenfox/user.js/refs/heads/master/updater.sh -O updater.sh

# Downlaod ujs2cfg script
wget https://gist.githubusercontent.com/SpacingBat3/d9b56e0ee88f7a7201e6a45f4858b5e0/raw/d37c1853333fb7448ecb7124671a40f792751cac/ujs2cfg.sh -O ujs2cfg.sh

# Link user-overrides.js
ln -sf $(pwd)/user-overrides.js $(pwd)/custom-overrides/user-overrides.js
ln -sf $(pwd)/Smoothfox.js $(pwd)/custom-overrides/Smoothfox.js

# Merge overrides
bash updater.sh -s -o custom-overrides

bash ujs2cfg.sh user.js > user.cfg
