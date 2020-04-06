# crypto whitepaper websites parser and pdf downloader

https://github.com/markedphillips/all-crypto-whitepapers/

Blockchain paper downloader. Have an appetite to read about blockchains? This will satisfy it hopefully.

### Development

The main file is ./wget_pdfs.sh. It basically uses a .list file of URLs for various blockchain/coins and downloads the associated PDFs, copies them into a whitepapers directory. The .list file was created by fetching websites with information about blockchains and using regex to parse out the links. There are some test files for a regex machine learning tool. Because writing regex is annoying.

This project was inspired by https://github.com/a-r-d/all-crypto-whitepapers (which had about 43 papers vs the 272 here), but instead of looping through a csv which had the name of the coin and link to the associated paper, I was super lazy. The idea of hunting for actual links to whitepaper pdfs was mind numbing, I thought the actually point to go to github was to find a tool to just get all of the papers, or at least the code to do it for me. This repo is a step closer to that idea.

So this code goes to sites purporting to have the whitepapers, it crawls the site and traverses ALL the links, when it finds a whitepaper, it saves it, otherwise it throws away the html file or whatever web file it found. The included code took about 28 hours on a 100MB/s connection crawling to search through 2419 whitepaper descriptions finally collecting 272 papers. The papers are included here, so you don't have to do the same work. This is the largest collection of whitepapers, I could find online, easilly accesible via 'git clone https://github.com/markedphillips/all-crypto-whitepapers'. I could have made this number larger by including the descriptions of the other blockchains but, those are whitepapers, are they?

### Todo

I could have renamed the files better to map to the purported name of the coin. I also could have OCR'd the files and exported a text file for those that need to search for common key ideas faster. Having a word list for vector encoding would be useful, and not hard to do at all. These are things I'll probably do later. Maybe.
