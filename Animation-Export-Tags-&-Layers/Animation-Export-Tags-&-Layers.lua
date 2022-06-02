-- Export each tag into a different sprite sheet

function exportLayerAndTag(tempLayer, tempTag, tempColumnNumbers, tempFileName)
    app.command.ExportSpriteSheet{ 
		ui=false,						
		type=SpriteSheetType.Rows,  	-- Change this if you want to change how the exported sprite is displayed.
		columns=tempColumnNumbers,    	-- Use one of these options(HORIZONTAL, VERTICAL, ROWS, COLUMNS, PACKED)
		rows=tempColumnNumbers,			-- You can learn more here
		bestFit=false;					--https://github.com/aseprite/api/blob/main/api/command/ExportSpriteSheet.md#exportspritesheet
		textureFilename=tempFileName .. '.png',
		-- dataFilename=fn .. '.json',
		dataFormat=SpriteSheetDataFormat.JSON_ARRAY,
	    borderPadding=0,
		shapePadding=0,
		innerPadding=0,
		trimSprite=false,
		trim=false,
		trimByGrid=false,
		extrude=false,
		ignoreEmpty=false,
		mergeDuplicates=false, 			-- Set this to true if you want to merge duplicates.
		openGenerated=false,
		layer=tempLayer.name,
		tag=tempTag.name,
		splitLayers=false,
		splitTags=false,
		listLayers=false,
		listTags=false,
		listSlices=false,
	}
end

function checkIfDuplicate(tempLayers, tempTags, tempPath)
	for i,tag in ipairs(tempTags) do
	  for j, layer in ipairs(tempLayers) do
		if layer.layers ~= nil then --if layer is a group then loop through all layers in it.
			for k, groupedLayer in ipairs(layer.layers) do
				fileName = tempPath .. layer.name .. typeOfLetterSpacing
					.. groupedLayer.name .. typeOfLetterSpacing .. tag.name
				return typeOfLetterSpacing .. fileName .. '.[png|json]'
			end
		else
		fileName = tempPath .. layer.name .. typeOfLetterSpacing .. tag.name
		return typeOfLetterSpacing .. fileName .. '.[png|json]'
		end
	  end
	end
end

function exportSpriteSheets(tempLayers, tempTags, tempPath)
	local numberOfColumns
	
	for i,tag in ipairs(tempTags) do
	  for j, layer in ipairs(tempLayers) do
		if layer.layers ~= nil then --if layer is a group then loop through all layers in it.
			for k, groupedLayer in ipairs(layer.layers) do
				--Remove or change the groupedLayer, layer and tag name to how you want it.
				--!!!Besure to also change the fileName in the checkIfDuplicate function.
				fileName = tempPath .. '/' .. groupedLayer.name
					.. typeOfLetterSpacing .. layer.name .. typeOfLetterSpacing .. tag.name
				numberOfColumns = math.ceil(math.sqrt(tag.frames))
				exportLayerAndTag(layer, tag, numberOfColumns, fileName)
			end
		else
			fileName = tempPath .. '/' .. layer.name .. typeOfLetterSpacing .. tag.name
			numberOfColumns = math.ceil(math.sqrt(tag.frames))
			exportLayerAndTag(layer, tag, numberOfColumns, fileName)
		end
	  end
	end
end


---start of program

local spr = app.activeSprite
if not spr then return print('No active sprite') end

local path,title = spr.filename:match("^(.+[/\\])(.-).([^.]*)$")
local spriteLayers = spr.layers
local msg = { "Do you want to export/overwrite the following files?" }
fileName = nil


-- Change this value for what type of spacing you want between group,layer and tag names.
typeOfLetterSpacing = '_'


table.insert(msg, checkIfDuplicate(spriteLayers, spr.tags, path))

if app.alert{ title="Export Sprite Sheets", text=msg,
              buttons={ "&Yes", "&No" } } ~= 1 then
  return
end

exportSpriteSheets(spriteLayers, spr.tags, path)




