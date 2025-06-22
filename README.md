# bootstrap-icons-stream-deck

Bootstrap's Icon Library for Stream Deck.

## About

Bootstrap's Icon Library is finally on Stream Deck!

Discover "**Bootstrap Icons**", an extensive collection of 2000+ icons designed with a clean and minimalist style. This versatile assortment offers a wide range of symbols, perfect for professional and creative applications. Each icon has been meticulously crafted to ensure a modern yet timeless appearance. Whether for professional applications or creative endeavors, "**Bootstrap Icons**" brings an elegant, functional design to your creative world.

This repository uses the [bootstrap-icons](https://github.com/twbs/icons) repository.

Thanks to the [Bootstrap Authors](https://github.com/twbs) for working on this awesome icon pack!

## Installation

### Elgato Marketplace

This icon pack is now officially available on the [Elgato Marketplace](https://marketplace.elgato.com/product/bootstrap-icons-96919547-28ae-4843-81e1-ba0b9d113425) 🎉

### From Source

1. Clone this repository
2. Stop the Stream Deck Application
3. Copy the directory [`com.hope-it-works.bootstrap.sdIconPack`](./com.hope-it-works.bootstrap.sdIconPack/) to `%appdata%\Elgato\StreamDeck\IconPacks`
4. Start the Stream Deck Application, the icon pack should now appear:`<br>`
   ![Screenshot of Icon Pack](https://i.gyazo.com/f64d8c7b37ff2a933d3e2e8c2a974cb7.png)
5. Finished! 🎉

## Building

1. Clone this repository
2. Open PowerShell and `cd` to this repository
3. [Download this zip](https://docs.elgato.com/makers/stream-deck/icon-packs/packaging) and move "``DistributionTool.exe``" to the root of this repository.
4. Run [`update-icons.ps1`](./update-icons.ps1)
5. The directory [`com.hope-it-works.bootstrap.sdIconPack`](./com.hope-it-works.bootstrap.sdIconPack/) should now contain the updated icons and information
6. Finished! 🎉
