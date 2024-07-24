import { EntityEquippableComponent, EntityInventoryComponent, EquipmentSlot, system, TicksPerSecond, world } from "@minecraft/server";
import { CompassItemTypes, getCompassItem } from "./compass";

system.runInterval(() => {
  const speedrunners = world.getPlayers({ tags: ['speedrunner', 'game_is_running'] });
  const players = world.getPlayers({ tags: ['game_is_running'], excludeTags: ['speedrunner'] });

  for (const speedrunner of speedrunners) {
    let hasTracker = false;
    /**
     * @type {EntityInventoryComponent}
     */
    // @ts-ignore
    const inventory = speedrunner.getComponent(EntityInventoryComponent.componentId);

    for (let slotIndex = 0; slotIndex < inventory.inventorySize; slotIndex++) {
      const item = inventory.container.getItem(slotIndex);
      if (!item || !CompassItemTypes.includes(item.typeId)) continue;
      
      inventory.container.setItem(slotIndex);
      hasTracker = true;
    }

    /**
     * @type {EntityEquippableComponent}
     */
    // @ts-ignore
    const equippable = speedrunner.getComponent(EntityEquippableComponent.componentId);
    const offhandItem = equippable.getEquipment(EquipmentSlot.Offhand);

    if (offhandItem && CompassItemTypes.includes(offhandItem.typeId)) {
      equippable.setEquipment(EquipmentSlot.Offhand);
      hasTracker = true;
    }

    if (hasTracker) speedrunner.sendMessage("§cError: §rYou are not allowed to have compass in your inventory.");
  }

  for (const player of players) {
    /**
     * @type {EntityInventoryComponent}
     */
    // @ts-ignore
    const inventory = player.getComponent(EntityInventoryComponent.componentId);
    const [ nearestSpeedrunner ] = player.dimension.getPlayers({ closest: 1, minDistance: 1, tags: ['game_is_running', 'speedrunner'], excludeTags: ['hunter'] });
    const compass = getCompassItem(player.getRotation(), player.location, nearestSpeedrunner?.location ?? player.location);

    if (nearestSpeedrunner && system.currentTick % TicksPerSecond === 0) player.onScreenDisplay.setActionBar('§cYou are tracking: §r§l' + nearestSpeedrunner.name);

    for (let slotIndex = 0; slotIndex < inventory.inventorySize; slotIndex++) {
      const item = inventory.container.getItem(slotIndex);
      if (!item || !CompassItemTypes.includes(item.typeId) || item.typeId === compass.typeId) continue;
      
      inventory.container.setItem(slotIndex, compass);
    }

    /**
     * @type {EntityEquippableComponent}
     */
    // @ts-ignore
    const equippable = player.getComponent(EntityEquippableComponent.componentId);
    const item = equippable.getEquipment(EquipmentSlot.Offhand);

    if (!item || !CompassItemTypes.includes(item.typeId)) continue;
    equippable.setEquipment(EquipmentSlot.Offhand, compass);
  }
}, 2);
