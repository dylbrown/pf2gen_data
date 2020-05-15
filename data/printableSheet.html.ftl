[#ftl]
<!doctype html>
<html lang="en-US">
<head>
    <style>
        [#include "printableStyle.css"]
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>PF2 - ${character.name}</title>
</head>
<body>
<div id="page1">
    <div id="printBorder"></div>
    <div id="leftThird">
        <div class="column" style="justify-content: stretch">
            <div>PATHFINDER CHARACTER SHEET</div>
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel" style="text-transform: uppercase">Ability Scores</div>
            <div id="ability-grid">
                <div class="inverted numBox rounded " style="font-weight: bold">STR</div>
                <div class="line">
                    <div class="underlined-roll">${character.abilityMod.str?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityScore.str}</div>
                    <div class="label">Score</div>
                </div>
                <div class="inverted numBox rounded " style="font-weight: bold">INT</div>
                <div class="line">
                    <div class="underlined-roll">${character.abilityMod.int?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityScore.int}</div>
                    <div class="label">Score</div>
                </div>
                <div class="inverted numBox rounded " style="font-weight: bold">DEX</div>
                <div class="line">
                    <div class="underlined-roll">${character.abilityMod.dex?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityScore.dex}</div>
                    <div class="label">Score</div>
                </div>
                <div class="inverted numBox rounded " style="font-weight: bold">WIS</div>
                <div class="line">
                    <div class="underlined-roll">${character.abilityMod.wis?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityScore.wis}</div>
                    <div class="label">Score</div>
                </div>
                <div class="inverted numBox rounded " style="font-weight: bold">CON</div>
                <div class="line">
                    <div class="underlined-roll">${character.abilityMod.con?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityScore.con}</div>
                    <div class="label">Score</div>
                </div>
                <div class="inverted numBox rounded " style="font-weight: bold">CHA</div>
                <div class="line">
                    <div class="underlined-roll">${character.abilityMod.cha?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityScore.cha}</div>
                    <div class="label">Score</div>
                </div>
            </div>
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Misc.</div>
            <div class="row-between">
                <div class="line">
                    <div class="numBox rounded">${character.speed} ft.</div>
                    <div class="label">Speed</div>
                </div>
                <div class="line">
                    <div class="numBox rounded"></div>
                    <div class="label">Class DC</div>
                </div>
                <div class="line">
                    <div class="numBox"></div>
                    <div class="label">Hero Points</div>
                </div>
            </div>
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Health</div>
            <div class="row-between">
                <div class="line" style="flex-grow: 0">
                    <div class="numBox rounded">${character.hp}</div>
                    <div class="label">Max</div>
                </div>
                <div class="line">
                    <div class="numBox"></div>
                    <div class="label">Current</div>
                </div>
                <div class="line">
                    <div class="numBox"></div>
                    <div class="label">Temporary</div>
                </div>
            </div>
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Armor Class</div>
            <div id="ac-grid">
                <div class="center-right rollLabel">AC</div>
                <div class="line">
                    <div class="underlined-roll">${character.ac}</div>
                    <div class="label">Total</div>
                </div>
                <div class="line">
                    <div class="numBox rounded" style="border:none">10</div>
                    <div class="box-label">Base</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityMod.dex?string.@s}</div>
                    <div class="box-label">DEX</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.armorProficiency?string.@s}</div>
                    <div class="box-label">Prof</div>
                </div>
                <div class="line">
                    <div class="numBox">${character.armor.ac?string.@s}</div>
                    <div class="box-label">Item</div>
                </div>
                <div class="line">
                    <div class="numBox"></div>
                    <div class="box-label">Temp</div>
                </div>
            </div>
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Senses + Saves</div>
            <div id="rolls-grid">
                <div class="center-right rollLabel">PERCEPTION</div>
                <div class="line">
                    <div class="underlined-roll">${character.attributes.perception.total?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityMod.wis?string.@s}</div>
                    <div class="label">WIS</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.attributes.perception.proficiencyMod?string.@s}</div>
                    <div class="label">Prof</div>
                </div>
                <div class="line">
                    <div class="numBox">${character.attributes.perception.itemBonus?string.@s}</div>
                    <div class="label">Item</div>
                </div>
                <div class="line">
                    <div class="numBox"></div>
                    <div class="label">Temp</div>
                </div>
                <div style="grid-column-end: span 6; justify-self: stretch; align-items: flex-end" class="row">
                    <div class="label">Senses</div>
                    <div class="underlined"></div>
                </div>
                <div class="center-right rollLabel">FORTITUDE</div>
                <div class="line">
                    <div class="underlined-roll">${character.attributes.fortitude.total?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityMod.con?string.@s}</div>
                    <div class="label">CON</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.attributes.fortitude.proficiencyMod?string.@s}</div>
                    <div class="label">Prof</div>
                </div>
                <div class="line">
                    <div class="numBox">${character.attributes.fortitude.itemBonus?string.@s}</div>
                    <div class="label">Item</div>
                </div>
                <div class="line">
                    <div class="numBox"></div>
                    <div class="label">Temp</div>
                </div>
                <div class="center-right rollLabel">REFLEX</div>
                <div class="line">
                    <div class="underlined-roll">${character.attributes.reflex.total?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityMod.dex?string.@s}</div>
                    <div class="label">DEX</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.attributes.reflex.proficiencyMod?string.@s}</div>
                    <div class="label">Prof</div>
                </div>
                <div class="line">
                    <div class="numBox">${character.attributes.reflex.itemBonus?string.@s}</div>
                    <div class="label">Item</div>
                </div>
                <div class="line">
                    <div class="numBox"></div>
                    <div class="label">Temp</div>
                </div>
                <div class="center-right rollLabel">WILL</div>
                <div class="line">
                    <div class="underlined-roll">${character.attributes.will.total?string.@s}</div>
                    <div class="label">Mod</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.abilityMod.wis?string.@s}</div>
                    <div class="label">WIS</div>
                </div>
                <div class="line">
                    <div class="numBox rounded">${character.attributes.will.proficiencyMod?string.@s}</div>
                    <div class="label">Prof</div>
                </div>
                <div class="line">
                    <div class="numBox">${character.attributes.will.itemBonus?string.@s}</div>
                    <div class="label">Item</div>
                </div>
                <div class="line">
                    <div class="numBox"></div>
                    <div class="label">Temp</div>
                </div>
            </div>
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Weapon & Armor Proficiencies</div>
            <div id="prof-grid">
                <div class="underlined">${character.attributes.unarmed.total?string.@s}</div>
                <div class="underlined">${character.attributes.simpleweapons.total?string.@s}</div>
                <div class="underlined">${character.attributes.martialweapons.total?string.@s}</div>
                <div class="underlined">${character.attributes.advancedweapons.total?string.@s}</div>
                <div class="label">Unarmed</div>
                <div class="label">Simple</div>
                <div class="label">Martial</div>
                <div class="label">Advanced</div>
                <div class="underlined">${character.attributes.unarmored.total?string.@s}</div>
                <div class="underlined">${character.attributes.lightarmor.total?string.@s}</div>
                <div class="underlined">${character.attributes.mediumarmor.total?string.@s}</div>
                <div class="underlined">${character.attributes.heavyarmor.total?string.@s}</div>
                <div class="label">Unarmored</div>
                <div class="label">Light</div>
                <div class="label">Medium</div>
                <div class="label">Heavy</div>
            </div>
        </div>
    </div>
    <div id="middleThird">
        <div class="column" style="justify-content: flex-start">
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Character Info</div>
            <div id="info-grid">
                <div class="line" style="grid-row-end: span 2; grid-column-end: span 2">
                    <div class="underlined wrap">${character.name}</div>
                    <div class="label">Character Name</div>
                </div>
                <div class="line" style="grid-column-end: span 2">
                    <div class="underlined">${character.heritage} ${character.ancestry}</div>
                    <div class="label">Ancestry & Heritage</div>
                </div>
                <div class="line" style="grid-column-end: span 2">
                    <div class="underlined">${character.background}</div>
                    <div class="label">Background</div>
                </div>
                <div class="line" style="grid-column-end: span 2">
                    <div class="underlined">${character.player}</div>
                    <div class="label">Player</div>
                </div>
                <div class="line" style="grid-column-end: span 2">
                    <div class="underlined">${character.pclass}</div>
                    <div class="label">Class</div>
                </div>
                <div class="line">
                    <div class="underlined">${character.alignment}</div>
                    <div class="label">Alignment</div>
                </div>
                <div class="line">
                    <div class="underlined"><!--TODO--></div>
                    <div class="label">Deity</div>
                </div>
                <div class="line">
                    <div class="underlined">${character.ancestry.size}</div>
                    <div class="label">Size</div>
                </div>
                <div class="line">
                    <div class="underlined"><!--TODO--></div>
                    <div class="label">Traits</div>
                </div>
            </div>
[#macro weaponBlock weapon type]
    [#if type == "melee"]
        <div class="row-stretch" style="flex-grow: 0">
            <div class="weapon-label">${weapon.name}</div>
            <div class="column">
                <div class="row-stretch">
                    <div class="line">
                        <div class="underlined">${weapon.attack?string.@s}</div>
                        <div class="label">Attack</div>
                    </div>
                    <div class="line">
                        <div class="underlined weapon-info">
                            [#list weapon.damage.asList() as damage]
                                ${damage}[#sep]<br> + [/#sep]
                            [/#list]
                        </div>
                        <div class="label">Damage</div>
                    </div>
                </div>
                <div class="line">
                    <div class="underlined weapon-traits">
                        [#list weapon.traits as trait]
                            ${trait}[#sep], [/#sep]
                    [/#list]
                </div>
                    <div class="label">Traits</div>
                </div>
            </div>
        </div>
    [#elseif type == "ranged"]
        <div class="row-stretch" style="flex-grow:0">
            <div class="weapon-label">${weapon.name}</div>
            <div class="column">
                <div class="row-stretch">
                    <div class="line">
                        <div class="underlined weapon-info">${weapon.attack?string.@s}</div>
                        <div class="label">Attack</div>
                    </div>
                    <div class="line">
                        <div class="underlined weapon-info">
                            [#list weapon.damage.asList() as damage]
                                ${damage}[#sep]<br> + [/#sep]
                            [/#list]
                        </div>
                        <div class="label">Damage</div>
                    </div>
                    <div class="line">
                        <div class="underlined weapon-info">${weapon.range} ft.</div>
                        <div class="label">Range</div>
                    </div>
                </div>
                <div class="line">
                    <div class="underlined weapon-traits">
                        [#list weapon.traits as trait]
                            ${trait}[#sep], [/#sep]
                        [/#list]
                    </div>
                    <div class="label">Traits</div>
                </div>
            </div>
        </div>
    [/#if]
[/#macro]
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Melee Strikes</div>
            [#list character.attacks as attack]
                [#if item.category == "Weapon"]
                    [@weaponBlock weapon=item type="melee"/]
                [/#if]
            [/#list]
            [#list character.inventory as item]
                [#if item.category == "Weapon"]
                    [@weaponBlock weapon=item type="melee"/]
                [/#if]
            [/#list]
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Ranged Strikes</div>
            [#list character.attacks as attack]
                [#if item.category == "Ranged Weapon"]
                    [@weaponBlock weapon=item type="ranged"/]
                [/#if]
            [/#list]
            [#list character.inventory as item]
                [#if item.category == "Ranged Weapon"]
                    [@weaponBlock weapon=item type="ranged"/]
                [/#if]
            [/#list]
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Actions and Activities</div>
[#macro actionBlock action]
[#assign reaction=false]
<div class="row-stretch action" style="flex-grow: 0">
    <div class="action-icon">[#switch action.cost]
        [#case "Free"]F[#break]
        [#case "Reaction"]R[#assign reaction=true][#break]
        [#case "One"]1[#break]
        [#case "Two"]2[#break]
        [#case "Three"]3[#break]
        [/#switch]</div>
    <div class="action-label">${action.name}</div>
    <div class="column-wrap action-details">
        [#if action.traits?has_content]
        <div class="line">
            <div class="underlined">[#list action.traits as trait]${trait}[#sep], [/#sep][/#list]</div>
            <div class="label">Traits</div>
        </div>
        [/#if]
        [#if reaction]
        <div class="line">
            <div class="underlined">${action.trigger}</div>
            <div class="label">Trigger</div>
        </div>
        [/#if]
        [#if action.frequency?has_content]
        <div class="line">
            <div class="underlined">${action.frequency}</div>
            <div class="label">Frequency</div>
        </div>
        [/#if]
        [#if action.requirements?has_content]
        <div class="line">
            <div class="underlined">${action.requirements}</div>
            <div class="label">Requirements</div>
        </div>
        [/#if]
    </div>
</div>
[/#macro]
            <div class="column" style="flex-grow: 0">
                [#assign notFirst=false]
                [#list character.abilities as ability]
                    [#if Activity.isInstance(ability)]
                        [#if notFirst]
                            <div class="action-divider"></div>
                        [/#if]
                        [@actionBlock action=ability /]
                        [#assign notFirst=true]
                    [/#if]
                [/#list]
            </div>
        </div>
    </div>
    <div id="rightThird">
        <div class="column" style="justify-content: stretch">
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Skills</div>
            <div id="skills-grid">
                <div class="label">Skill</div>
                <div class="label">Total</div>
                <div class="label">Stat</div>
                <div class="label">Prof</div>
                <div class="label">Item</div>
                [#list character.skills as skill]
                    <div class="skill-label">${skill.name}</div>
                    <div class="line">
                        <div class="underlined-roll">${skill.total?string.@s}</div>
                    </div>
                    <div style="align-self: center; text-transform: uppercase">${skill.ability}</div>
                    <div class="line">
                        <div class="numBox rounded">${skill.proficiencyMod?string.@s}</div>
                    </div>
                    <div class="line">
                        <div class="numBox">${skill.itemBonus?string.@s}</div>
                    </div>
                [/#list]
            </div>
        </div>
    </div>
</div>
[#macro abilityPart label content=""]
    [#if content?has_content]
        <div class="line">
            <div class="underlined" style="flex-direction: row">
                ${content}
            </div>
            <div class="label">${label}</div>
        </div>
    [/#if]
[/#macro]
<div id="page2">
    <div class="printBorder"></div>
    <div class="abilities-flex first-page">
        [#list character.abilities as ability]
        <div class="ability-box">
            [#if Activity.isInstance(ability)]<div class="action-icon">
                [#switch ability.cost]
                    [#case "Free"]F[#break]
                    [#case "Reaction"]R[#assign reaction=true][#break]
                    [#case "One"]1[#break]
                    [#case "Two"]2[#break]
                    [#case "Three"]3[#break]
                [/#switch]
            </div>[/#if]
            <div class="ability-title">
                ${ability.name}
            </div>
            [@abilityPart label="Source" content=ability.source /]
            [@abilityPart label="Traits" content=ability.traits?join(", ") /]
            [@abilityPart label="Requirements" content=ability.requirements /]
            [@abilityPart label="Frequency" content=ability.frequency /]
            [@abilityPart label="Trigger" content=ability.trigger /]
            <div class="ability-description">${ability.desc}</div>
        </div>
        [/#list]
    </div>
</div>
<div id="page3">
    <div class="printBorder"></div>
    <div class="abilities-flex second-page"></div>
</div>
<div class="separator" style="top: -3px"></div>
<div class="separator" style="top: calc(100vh - 3px)"></div>
<div class="separator" style="top: calc(200vh - 3px)"></div>
</body>
<script>
    let firstPage = $(".abilities-flex.first-page");
    let secondPage = $(".abilities-flex.second-page");
    let lastChild = firstPage.children(":last-child");
    while(lastChild.position().left >= firstPage.width()) {
        lastChild.prependTo(secondPage);
        lastChild = firstPage.children(":last-child");
    }
</script>
</html>