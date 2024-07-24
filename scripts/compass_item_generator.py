import json

with open('compass_template.json') as f:
    data = json.load(f)
    for i in range(32):  
      data["minecraft:item"]["description"]["identifier"] = "jayly:compass_" + str(i)
      data["minecraft:item"]["components"]["minecraft:icon"]["textures"]["default"] = "compass_" + str(i)
      with open('compass_' + str(i) + '.json', 'w') as outfile:
          json.dump(data, outfile, indent=2)
