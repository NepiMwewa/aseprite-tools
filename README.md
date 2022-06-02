# aseprite-tools
Aseprite tools

Aseprite export script designed to export both layers and tags into their own PNGs. I enjoyed watching AdamCYounis' video https://www.youtube.com/watch?v=hiMBVCFMj6E. 
However I needed layers of my animations to be exported out as well as the tags for the game that I am working on. (basically I take layered sprites, merge them together and use that for my animations. This lets me have a lot of customization, easy to manage, add to, and there are not bug with going behind rocks, trees or buildings).
I was not able to find anything on the forums that met this need so I decided to make my own by expanding on the aseprite tool script here https://github.com/adamyounis/Aseprite-Tools/tree/main/Tags-To-Sheets.

This export tool also calculates the optimal amount of rows/columns to square off the final sprite PNGs. Such as 1x1, 2x2, 3x3, 4x4 sprites and so forth. This keeps the width or height from being in tens of thousands of pixels. It also does not merge duplicate sprites like packed does. If you need packed with merge or a different sprite layout, you can simple enable it on line 6.
Within the first function you can change various export options that you need for your specific case. Such as only horizontal sprite sheet instead of packed without merging. You can learn more about the options here https://github.com/aseprite/api/blob/main/api/command/ExportSpriteSheet.md#exportspritesheet.

Within the script you can change the order of the groups, layers and tags in the naming convention of the new sprite sheets when exporting the animated spritesheets. It is located on lines 71 and 74. It is based off from what you name the groups, layers, and tags. the spacing letter can easily be changed within the function on line 90.

Open the file that you want to export:
![1](https://user-images.githubusercontent.com/17126294/171528492-407cc994-bf04-40e4-99c7-1f9fcc80bf61.PNG)

Go to File>Scripts>Animation Export Groups, Layers & Tags>Export Animations.
![2](https://user-images.githubusercontent.com/17126294/171528497-f48d50e7-0138-4ffb-b9a2-0871090e4ec0.PNG)

See the results
![3](https://user-images.githubusercontent.com/17126294/171528504-3fd6271b-7a89-4998-8495-6ee85e94098e.PNG)

Hope this export script can be useful for others as well.
