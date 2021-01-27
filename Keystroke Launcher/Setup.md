https://keypirinha.com/download.html

Import settings in this folder. Change the paths where necessary
Keypirinha packages:
- ColorPicker
- Cvt (Conversion of data)
- Dictionary
- EasySearch
- Emojii
- FakerData (fake data for names etc)
- Lipsum (Lorem ipsum)
- PackageControl (Like NuGet)
- SystemCommands (shutdown etc)
- WindowsApps (not sure)
- MyIP
- Todo markdown
- Counter (my own Git)

Extensions to create!
- GIPHY searcher
    WIP. Needs to clear cache, and not have so many errors 😅
- Folder-bookmarks, to get used to python and the plugin tool
    Setup in custom txt-db, translations of folders to open in explorer
- Meme creator (if possible)
- Spotify controller
- Password generator

Know how for KP:
- Indlæs fra .ini-fil:
 self.load_settings()
 Indlæser helloworld.ini
 settings.get_bool("keep_history", "main", self.DEFAULT_KEEP_HISTORY)
 under "main" i helloworld.ini, find værdien "keep_history" og skriv på self.DEFAULT_KEEP_HISTORY

- on_start(self):
  called after install

- on_catalog(self):
  called after install, refresh and selecting an item

  self.set_catalog([self.create_item(
            category=kp.ItemCategory.KEYWORD,
            label="HelloWorld", <-- the label to show
            short_desc="Hello World", <-- the description
            target="hello", <-- what to write
            args_hint=kp.ItemArgsHint.REQUIRED,
            hit_hint=kp.ItemHitHint.NOARGS
        )])

- on_suggest(self):
  called on every keypress - globally!