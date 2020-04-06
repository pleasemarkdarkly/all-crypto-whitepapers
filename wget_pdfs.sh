#!/bin/bash

regex='\w++:[^"]++|(?<=\d\">)[^<]++'

whitepapers_test=(
    https://www.allcryptowhitepapers.com/Bitcoin-Whitepaper
    https://www.allcryptowhitepapers.com/Ethereum-Whitepaper
    https://www.allcryptowhitepapers.com/Ripple-Whitepaper
    https://www.allcryptowhitepapers.com/Litecoin-Whitepaper
    https://www.allcryptowhitepapers.com/BitcoinCash-Whitepaper
)

source ./allwhitepapersurls.list # array whitepapers
directory="www.allcryptowhitepapers.com/"

function get_url () {
    wget -r -l1 -A.pdf $1
}

for url in "${whitepapers[@]}"
do
    echo "${url}"
    get_url "${url}"
done

# move around and cleanup
cd "${directory}"
# count whitepapers
# find ./ -name "*.pdf" -o -name "*.PDF" | wc -l
find "/Users/mark.phillips/Developer/all-crypto-whitepapers/www.allcryptowhitepapers.com" -name "*.pdf" -o -name "*.PDF" -exec mv -v {} "/Users/mark.phillips/Developer/all-crypto-whitepapers/whitepapers/" \;

cd ../whitepapers
# make lower
for i in *; do mv "$i" "$(echo $i|tr A-Z a-z)"; done
echo "Total downloaded whitepapers: " `ls -al | wc -l`
cd ..

echo ${pwd}
echo rm -rf "${directory}"

