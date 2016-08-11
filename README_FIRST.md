Fork of the original Crepe repository, adapted to the DSL 2016 task 2:
http://ttg.uni-saarland.de/vardial2016/dsl2016.html

Consult the original README for instructions.

This fork includes the following:
* The DSL 2016 data, slightly cleaned, and split into train/dev sets, saved in `.t7b` format. Also included are csv versions and a labels file, with original labels corresponding to indexes that are used in Crepe.
* Modified alphabet in `config.lua` for the Buckwalter scheme in the DSL 2016 task 2. 
* Modified `data.lua` so that texts are not lower-cased, since we're working with the Buckwalter scheme.
* Modified the network topology in `config.lua`. This needs to be improved.
* Added code for writing out predictions:
```lua
th write_predictions -main_record record_file.t7b
```
where `record_file.t7b` is a saved record produced during training. 
