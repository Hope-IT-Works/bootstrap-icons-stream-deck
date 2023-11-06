# bootstrap-icons-stream-deck

unofficial open source SVG icon library from Bootstrap for Stream Deck.

## About

This repository uses the [bootstrap-icons](https://github.com/twbs/icons) repository.

Thanks to the Bootstrap Authors for working on this awesome icon pack!

## Installation

1. Clone this repository
2. Stop the Stream Deck Application
3. Copy the directory [`com.hope-it-works.bootstrap.sdIconPack`](./com.hope-it-works.bootstrap.sdIconPack/) to `%appdata%\Elgato\StreamDeck\IconPacks`
4. Start the Stream Deck Application, the icon pack should now appear:<br>
![Screenshot of Icon Pack](https://i.gyazo.com/f64d8c7b37ff2a933d3e2e8c2a974cb7.png)
5. Finished! 🎉

## Building

1. Clone this repository
2. Open PowerShell and `cd` to this repository
3. [Download this zip](https://docs.elgato.com/sdk/icon-packs/packaging#distribution-tool) and move "```DistributionTool.exe```" to the root of this repository.
4. Run [`update-icons.ps1`](./update-icons.ps1)
5. The directory [`com.hope-it-works.bootstrap.sdIconPack`](./com.hope-it-works.bootstrap.sdIconPack/) should now contain the updated icons and information
6. Finished! 🎉
