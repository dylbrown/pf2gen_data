<!doctype html>
<html lang="en-US">
<head>
    <style>
        <#include "printableStyle.css">
    </style>
    <title>PF2 Printable Character Sheet</title>
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
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Melee Strikes</div>
            <div class="row-stretch" style="flex-grow: 0">
                <div class="weapon-label">Weapon 1</div>
                <div class="column">
                    <div class="row-stretch">
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Attack</div>
                        </div>
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Damage</div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="underlined weapon-traits"></div>
                        <div class="label">Traits</div>
                    </div>
                </div>
            </div>
            <div class="row-stretch" style="flex-grow: 0">
                <div class="weapon-label">Weapon 2</div>
                <div class="column">
                    <div class="row-stretch">
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Attack</div>
                        </div>
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Damage</div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="underlined weapon-traits"></div>
                        <div class="label">Traits</div>
                    </div>
                </div>
            </div>
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Ranged Strikes</div>
            <div class="row-stretch" style="flex-grow: 0">
                <div class="weapon-label">Ranged Weapon 1</div>
                <div class="column">
                    <div class="row-stretch">
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Attack</div>
                        </div>
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Damage</div>
                        </div>
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Range</div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="underlined weapon-traits"></div>
                        <div class="label">Traits</div>
                    </div>
                </div>
            </div>
            <div class="row-stretch" style="flex-grow: 0">
                <div class="weapon-label">Ranged Weapon 2</div>
                <div class="column">
                    <div class="row-stretch">
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Attack</div>
                        </div>
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Damage</div>
                        </div>
                        <div class="line">
                            <div class="underlined"></div>
                            <div class="label">Range</div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="underlined weapon-traits"></div>
                        <div class="label">Traits</div>
                    </div>
                </div>
            </div>
            <div class="sectionDivider">
                <hr>
            </div>
            <div class="sectionLabel">Actions and Activities</div>
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
                <#list character.skills as skill>
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
                </#list>
            </div>
        </div>
    </div>
</div>
</body>
</html>