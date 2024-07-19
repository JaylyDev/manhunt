import { EntityEquippableComponent, EntityInventoryComponent, EquipmentSlot, system, world } from "@minecraft/server";
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

    for (let slotIndex = 0; slotIndex < inventory.inventorySize; slotIndex++) {
      const slot = inventory.container.getSlot(slotIndex);
      if (!CompassItemTypes.includes(slot.getItem()?.typeId)) continue;
      
      const compass = getCompassItem(player.getRotation(), player.location, { x: 0, y: 0, z: 0 });
      slot.setItem(compass);
    }

    /**
     * @type {EntityEquippableComponent}
     */
    // @ts-ignore
    const equippable = player.getComponent(EntityEquippableComponent.componentId);
    const offhand = equippable.getEquipmentSlot(EquipmentSlot.Offhand);

    if (CompassItemTypes.includes(offhand.getItem()?.typeId)) {
      const compass = getCompassItem(player.getRotation(), player.location, { x: 0, y: 0, z: 0 });
      offhand.setItem(compass);
    }
  }
})