TBCore.Player = {}

TBCore.Player.LoadData = function(source, identifier, inventory, weapons, cid)
    exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = cid}, function(result)
        local self = {}

        self.Data = {}
        self.Crypto = {}
        self.Functions = {}

        self.inventory = inventory
        self.weapons = weapons

        self.Data.PlayerId = source
        self.Data.cid = cid
        self.Data.bsn = result[1].bsn
        self.Data.identifier = result[1].identifier
        self.Data.license = result[1].license
        self.Data.name = result[1].name
        self.Data.job = result[1].job
        self.Data.job_grade = result[1].job_grade
        self.Data.firstname = result[1].firstname
        self.Data.lastname = result[1].lastname
        self.Data.cash = result[1].cash
        self.Data.bank = result[1].bank
        self.Data.usergroup = result[1].usergroup

        self.Functions.addCash = function(amount)
            TBCore.Functions.addCash(self, amount)
            self.Data.cash = self.Data.cash + amount
        end

        self.Functions.GiveCash = function(amount)
            TBCore.Functions.GiveCash(self, amount)
            self.Data.cash = self.Data.cash + amount
        end

        self.Functions.removeCash = function(amount)
            TBCore.Functions.removeCash(self, amount)
            self.Data.cash = self.Data.cash - amount
        end

        self.Functions.addBank= function(amount)
            TBCore.Functions.addBank(self, amount)
            self.Data.bank = self.Data.bank + amount
        end

        self.Functions.giveBank= function(amount)
            TBCore.Functions.giveBank(self, amount)
            self.Data.bank = self.Data.bank + amount
        end        

        self.Functions.removeBank = function(amount)
            TBCore.Functions.removeBank(self, amount)
            self.Data.bank = self.Data.bank - amount
        end

        self.Functions.addCrypto = function(crypto, amount)
            TBCore.Functions.addCrypto(self, crypto, amount)
        end

        self.Functions.removeCrypto = function(coin, amount)
            TBCore.Functions.removeCrypto(self, coin, amount)
        end

        self.Functions.setCash = function(amount)
            self.Data.cash = amount

            TBCore.Functions.setCash(self, amount)
        end

        self.Functions.setBank = function(amount)
            self.Data.cash = amount

            TBCore.Functions.setBank(self, amount)
        end

        self.Functions.setGroup = function(group)
            self.Data.usergroup = group

            TBCore.Functions.setGroup(self, group)
        end

        self.getInventoryItem = function(item)
            for i=1, #self.inventory, 1 do
                if self.inventory[i].item == item then
                    return self.inventory[i]
                end
            end
        end

        self.getItemFromSlot = function(itemslot)
            for i=1, #self.inventory, 1 do
                if self.inventory[i].slot == itemslot then
                    print(itemslot)
                    return self.inventory[i]
                end
            end
        end

        self.changeItemSlot = function(item, slot)
            for i=1, #self.inventory, 1 do
                if self.inventory[i].item == item then
                    self.inventory[i].slot = slot
                end
            end
        end

        self.updateWeaponBullets = function(weaponid, bullets)
            for i=1, #self.weapons, 1 do
                if self.weapons[i].weaponid == weaponid then
                    self.weapons[i].amount = bullets
                end
            end
        end

        self.changeWeaponSlot = function(weaponid, slot)
            for i=1, #self.weapons, 1 do
                if self.weapons[i].weaponid == weaponid then
                    print(weaponid)
                    self.weapons[i].slot = slot
                end
            end
        end

        self.removeInventoryItem = function(name, amount)
            local item     = self.getInventoryItem(name)
            local newCount = item.amount - amount
            item.amount = newCount
           
    
            if newCount < 0 or newCount == 0 then
                TBCore.Functions.removeInventoryItem(self, item.item)
            else
                TBCore.Functions.updateInventoryItem(self, item.item, newCount)
            end
        end

        self.removeInventoryWeapon = function(name, weaponid)
            TBCore.Functions.removeWeaponItem(self, name, weaponid)
        end

        self.Functions.giveItem = function(name, amount)
            local item = self.getInventoryItem(name)

            if item == nil then
                TBCore.Functions.giveItem(self, name, amount)
				table.insert(self.inventory, {
					item      	= name,
					amount     	= amount,
					slot 		= 6,
					label 		= TBCore.Items[name].label,
					weight 		= TBCore.Items[name].weight,
					description = TBCore.Items[name].description,
					type 		= TBCore.Items[name].type,
					usable 		= TBCore.Items[name].usable,
                    unique 		= TBCore.Items[name].unique,
                    weaponid    = nil
                })
            else
                local newCount  = item.amount + amount
                item.amount     = newCount

                TBCore.Functions.giveItem(self, name, amount)
            end
        end

        self.Functions.giveWeapon = function(name, amount)
	        local weaponid = math.random(000000, 999999)
            TBCore.Functions.giveWeapon(self, name, amount, weaponid)
            table.insert(self.weapons, {
                item      	= name,
                amount     	= amount,
                slot 		= 20,
                label 		= TBCore.Items[name].label,
                weight 		= TBCore.Items[name].weight,
                description = TBCore.Items[name].description,
                type 		= TBCore.Items[name].type,
                usable 		= TBCore.Items[name].usable,
                unique 		= TBCore.Items[name].unique,
                weaponid    = weaponid
            })
        end

        self.Functions.clearInventory = function()
            self.inventory = {}
            
            TBCore.Functions.clearInventory(self, self.Data.identifier)
        end

        self.Functions.getWeight = function()
            inventory = self.inventory
            local weight = 0
    
            if inventory ~= nil then
                for k, v in pairs(inventory) do
                    weight = weight + (inventory[k].amount * inventory[k].weight)
                end
            end

            return weight
        end

        TBCore.Players[source] = self
    end)
end