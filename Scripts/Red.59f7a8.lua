function onload()
  -- Load inside the script since global images do not work for players who join late.
  local resourceAssets = {
    { name = "blue_battlefield_claim", url = "https://steamusercontent-a.akamaihd.net/ugc/952959000918851189/EE82D1A6844C4548CDA3AA486D91D00BE7FFE048/" },
	{ name = "red_battlefield_claim", url = "https://steamusercontent-a.akamaihd.net/ugc/952959000918850667/5CBF41F8886AC21025405DE4568BE998F478165E/" },
    { name = "ingame_gui_background", url = "https://steamusercontent-a.akamaihd.net/ugc/948454725666385380/A47369F346253BDE02F44153C4940D47AA0E6E67/" },
    { name = "ingame_blue_panel_overlay", url = "https://steamusercontent-a.akamaihd.net/ugc/948454725666384731/E921F14A80CFA7C3BC20C7D7C61D7319443D0169/" },
    { name = "ingame_red_panel_overlay", url = "https://steamusercontent-a.akamaihd.net/ugc/948454725666389779/69DCF9BD43E89F93351F7F2F8E87D5CFFD7E3EF7/" },
    { name = "", url = "https://steamusercontent-a.akamaihd.net/ugc/948454725666387411/82FAD658AECC1F80A3413BEB32A2971FF168E4BF/" },
    { name = "ingame_gui_resource", url = "https://steamusercontent-a.akamaihd.net/ugc/948454725666388925/ACEB3703278FB7DFB707BFE2DE931571529BD372/" },
    { name = "ingame_gui_pass", url = "https://steamusercontent-a.akamaihd.net/ugc/948454725666388357/43FDE0C7B097A67D681F9D35D91535A8EA66F3EE/" },
    { name = "ingame_gui_shuffle", url = "https://steamusercontent-a.akamaihd.net/ugc/948454725666389375/842D3237A768D7171668FCD28264F81C30BFEE0D/" },
    { name = "ingame_gui_discard", url = "https://steamusercontent-a.akamaihd.net/ugc/948454725666386672/85210903AED7A7F638BA6784A45A042013DD28FC/" },
  }
  self.UI.setCustomAssets(resourceAssets)

  tokenplayerone = Global.getTable('tokenplayerone')
  tokenplayertwo = Global.getTable('tokenplayertwo')

  if self.getName() == 'Blue' then owner = 'Blue'
  else owner = 'Red'end

  if owner == 'Blue' then
    self.UI.setXml([[
<Button
  id="blue_claim_button"
  visibility="Blue"
  active="true"
  position="-255 690 -3"
  rotation="0 0 0"
  scale="3.5 3.5"
  fontSize="20"
  width="80"
  height="40"
  image="blue_battlefield_claim"
  raycastTarget="false"
></Button>
<Panel
   id="blue_panel"
   visibility="Blue"
   active="false"
   position="0 -300 -5"
   rotation="0 0 0"
   scale="5.46 5.46"
   rectAlignment="MiddleCenter"
   width="80"
   height="96"
   image="ingame_gui_background"
   raycastTarget="false"
>
<Image
   offsetXY="0 34"
   width="80"
   height="24"
   image="ingame_blue_panel_overlay"
   raycastTarget="false"
></Image>

<Text
   id="blue_panel_red_cards"
   scale="0.3 0.3"
   offsetXY="-6 39"
   fontStyle="Bold"
   fontSize="36"
   color="#FFFFFF"
>0</Text>

<Text
   id="blue_panel_blue_cards"
   scale="0.3 0.3"
   offsetXY="-6 29"
   fontStyle="Bold"
   fontSize="36"
   color="#FFFFFF"
>0</Text>

<Text
   id="blue_panel_red_resources"
   scale="0.3 0.3"
   offsetXY="24 39"
   fontStyle="Bold"
   fontSize="36"
   color="#FFFFFF"
>0</Text>

<Text
   id="blue_panel_blue_resources"
   scale="0.3 0.3"
   offsetXY="24 29"
   fontStyle="Bold"
   fontSize="36"
   color="#FFFFFF"
>0</Text>

<Button
   offsetXY="33 42"
   width="5"
   height="5"
   onClick="Global/guiToggle"
   image="ingame_gui_maximize"
></Button>

<Button
   offsetXY="-18 7"
   width="28"
   height="28"
   onClick="Global/guiResource"
   image="ingame_gui_resource"
></Button>

<Button
   offsetXY="18 7"
   width="28"
   height="28"
   onClick="Global/guiPass"
   image="ingame_gui_pass"
></Button>

<Button
   offsetXY="-18 -28"
   width="28"
   height="28"
   onClick="Global/guiShuffle"
   image="ingame_gui_shuffle"
></Button>

<Button
   offsetXY="18 -28"
   width="28"
   height="28"
   onClick="Global/guiDiscard"
   image="ingame_gui_discard"
   fontSize="32"
   textColor="#000000"
></Button> </Panel>
]])
  else
    self.UI.setXml([[
<Button
  id="red_claim_button"
  visibility="Red"
  active="true"
  position="-255 690 -3"
  rotation="0 0 0"
  scale="3.5 3.5"
  fontSize="20"
  width="80"
  height="40"
  image="red_battlefield_claim"
  raycastTarget="false"
></Button>
<Panel
   id="red_panel"
   visibility="Red"
   active="false"
   position="0 -300 -5"
   rotation="0 0 0"
   scale="5.46 5.46"
   rectAlignment="MiddleCenter"
   width="80"
   height="96"
   image="ingame_gui_background"
   raycastTarget="false"
>
<Image
   offsetXY="0 34"
   width="80"
   height="24"
   image="ingame_red_panel_overlay"
   raycastTarget="false"
></Image>
<Text
   id="red_panel_blue_cards"
   scale="0.3 0.3"
   offsetXY="-6 39"
   fontStyle="Bold"
   fontSize="36"
   color="#FFFFFF"
>0</Text>
<Text
   id="red_panel_red_cards"
   scale="0.3 0.3"
   offsetXY="-6 29"
   fontStyle="Bold"
   fontSize="36"
   color="#FFFFFF"
>0</Text>
<Text
   id="red_panel_blue_resources"
   scale="0.3 0.3"
   offsetXY="24 39"
   fontStyle="Bold"
   fontSize="36"
   color="#FFFFFF"
>0</Text>
<Text
   id="red_panel_red_resources"
   scale="0.3 0.3"
   offsetXY="24 29"
   fontStyle="Bold"
   fontSize="36"
   color="#FFFFFF"
>0</Text>
<Button
   offsetXY="33 42"
   width="5"
   height="5"
   onClick="Global/guiToggle"
   image="ingame_gui_maximize"
></Button>
<Button
   offsetXY="-18 7"
   width="28"
   height="28"
   onClick="Global/guiResource"
   image="ingame_gui_resource"
></Button>
<Button
   offsetXY="18 7"
   width="28"
   height="28"
   onClick="Global/guiPass"
   image="ingame_gui_pass"
></Button>
<Button
   offsetXY="-18 -28"
   width="28"
   height="28"
   onClick="Global/guiShuffle"
   image="ingame_gui_shuffle"
></Button>
<Button
   offsetXY="18 -28"
   width="28"
   height="28"
   onClick="Global/guiDiscard"
   image="ingame_gui_discard"
   fontSize="32"
   textColor="#000000"
></Button> </Panel>
]])
  end

  resourceSpawnIndex = 0
  discardCounter = 0
end

function passButton()
  if owner == 'Blue' then broadcastToAll('Blue passes!', {0.1,0.5,1.0})
  else broadcastToAll('Red passes!', {0.8,0.1,0.1}) end
end

function resourceSpawned(newResource)
  newResource.setName("Resource")
  newResource.tooltip = false
end

function spawnResource(clickType)

  if clickType == '-1' then
  local zoneObject = nil
  local zonePosition = {}
  local spawnReference = {x=0, y=0, z=0}
  local obj_parameters = {}
  local custom = {}
  local token = nil
  local xFactor = 1
  local zFactor = 1

  if owner == 'Blue' then
    zoneObject = Global.getVar("blueResourceZone")
    if (zoneObject != nil) then
      zonePosition = zoneObject.getPosition()
      spawnReference = {x = (zonePosition.x + 1.54), y = (zonePosition.y - 1.00), z = (zonePosition.z + 1.29)}
    end

    xFactor = (-1)
    zFactor = (-1)
  else
    zoneObject = Global.getVar("redResourceZone")
    if (zoneObject != nil) then
      zonePosition = zoneObject.getPosition()
      spawnReference = {x = (zonePosition.x - 1.54), y = (zonePosition.y - 1.00), z = (zonePosition.z - 1.29)}
    end

    xFactor = 1
    zFactor = 1
  end

  obj_parameters.type = 'Custom_Token'
  obj_parameters.callback_function = resourceSpawned
  obj_parameters.position = {}
  obj_parameters.position.x = (spawnReference.x + (xFactor * (resourceSpawnIndex % 4)))
  obj_parameters.position.y = spawnReference.y
  obj_parameters.position.z = (spawnReference.z + (zFactor * math.floor(resourceSpawnIndex / 4)))
  obj_parameters.rotation = {0,0,0}

  custom.image = tokenplayerone.resource
  custom.thickness = 0.1
  custom.merge_distance = 5.0
  custom.stackable = false

  token = spawnObject(obj_parameters)
  token.setCustomObject(custom)
  token.scale {0.23, 1.00, 0.23}

  resourceSpawnIndex = (resourceSpawnIndex + 1) -- This is how it determines incremental spawn margin of resources.
  if resourceSpawnIndex >= 20 then
    resourceSpawnIndex = 0
  	end
  end
end

function randomDiscard()
  local handObjects = Player[owner].getHandObjects()
  local numHandObjects = #handObjects
  local discardPosition = {}
  local cardChoice = nil

  if numHandObjects > 0 then
    cardChoice = math.random(numHandObjects)

    if owner == 'Blue' then
      discardPosition.x = (-26.29)
      discardPosition.y = 2.20
      discardPosition.z = (6.59 + discardCounter)
    else
      discardPosition.x = 26.29
      discardPosition.y = 2.20
      discardPosition.z = ((-6.59) - discardCounter)
    end

    -- Teleport first to avoid the hand zone grabbing the card back.
    handObjects[cardChoice].setPosition(discardPosition)
    -- Now move fast with no collision using smooth motion so that the card will fall.
    discardPosition.y = (discardPosition.y - 0.20)
    handObjects[cardChoice].setPositionSmooth(discardPosition, false, true)

    discardCounter = (discardCounter + 1)
    if discardCounter >= 5 then
      discardCounter = 0
    end
  end
end

function shuffleHand()
  local handObjects = Player[owner].getHandObjects()
  local numHandObjects = #handObjects
  local cardPositions = {}

  if numHandObjects > 0 then
    for i, v in pairs(handObjects) do
        cardPositions[i] = v.getPosition()
    end
    local handObjectsShuffled = shuffleTable(handObjects)
    local cardPositionsShuffled = shuffleTable(cardPositions)
    for i, v in pairs(handObjectsShuffled) do
        v.setPosition(cardPositionsShuffled[i])
    end
  end
end

function shuffleTable(t)
    for i = #t, 2, -1 do
        local n = math.random(i)
        t[i], t[n] = t[n], t[i]
    end
    return t
end

function onDrop(playerColor)
  local objectPosition = self.getPosition()
  local battlefieldZone = nil
  local resourceZone = nil
  local matZone = nil

  -- Update zones to match the board position.

  if (owner == 'Blue') then
    battlefieldZone = Global.getVar("blueBattlefieldZone")
    resourceZone = Global.getVar("blueResourceZone")
    matZone = Global.getVar("blueMatZone")

    if battlefieldZone != nil then
      battlefieldZone.setPosition({x = (objectPosition.x + 2.43), y = (objectPosition.y + 1.50), z = (objectPosition.z - 9.73)})
    end

    if resourceZone != nil then
      resourceZone.setPosition({x = (objectPosition.x - 2.18), y = (objectPosition.y + 1.50), z = (objectPosition.z - 9.68)})
    end

    if matZone != nil then
      matZone.setPosition({x = (objectPosition.x + 25.64), y = (objectPosition.y + 2.50), z = (objectPosition.z + 0.20)})
    end
  else
    battlefieldZone = Global.getVar("redBattlefieldZone")
    resourceZone = Global.getVar("redResourceZone")
    matZone = Global.getVar("redMatZone")

    if battlefieldZone != nil then
      battlefieldZone.setPosition({x = (objectPosition.x - 2.43), y = (objectPosition.y + 1.50), z = (objectPosition.z + 9.73)})
    end

    if resourceZone != nil then
      resourceZone.setPosition({x = (objectPosition.x + 2.18), y = (objectPosition.y + 1.50), z = (objectPosition.z + 9.68)})
    end

    if matZone != nil then
      matZone.setPosition({x = (objectPosition.x - 25.64), y = (objectPosition.y + 2.50), z = (objectPosition.z - 0.20)})
    end
  end
end

function handlePossibleDiceSpawn(params)
  local cardSet = ''
  local cardNumber = ''
  local position = self.getPosition()
  local owningPlayerColor = params.owningPlayerColor
  local object = params.cardObject
  local obj_parameters = {}
  local custom = {}
  local SWDARHISTHEBEST = Global.getTable("SWDARHISTHEBEST")

  obj_parameters.type = 'Custom_Dice'
  obj_parameters.scale = {1.7,1.7,1.7}
  obj_parameters.position = {object.getPosition()[1],object.getPosition()[2]+1,object.getPosition()[3]}
  obj_parameters.rotation = {0,object.getRotation()[2]+180,0}

  if ((object.getVar("spawned") ~= true) and
      (object.tag == 'Card') and
      (Global.getVar("loadDelayFinished") == true)) then
    local cardFound = false
    local isDiceCard = false
    local isCharacterCard = false
    local cardDescription = object.getDescription()
    local cardDescriptionLength = 0
    local testCardType = nil
    local dataTableIndex = 1
    local isElite = false
	local rotationZ = object.getRotation().z

    if cardDescription != nil then
      cardDescriptionLength = string.len(cardDescription)
      if string.sub(cardDescription, 1, 5) == 'elite' then
        isElite = true
      end
    end

    -- If there is text past "elite", or the card is not elite and there is text at all, the card uses the new format.
    if (((isElite == true) and (cardDescriptionLength > 5)) or
        ((isElite == false) and (cardDescriptionLength > 0))) then
      -- This is a new card export.  Extract the set and number.
      local setCharIndex = 1
      local numberCharIndex = 1
      if (isElite == true) then
        setCharIndex = 7
      else
        setCharIndex = 1
      end

      -- Do a plain search.
      numberCharIndex = (string.find(cardDescription, ' ', setCharIndex, true) + 1)
      cardSet = string.sub(cardDescription, setCharIndex, (numberCharIndex - 2))
      -- Leaving out the third argument takes a substring to the end of the string.
      cardNumber = string.sub(cardDescription, numberCharIndex)

      -- Find the card by its set and number.
      for i in ipairs(SWDARHISTHEBEST) do
        testCardType = SWDARHISTHEBEST[i]["type"]

        if ((SWDARHISTHEBEST[i]["set"] == cardSet) and
            (SWDARHISTHEBEST[i]["number"] == cardNumber) and
            ((testCardType == 'Upgrade') or (testCardType == 'Downgrade') or (testCardType == 'Plot') or (testCardType == 'Character') or (testCardType == 'Support') or (testCardType == 'Battlefield'))) then
          cardFound = true
          dataTableIndex = i

          if (SWDARHISTHEBEST[i]["diceimage"] != nil) then
            isDiceCard = true
          end

          break
        end
      end

      local diceSpawnDebug = Global.getVar("diceSpawnDebug")

      if (cardFound == false) then
        if diceSpawnDebug == true then
          printToAll("Error, card " .. cardSet .. " " .. cardNumber .. " not found (make sure it is not a support).", {1,0,0})
        end
      end
    else
      -- This may be an old card export.  Do nothing.
    end

    if (cardFound == true) then
      -- For character cards, spawn the dice on the table for ease of rollout.
      zOffset = 0
      if (SWDARHISTHEBEST[dataTableIndex]["type"] == 'Character') then
        isCharacterCard = true
        if (owner == 'Blue') then
          zOffset = (-6)
        else
          zOffset = 5
        end
      end

      object.setVar("spawned", true)
      if (isDiceCard == true) then
        obj_parameters.position[3] = (obj_parameters.position[3] + zOffset)
        local dice = spawnObject(obj_parameters)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        dice.setCustomObject(custom)
      end

      if ((cardSet == 'EaW') and (cardNumber == '10')) then
        -- For EaW Seventh Sister, spawn an ID9 Seeker Droid die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/869614883116891249/E95F6BDCAD82D95AEEFF7798BA2EB89013F1C530/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

     elseif ((cardSet == 'WotF') and (cardNumber == '128')) then
        -- For WotF Ammo Reserves, spawn 3 damage tokens on the card.
        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}
        for i=1,3 do
          obj_parameters.position = {object.getPosition()[1]-1.5+(i*0.7),object.getPosition()[2]+0.2,object.getPosition()[3]-1.5+(i*0.7)}
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.damageone
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end

      elseif ((cardSet == 'CONV') and (cardNumber == '18')) then
        -- For CONV Captain Phasma, spawn 2 First Order Stormtrooper dice on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/940587492855532900/1228C3F5E9F9ADF45DC65F9E14C5448B0A7006B1/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/940587492855532900/1228C3F5E9F9ADF45DC65F9E14C5448B0A7006B1/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'AW') and (cardNumber == '99')) then
        -- For AW Backup Muscle, spawn 3 damage tokens on the card.
        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}

        for i=1,3 do
          obj_parameters.position = {object.getPosition()[1]-1.5+(i*0.7),object.getPosition()[2]+0.2,object.getPosition()[3]-1.5+(i*0.7)}
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.damageone
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end

      elseif ((cardSet == 'LEG') and (cardNumber == '70')) then
        -- For LEG Modified HWK-290, spawn 2 damage tokens on the card.
        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}

        for i=1,2 do
          obj_parameters.position = {object.getPosition()[1]-1.5+(i*0.7),object.getPosition()[2]+0.2,object.getPosition()[3]-1.5+(i*0.7)}
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.damageone
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end

      elseif ((cardSet == 'SoR') and (cardNumber == '124')) then
        -- For SoR Air Superiority, spawn 3 shield tokens on the card.
        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}

        for i=1,3 do
          obj_parameters.position = {object.getPosition()[1]-1.5+(i*0.7),object.getPosition()[2]+0.2,object.getPosition()[3]-1.5+(i*0.7)}
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.shield
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end

      elseif ((cardSet == 'CONV') and (cardNumber == '31')) then
        -- For CONV Megablaster Troopers, spawn a First Order Stormtrooper die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/940587492855532900/1228C3F5E9F9ADF45DC65F9E14C5448B0A7006B1/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'AF') and (cardNumber == '85')) then
        -- For AF Anakin's Spirit, spawn a Darth Vader die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/937205659715959521/EEB265C565C4D19B03B95E29E3383255D154DE5D/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'AF') and (cardNumber == '90')) then
        -- For AF Senate Guard, spawn a Stun Baton die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/910157197472462168/B3286FC5C47D12E529035AE6246DF9EB43A98F0D/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'AF') and (cardNumber == '18')) then
        -- For AF Morgan Elspeth, spawn a Thrawn die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/771720478341861471/B936B387387095363632D20FE9A437EC52896F78/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'AF') and (cardNumber == '37')) then
        -- For AF Cumulus-Class Corsair, spawn a Snub Fighter die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://i.imgur.com/hdcWOIe.png"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'AF') and (cardNumber == '58')) then
        -- For AF Jan Dodonna, spawn a Rebel Trooper die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/147885549582781089/21E1106177BD4C9C67CAACA5FFC310E4A3B39C31/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'DoP') and (cardNumber == '23')) then
        -- For DoP Executor, spawn a Planetary Bombardment die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/910172009674812868/54D81E914D64B52CB27DD8EE91F1B2FF74C9F31C/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'DoP') and (cardNumber == '56')) then
        -- For DoP Aayla, spawn a Clone Trooper die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/910157197472418178/7C0B5FF88FF25AACA93F475486ADB0C41FA6758F/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'DoP') and (cardNumber == '116')) then
        -- For DoP Jawa Trade Route, spawn a Jawa Scavenger die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/866244165279375107/78A625BE6D642B8F8DE5DCC602DC05FFBC549368/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'DoP') and (cardNumber == '33')) then
        -- For DoP Rook Kast, spawn Mando Commando and Maul dice on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/948453532242773388/D3672474872AF3718C016EE0ED82EE3F6DEBEFE6/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+2}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/771720478341846336/2BD67269B1D301F475942CF572E6812F3AF98727/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'SA') and (cardNumber == '25')) then
        -- For SA Star Destroyer, spawn 3 TIE Fighter dice on the card.
        obj_parameters.position = {object.getPosition()[1], object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "http://i.imgur.com/EyA8opr.jpg"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "http://i.imgur.com/EyA8opr.jpg"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1]+2, object.getPosition()[2]+1, object.getPosition()[3]+2}
        local extradice = spawnObject(obj_parameters)
        custom.image = "http://i.imgur.com/EyA8opr.jpg"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'SA') and (cardNumber == '47')) then
        -- For SA Big Rey, spawn Luke & Leia dice on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/257091088004693948/C3986CEC4CDD4F70FB3443F041B97029E0BFC2C4/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+2}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226665906525/FA09A4229B293A483BE7E61F425F039FD32C99F1/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'SA') and (cardNumber == '46')) then
        -- For SA Little Rey, spawn Big Rey, Luke & Leia dice on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/257091088004693948/C3986CEC4CDD4F70FB3443F041B97029E0BFC2C4/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+2}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226665906525/FA09A4229B293A483BE7E61F425F039FD32C99F1/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1]+2, object.getPosition()[2]+1, object.getPosition()[3]+2}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://i.imgur.com/Acly8BM.png"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'SA') and (cardNumber == '5')) then
        -- For SA Snoke, spawn Citadel Lab dice on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://i.imgur.com/5IpkCCs.png"
        extradice.setCustomObject(custom)

      elseif ((cardSet == 'SA') and (cardNumber == '6')) then
        -- For SA Citadel Lab, spawn Snoke Lab dice on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://i.imgur.com/6Aa7jH1.png"
        extradice.setCustomObject(custom)

      elseif ((cardSet == 'SA') and (cardNumber == '55')) then
        -- For Jedi Temple Guards, make it elite.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://i.imgur.com/tFVFtMl.png"
        extradice.setCustomObject(custom)

      elseif ((cardSet == 'SA') and (cardNumber == '63')) then
        -- For SA Tallissan, spawn A-Wing dice on the card.
        obj_parameters.position = {object.getPosition()[1], object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/934964008673137645/2460E379D583CB6ACE6103EAD12601FEDE413A48/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'SA') and (cardNumber == '69')) then
        -- For SA Venator, spawn 2 ARC-170 dice on the card.
        obj_parameters.position = {object.getPosition()[1], object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/948454029952543079/F680053EC03D7D1DF28D2E891A92236E10B7CF20/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/948454029952543079/F680053EC03D7D1DF28D2E891A92236E10B7CF20/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'SA') and (cardNumber == '101')) then
        -- For SA Tusken Camp, spawn 2 Tusken Raider dice on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/194046562282923028/7D7DC21B0F1EF2458857FA71648AAD7FA95913C0/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/194046562282923028/7D7DC21B0F1EF2458857FA71648AAD7FA95913C0/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'RES') and (cardNumber == '1')) then
        -- For RES Allya, spawn a Nightsister die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/194046562282917283/7BC2002A4274F4AF6C429256B5BB7F1B34BDB6C8/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'RES') and (cardNumber == '25')) then
        -- For RES ISB Central Office, spawn an ISB Agent die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://drive.google.com/uc?id=1iE1GdTIc5nbuQdTfpBfJI_9p8Sb2tG6s"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'RES') and (cardNumber == '26')) then
        -- For RES Pre-Mor Enforcers, spawn a Conscript Squad die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/949605779489070002/508DC7B151C3C66CD421CBB1E573166460BF8EBA/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'RES') and (cardNumber == '49')) then
        -- For RES Desperate Power, spawn a Force Retaliation die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://i.imgur.com/FyShEtk.png"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'RES') and (cardNumber == '105')) then
        -- For RES Going Somewhere, Solo? spaw a Greedo and a Han Solo die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/910157197472405292/985BD94742BE2FE3891CA1C988B8244D805BA7A6/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1], object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/771720478341882755/66F677DD426228E54F0D768DDFCAB03E117D3192/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]


      elseif ((cardSet == 'UH') and (cardNumber == '4')) then
        -- For UH Ren, spawn a Servant of the darkside die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/869614971447060228/C85E02EF69DD550F2CC533307AD77CA8BCDCE44F/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'UH') and (cardNumber == '68')) then
        -- For UH The Bad Batch spaw a Clone Trooper and a Rebel Engineer die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/910157197472418178/7C0B5FF88FF25AACA93F475486ADB0C41FA6758F/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]
        obj_parameters.position = {object.getPosition()[1], object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/952969527667705761/79E1A1F84406DE5C07021C7FAF771C7BE8F69154/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

	  elseif ((cardSet == 'RM') and (cardNumber == '60')) then
        -- For RED Redemption, spawn a Medical Droid die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/858354911724420112/984FA39EC5929853F0C047FFF70FAE9D1FCCF425/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

		obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/858354911724420112/984FA39EC5929853F0C047FFF70FAE9D1FCCF425/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

	  elseif ((cardSet == 'RM') and (cardNumber == '3')) then
        -- For RED Maul 3A, spawn Maul 3B.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226665912771/B520C11D5753DAE3B5455576138FA8DEF5584208/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

	   elseif ((cardSet == 'RM') and (cardNumber == '5')) then
        -- For RED Savage 4A, spawn Savage 4B.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226665924865/D0CB98B795A6D75799BC24A508D19CD2C4D58D1F/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

	  elseif ((cardSet == 'RM') and (cardNumber == '12')) then
        -- For RED Watch Your Career With Great Interest, spawn Vader 10B.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226665890223/25CA88EAB9BA70883B8965011A0FD15ACC889F53/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

	  elseif ((cardSet == 'RM') and (cardNumber == '95')) then
        -- For RED The Ultimate Heist, spawn Master of Pirates 92B.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226666159528/4B0F30C9946F8613850FEF6B157E6A6FBAB7C182/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

	  elseif ((cardSet == 'RM') and (cardNumber == '91')) then
        -- For RED Hondo Ohnaka, spawn a Pirate Loyalist die on the card.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226665917819/ACF3309D19EE7E9768FFC8CCEE7008D69900941E/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

		obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]+1}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226665917819/ACF3309D19EE7E9768FFC8CCEE7008D69900941E/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

	  elseif ((cardSet == 'RM') and (cardNumber == '26')) then
        -- For RED Blizzard, spawn an extra die.
        obj_parameters.position = {object.getPosition()[1]+1, object.getPosition()[2]+1, object.getPosition()[3]}
        local extradice = spawnObject(obj_parameters)
        custom.image = "https://steamusercontent-a.akamaihd.net/ugc/1750180226665885478/CDC41216758A6B0519A5C8981B38AF01112674D9/"
        extradice.setCustomObject(custom)
        custom.image = SWDARHISTHEBEST[dataTableIndex]["diceimage"]

      elseif ((cardSet == 'CONV') and (cardNumber == '172')) then
        -- For CONV Sonic Detonators, spawn 6 resource tokens on the card.
        local spawnXOffset = -1.7
        local spawnZOffset = -1.72

        if owningPlayerColor == "Red" then
           spawnXOffset = -1.16
           spawnZOffset = 1.03
        end

        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}
        for i=1,3 do
          obj_parameters.position = { object.getPosition()[1]+spawnXOffset+(i*0.7), object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset }
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.resource
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end
        for i=1,3 do
          obj_parameters.position = { object.getPosition()[1]+spawnXOffset+(i*0.7), object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset+0.70 }
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.resource
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end
    --  elseif ((cardSet == 'AoN') and (cardNumber == '17')) then
        -- For AoN LR-57 Combat Droid, spawn 1 resource token on the card.
      --  obj_parameters.type = 'Custom_Token'
      --  obj_parameters.rotation = {3.87674022, 0, 0.239081308}
      --  obj_parameters.scale = {0.227068469, 1, 0.227068469}
      --  obj_parameters.position = {object.getPosition()[1]-0.8,object.getPosition()[2]+0.2,object.getPosition()[3]-0.8}
      --  local token = spawnObject(obj_parameters)
      --  local custom = {}
      --  custom.image = tokenplayerone.resource
      --  custom.thickness = 0.1
      --  custom.merge_distance = 5.0
      --  custom.stackable = false
      --  token.setCustomObject(custom)


    elseif ((cardSet == 'HS') and (cardNumber == '77')) then
     -- For HS Whistling birds spawn a resource token on the card.
      obj_parameters.type = 'Custom_Token'
      obj_parameters.rotation = {3.87674022, 0, 0.239081308}
      obj_parameters.scale = {0.227068469, 1, 0.227068469}
      obj_parameters.position = {object.getPosition()[1]-0.8,object.getPosition()[2]+0.2,object.getPosition()[3]-0.8}
      local token = spawnObject(obj_parameters)
      local custom = {}
      custom.image = tokenplayerone.resource
      custom.thickness = 0.1
      custom.merge_distance = 5.0
      custom.stackable = false
      token.setCustomObject(custom)



      elseif ((cardSet == 'SoH') and (cardNumber == '71')) then
        -- For SoH Three Lessons, spawn 3 resource tokens on the card.
        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}
        for i=1,3 do
          obj_parameters.position = {object.getPosition()[1]-1.5+(i*0.7),object.getPosition()[2]+0.2,object.getPosition()[3]-1.5+(i*0.7)}
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.resource
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end
      elseif ((cardSet == 'SoH') and (cardNumber == '5')) then
        -- For SoH Old Daka, spawn a SoH Nightsister Zombie.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "11004",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
      elseif ((cardSet == 'FA') and (cardNumber == '63')) then
        -- For Merrin, spawn a SoH Nightsister Zombie.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "11004",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
	  
		Global.call("spawnCard")
		elseif ((cardSet == 'RM') and (cardNumber == '9')) then
        -- For Chant of Resurrection, spawn 3 SoH Nightsister Zombie.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "11004",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
		Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "11004",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
		Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "11004",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
	  elseif ((cardSet == 'RM') and (cardNumber == '16')) then
        -- For General Veers, spawn a Snowtrooper.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "15017",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
	  elseif ((cardSet == 'RM') and (cardNumber == '25')) then
        -- For 501st Assault Team, spawn a E-Web Emplacement.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "02005",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
	  elseif ((cardSet == 'RM') and (cardNumber == '48')) then
        -- For You Will Go To The Dagobah System, spawn a Jedi Trials.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "12065",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
	  elseif ((cardSet == 'RM') and (cardNumber == '52')) then
        -- For Admiral Ackbar , spawn a X-Wing.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "08086",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

                                 elseif ((cardSet == 'RM') and (cardNumber == '52')) then
                                     -- For Admiral Ackbar , spawn a X-Wing.
                                     local spawnXOffset = -7.0
                                     local spawnZOffset = 2.3

                                     if owningPlayerColor == "Red" then
                                        spawnXOffset = 7.0
                                        spawnZOffset = -2.3
                                     end

                                     Global.call("spawnCard", { playerColor = owningPlayerColor,
                                                                cardCode = "08086",
                                                                spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                                                spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })


	  elseif ((cardSet == 'RM') and (cardNumber == '53')) then
        -- For Bothan Spy , spawn a Death Star Plans then kill him.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "12126",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })


                                 elseif ((cardSet == 'HS') and (cardNumber == '98')) then
                                     -- For Greef Karga , spawn a Bounty Board.
                                     local spawnXOffset = -7.0
                                     local spawnZOffset = 2.3

                                     if owningPlayerColor == "Red" then
                                        spawnXOffset = 7.0
                                        spawnZOffset = -2.3
                                     end

                                     Global.call("spawnCard", { playerColor = owningPlayerColor,
                                                                cardCode = "09047",
                                                                spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                                                spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

                                elseif ((cardSet == 'AF') and (cardNumber == '48')) then
                                    -- For Cere Junda , spawn a Jedi Archives.
                                    local spawnXOffset = -7.0
                                    local spawnZOffset = 2.3

                                    if owningPlayerColor == "Red" then
                                       spawnXOffset = 7.0
                                       spawnZOffset = -2.3
                                    end

                                    Global.call("spawnCard", { playerColor = owningPlayerColor,
                                                               cardCode = "23053",
                                                               spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                                               spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })


                                                              elseif ((cardSet == 'HS') and (cardNumber == '104')) then
                                                                -- For Ugly , spawn Outdated Tech.
                                                                local spawnXOffset = -7.0
                                                                local spawnZOffset = 2.3

                                                                if owningPlayerColor == "Red" then
                                                                   spawnXOffset = 7.0
                                                                   spawnZOffset = -2.3
                                                                end

                                                                Global.call("spawnCard", { playerColor = owningPlayerColor,
                                                                                           cardCode = "12148",
                                                                                           spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                                                                           spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })





      elseif ((cardSet == 'FA') and (cardNumber == '83')) then
        -- For Extremist Campaign, Spawn associated cards
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owner == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owner,
                                   cardCode = "02112",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
        Global.call("spawnCard", { playerColor = owner,
                                   cardCode = "02112",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
        Global.call("spawnCard", { playerColor = owner,
                                   cardCode = "03137",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
        Global.call("spawnCard", { playerColor = owner,
                                   cardCode = "03137",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
        Global.call("spawnCard", { playerColor = owner,
                                   cardCode = "08038",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
        Global.call("spawnCard", { playerColor = owner,
                                   cardCode = "08038",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })


	  elseif ((cardSet == 'RM') and (cardNumber == '2')) then
		-- For Kylo Ren Driven By Fear, Spawn associated cards
		local spawnXOffset = -7.0
		local spawnZOffset = 2.3

		if owningPlayerColor == "Red" then
			spawnXOffset = 7.0
			spawnZOffset = -2.3
		end

		Global.call("spawnCard", { playerColor = owningPlayerColor,
                                 cardCode = "01082",
                                 spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                 spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
		Global.call("spawnCard", { playerColor = owningPlayerColor,
                                 cardCode = "01082",
                                 spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                 spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
		Global.call("spawnCard", { playerColor = owningPlayerColor,
                                 cardCode = "02071",
                                 spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                 spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
		Global.call("spawnCard", { playerColor = owningPlayerColor,
                                 cardCode = "02071",
                                 spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                 spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
      elseif ((cardSet == 'SoH') and (cardNumber == '93')) then
        -- For SoH Chief Chirpa, spawn a SoH Ewok Warrior.
        local spawnXOffset = -7.0
        local spawnZOffset = 0.0

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "11095",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

                                 elseif ((cardSet == 'UH') and (cardNumber == '73')) then
									print("owningPlayerColor is: ", owningPlayerColor)
                                             -- For UH Padme Amidala spawn Diplomatic Immunity
                                             local spawnXOffset = -7.0
                                             local spawnZOffset = 0.0

                                             if owningPlayerColor == "Red" then
                                                spawnXOffset = 7.0
                                             end

                                             Global.call("spawnCard", { playerColor = owningPlayerColor,
                                                                        cardCode = "01050",
                                                                        spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                                                        spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })



                       elseif ((cardSet == 'UH') and (cardNumber == '33')) then
                                   -- For UH Pre Viszla spawn HS Darksaber
                                   local spawnXOffset = -7.0
                                   local spawnZOffset = 0.0

                                   if owningPlayerColor == "Red" then
                                      spawnXOffset = 7.0
                                   end

                                   Global.call("spawnCard", { playerColor = owningPlayerColor,
                                                              cardCode = "17105",
                                                              spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                                              spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })


      elseif ((cardSet == 'SoH') and (cardNumber == '105')) then
        -- For SoH Chief Chirpa's Hut, spawn a SoH Ewok Warrior.
        local spawnXOffset = -7.0
        local spawnZOffset = 2.3

        if owningPlayerColor == "Red" then
           spawnXOffset = 7.0
           spawnZOffset = -2.3
        end

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "11095",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

        elseif ((cardSet == 'RES') and (cardNumber == '16')) then
         -- For RES Linus Mosk, spawn 2x Measure for Measure, 2x Fresh Supplies and 2x Seizing Territory.
         local spawnXOffset = -7.0
         local spawnZOffset = 2.3

         if owningPlayerColor == "Red" then
            spawnXOffset = 7.0
            spawnZOffset = -2.3
         end

         Global.call("spawnCard", { playerColor = owningPlayerColor,
                                    cardCode = "09127",
                                    spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                    spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })
          Global.call("spawnCard", { playerColor = owningPlayerColor,
                                     cardCode = "09127",
                                     spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                     spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

         Global.call("spawnCard", { playerColor = owningPlayerColor,
                                    cardCode = "09126",
                                    spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                    spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "09126",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

         Global.call("spawnCard", { playerColor = owningPlayerColor,
                                    cardCode = "11129",
                                    spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                    spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

        Global.call("spawnCard", { playerColor = owningPlayerColor,
                                   cardCode = "11129",
                                   spawnPosition = { object.getPosition()[1]+spawnXOffset, object.getPosition()[2]+0.2, object.getPosition()[3]+spawnZOffset },
                                   spawnRotation = { object.getRotation()[1], object.getRotation()[2], object.getRotation()[3] } })

      elseif ((cardSet == 'CM') and (cardNumber == '146')) then
        -- For CM Z-6 Jetpack, spawn 1 resource token on the card.
        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}
        obj_parameters.position = {object.getPosition()[1]-1.5+0.7,object.getPosition()[2]+0.2,object.getPosition()[3]-1.5+0.7}
        local token = spawnObject(obj_parameters)
        local custom = {}
        custom.image = tokenplayerone.resource
        custom.thickness = 0.1
        custom.merge_distance = 5.0
        custom.stackable = false
        token.setCustomObject(custom)
      elseif ((cardSet == 'CM') and
              ((cardNumber == '113') or (cardNumber == '125') or (cardNumber == '142'))) then
        -- For CM Seeking Knowledge, CM Tactical Delay, or CM Improvised Explosive, spawn 2 resource tokens on the card.
        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}
        for i=1,2 do
          obj_parameters.position = {object.getPosition()[1]-1.5+(i*0.7),object.getPosition()[2]+0.2,object.getPosition()[3]-1.5+(i*0.7)}
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.resource
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end
      elseif ((cardSet == 'CM') and
              ((cardNumber == '33') or (cardNumber == '154'))) then
        -- For CM Merchant Freighter or CM TIE Bomber, spawn 3 resource tokens on the card.
        obj_parameters.type = 'Custom_Token'
        obj_parameters.rotation = {3.87674022, 0, 0.239081308}
        obj_parameters.scale = {0.227068469, 1, 0.227068469}
        for i=1,3 do
          obj_parameters.position = {object.getPosition()[1]-1.5+(i*0.7),object.getPosition()[2]+0.2,object.getPosition()[3]-1.5+(i*0.7)}
          local token = spawnObject(obj_parameters)
          local custom = {}
          custom.image = tokenplayerone.resource
          custom.thickness = 0.1
          custom.merge_distance = 5.0
          custom.stackable = false
          token.setCustomObject(custom)
        end
      else
        -- Nothing needs done here.
      end

      if (isDiceCard == true) then
        if (isElite == true) then
          obj_parameters.position = {object.getPosition()[1], object.getPosition()[2]+1, (object.getPosition()[3] + 1 + zOffset)}
          local dice = spawnObject(obj_parameters)
          dice.setCustomObject(custom)
        end
      end
    end

    -- For character cards, create XML GUI when the dice spawn.
    if (isCharacterCard == true) then
      -- Since attaching the GUI directly to the card would cause the GUI to rotate when the card rotates, use a GUI holder object.
      obj_parameters.type = 'BlockSquare'
      obj_parameters.position = {object.getPosition()[1], 0.02, object.getPosition()[3]}
      if (owner == 'Blue') then
        obj_parameters.rotation = {0, 0, 0}
      else
        obj_parameters.rotation = {0, 180, 0}
      end
      obj_parameters.scale = {1, 1, 1}
      obj_parameters.sound = false
      -- Note that both the character card and the GUI holder objects have scripts.
      obj_parameters.callback_function = function(newObject) initGUIHolder(object, newObject) end

      local cardGUIObject = spawnObject(obj_parameters)
    end
  else
    local linkedGUIHolder = object.getVar("linkedGUIHolder")

    -- If a GUI holder was linked and hidden, show it.
    if (linkedGUIHolder != nil) then
      -- Update the position.
      local cardPosition = object.getPosition()
      linkedGUIHolder.setPosition({x = cardPosition.x, y = 0.02, z = cardPosition.z})

      if ((linkedGUIHolder.UI.getAttribute("card_gui", "active") == "False") or
          (linkedGUIHolder.UI.getAttribute("card_gui", "active") == "false")) then
        linkedGUIHolder.UI.setAttribute("card_gui", "active", true)
        linkedGUIHolder.UI.setAttribute("opponent_card_gui", "active", true)

        -- Update the visibility to match the prefab owner.
        if (owner == 'Blue') then
          linkedGUIHolder.setRotation({0, 0, 0})
        else
          linkedGUIHolder.setRotation({0, 180, 0})
        end
        linkedGUIHolder.UI.setAttribute("card_gui", "visibility", owner)
        if (owner == 'Blue') then
          linkedGUIHolder.UI.setAttribute("opponent_card_gui", "visibility", 'Red|Grey|Black')
        else
          linkedGUIHolder.UI.setAttribute("opponent_card_gui", "visibility", 'Blue|Grey|Black')
        end
      end
    end
  end
end

function initGUIHolder(cardObject, holderObject)
  -- Set shield and damage values.
  -- TODO is there a way to save/load variables on objects like this?
  holderObject.setVar("shields", 0)
  holderObject.setVar("damage", 0)
  holderObject.setVar("owner", owner)

  holderObject.setLuaScript(Global.getVar("characterGUILuaScript"))
  Wait.time(function() finishInitGUIHolder(cardObject, holderObject) end, 0.2)

  cardObject.setVar("linkedGUIHolder", holderObject)
end

function finishInitGUIHolder(cardObject, holderObject)
  holderObject.UI.setAttribute("card_gui", "visibility", owner)
  holderObject.UI.setAttribute("card_gui", "active", true)
  if (owner == 'Blue') then
    holderObject.UI.setAttribute("opponent_card_gui", "visibility", 'Red|Grey|Black')
  else
    holderObject.UI.setAttribute("opponent_card_gui", "visibility", 'Blue|Grey|Black')
  end
  holderObject.UI.setAttribute("opponent_card_gui", "active", true)
end