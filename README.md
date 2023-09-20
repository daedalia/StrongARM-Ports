# ARM Ports
Linux x86 games packaged for the RG552/OGU/RGB10 Max 3 on JELOS mainline. Thanks to [JohnnyonFlame](https://github.com/JohnnyonFlame) for his excellent work blazing the trail followed by the work here, without which, this repo would not exist.

## Games
| Game                                   | RG552   | S992X   | Platform | Packaged | Notes                                                                                                                                                                           |
|----------------------------------------|---------|---------|----------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A Short Hike                           | &check; | -       | Box64    |          | Low fps 10-20                                                                                                                                                                   |
| Blasphemous                            | &check; | -       | Box64    |          | Loads to title, no input currently                                                                                                                                              |
| Broforce                               | &check; | -       | Box64    | &check;  | Broke with JELOS update                                                                                                                                                         |
| Dandara                                | &check; | -       | Box64    | &check;  |                                                                                                                                                                                 |
| Don't Starve                           | &check; | &cross; | Box64    | &check;  |                                                                                                                                                                                 |
| FEZ                                    | &check; | &check; | FNA      | &check;  | Investigate QoL patch for pre set scaling resolutions. Thanks to [jtothebell](https://github.com/jtothebell) for the patch to fix (https://github.com/jtothebell/port-packages) |
| Fluffy Horde                           | &check; | -       | Box64    |          | Loads to colour cycling screen, requires investigation                                                                                                                          |
| Hollow Knight                          | &check; | &cross; | Box64    |          | Can crash, 15fps                                                                                                                                                                |
| Huntdown                               | &check; | &cross; | Box64    | &check;  | Freezing in latest build of JELOS. Buttons are not correct.                                                                                                                     |
| Iconoclasts                            | -       | &cross; | Box64    |          | Fails on loading a level                                                                                                                                                        |
| If on a Winters Night, Four Travellers | &check; | -       | Box64    |          | Progress bar completes, crashes. try different version                                                                                                                          |
| Lilas Sky Ark                          | &check; | -       | Box64    |          | Very slow, 8fps                                                                                                                                                                 |
| Limbo                                  | &check; | -       | Box64    |          | Loads, crashes at random points                                                                                                                                                 |
| Locomotive                             | &check; | -       | Box64    |          | Runs well, controls assessment                                                                                                                                                  |
| Peridium                               | &check; | -       | Box64    |          | Runs, removal of a lib prevents the resolution selection displaying at start, remove last added. Different res can cause crash, 960x640 seems good.                             |
| Pixel Junk Shooter                     | &check; | -       | Box64    |          | Vertigo, sprites spin all the time. Speed seems good                                                                                                                            |
| Primal Light                           | &check; | -       | Box64    |          | Controls need to be adjusted, low fps, 20fps. Reducing the res to 1x, need to stretch to screen somehow                                                                         |
| Satryn                                 | &check; | -       | Box64    |          | Works well, minor stutter on fresh asset load                                                                                                                                   |
| Super Blood Hockey                     | -       | -       | FNA      |          |                                                                                                                                                                                 |
| Super Meat Boy                         | &check; | -       | Box64    | &check;  |                                                                                                                                                                                 |
| Swarm Racer                            | &check; | -       | Box64    |          | Works, on ES too, sort save location                                                                                                                                            |
| Sword and Sworcery                     | &cross; | -       | Box64    |          | Doesn't load, maybe humble version, probably too old                                                                                                                            |
| The Bug Butcher                        | -       | -       | Box64    |          |                                                                                                                                                                                 |
| The Diasporic Crypt                    | -       | -       | Box64    |          | No such file or directory, looks for lib                                                                                                                                        |
| The Powder Toy                         | -       | -       | Box64    |          |                                                                                                                                                                                 |
| VirtuaVerse                            | &check; | -       | Box64    |          | Controls need work and investigation                                                                                                                                            |


## To try
- Chroma Squad
- Downwell - Try with Wine
- Final Vendetta
- Runic Rampage
- Streets of Rage 4
- Neuro Voider
- Zombusters - Monogame
