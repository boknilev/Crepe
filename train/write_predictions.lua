-- write predictions from saved record

require("nn")
require("cutorch")
require("cunn")
require("gnuplot")

-- Local requires
require("data")
require("model")
require("train")
require("test")
require("mui")

-- Configurations
dofile("config.lua")

-- parse arguments
local cmd = torch.CmdLine()
cmd:option('-main_record', 'main.t7b', 'main record holding predictions')
local opt = cmd:parse(arg or {})


function write_predictions(predictions, filename)
   local pred_file = torch.DiskFile(filename, "w")
   for i, v in ipairs(predictions) do
      pred_file:writeString(v .. "\n")
   end
   pred_file:close()
end

-- load record
local main = torch.load(opt.main_record)
local cur_record, cur_train_predictions, cur_val_predictions
for i = 1,#main.record do 
   cur_record = main.record[i]
   cur_train_pred_file = opt.main_record:sub(1,-4) .. "predictions.train.era" .. i
   cur_val_pred_file = opt.main_record:sub(1,-4) .. "predictions.val.era" .. i
   write_predictions(cur_record.train_predictions, cur_train_pred_file)
   write_predictions(cur_record.val_predictions, cur_val_pred_file)
end

