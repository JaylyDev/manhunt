import { ItemLockMode, ItemStack } from "@minecraft/server";
import { Vector3Utils } from "./minecraft-math";

export const CompassItemTypes = [
  "jayly:compass_0",
  "jayly:compass_1",
  "jayly:compass_2",
  "jayly:compass_3",
  "jayly:compass_4",
  "jayly:compass_5",
  "jayly:compass_6",
  "jayly:compass_7",
  "jayly:compass_8",
  "jayly:compass_9",
  "jayly:compass_10",
  "jayly:compass_11",
  "jayly:compass_12",
  "jayly:compass_13",
  "jayly:compass_14",
  "jayly:compass_15",
  "jayly:compass_16",
  "jayly:compass_17",
  "jayly:compass_18",
  "jayly:compass_19",
  "jayly:compass_20",
  "jayly:compass_21",
  "jayly:compass_22",
  "jayly:compass_23",
  "jayly:compass_24",
  "jayly:compass_25",
  "jayly:compass_26",
  "jayly:compass_27",
  "jayly:compass_28",
  "jayly:compass_29",
  "jayly:compass_30",
  "jayly:compass_31",
];

/**
 * Get the compass item based on player's rotation and point location
 * @param {import("@minecraft/server").Vector2} rotation 
 * @param {import("@minecraft/server").Vector3} location 
 * @param {import("@minecraft/server").Vector3} pointLocation 
 * @returns {ItemStack}
 */
export function getCompassItem(rotation, location, pointLocation) {
  const displacement = Vector3Utils.subtract(pointLocation, location);
  let bearing = 0;

  if (displacement.x >= 0 && displacement.z >= 0) {
    bearing = Math.PI / 2 - Math.atan(-displacement.z / displacement.x);
  }
  else if (displacement.x >= 0 && displacement.z < 0) {
    bearing = Math.PI / 2 + Math.atan(displacement.z / displacement.x);
  }
  else if (displacement.x < 0 && displacement.z < 0) {
    bearing = 3 / 2 * Math.PI - Math.atan(-displacement.z / displacement.x);
  }
  else if (displacement.x < 0 && displacement.z >= 0) {
    bearing = 3 / 2 * Math.PI + Math.atan(displacement.z / displacement.x);
  }

  const playerRotY = rotation.y * Math.PI / 180 + Math.PI;
  const diffAngle = bearing - playerRotY;
  const innerAngle = (diffAngle < 0) ? 2 * Math.PI + diffAngle : diffAngle;
  const index = Math.floor(innerAngle / (2 * Math.PI) * CompassItemTypes.length + 16) % CompassItemTypes.length || Math.floor(Math.random() * CompassItemTypes.length);
  
  const item = new ItemStack(CompassItemTypes[index]);
  item.lockMode = ItemLockMode.inventory;
  item.keepOnDeath = true;

  return item;
}