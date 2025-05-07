# MPD Statistics
This is just the initial state. There's a lot more coming

## Installation
Clone the repo and cd into it
```bash
git clone https://github.com/rd6260/mpd_stats
cd mpd_stats
```

Copy `mpd_playcount_tracker.sh` into your `~/.local/share/bin`
```bash
cp mpd_playcount_tracker.sh ~/.local/share/bin/
``` 

Now to start the program run this command 
```bash
hyprctl dispatch exec ~/.local/share/bin/mpd_playcount_tracker.sh
```

Put this in your hyprland config file for auto start
```bash
exec-once ~/.local/share/bin/mpd_playcount_tracker.sh
```


