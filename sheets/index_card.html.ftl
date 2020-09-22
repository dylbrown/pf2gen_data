[#ftl]
<!DOCTYPE html>
<html>
    <head>
        <title>PF2 Index Card</title>
        <style>
            [#include "index_card_style.css" /]
        </style>
    </head>
    <body>
        <div class="page">
            <div class="page-padding">
                <div class="page-col main">
                    <div class="page-row info">
                        <div id="name">${character.qualities.name}</div>
                        <div id="abc">${character.heritage} [#if !character.heritage?ends_with(character.ancestry)]${character.ancestry}[/#if] ${character.pclass} ${character.level}</div>
                    </div>
                    <div class="page-row stats">
                        <div class="labelled-box">
                            <div>${character.hp}</div>
                            <div>HP</div>
                        </div>
                        <div class="labelled-box">
                            <div>${character.combat.ac}</div>
                            <div>AC</div>
                        </div>
                        <div class="labelled-box">
                            <div>${character.combat.shield.ac?string.@s}</div>
                            <div>Shield</div>
                        </div>
                        <div class="pipe"></div>
                        <div class="labelled-box">
                            <div>${character.attributes.fortitude.total?string.@s}</div>
                            <div>Fort</div>
                        </div>
                        <div class="labelled-box">
                            <div>${character.attributes.reflex.total?string.@s}</div>
                            <div>Ref</div>
                        </div>
                        <div class="labelled-box">
                            <div>${character.attributes.will.total?string.@s}</div>
                            <div>Will</div>
                        </div>
                        <div class="pipe"></div>
                        <div class="labelled-box">
                            <div>${character.attributes.perception.total?string.@s}</div>
                            <div>Spot</div>
                        </div>
                        <div class="labelled-box">
                            <div>${character.attributes.athletics.total?string.@s}</div>
                            <div>Athl</div>
                        </div>
                        <div class="labelled-box">
                            <div>${character.attributes.acrobatics.total?string.@s}</div>
                            <div>Acro</div>
                        </div>
                        <div class="labelled-box">
                            <div>${character.attributes.stealth.total?string.@s}</div>
                            <div>Sneak</div>
                        </div>
                        <div class="labelled-box">
                            <div>${character.attributes.get("ClassDC", character.pclass.name).total + 10}</div>
                            <div>DC</div>
                        </div>
                    </div>
                    [#macro attackBlock attack]
                        <div class="page-row attack">
                            <div class="attack-name">${attack.name}</div>
                            <div>${attack.attack?string.@s}</div>
                            <div>[#list attack.damage.asList() as damage]
                                    ${damage?replace(" ", "")?replace("bludgeoning", " B")?replace("piercing", " P")?replace("slashing", " S")}[#sep]+[/#sep]
                            [/#list]</div>
                            <div class="attack-traits">
                                [#list attack.traits as trait]
                                    <div>${trait}</div>
                                [/#list]
                            </div>
                        </div>
                    [/#macro]
                    [#list character.combat.attacks as attack]
                        [@attackBlock attack=attack /]
                    [/#list]
                    [#list character.inventory as item]
                        [#if item.hasExtension("Weapon")]
                            [@attackBlock attack=item /]
                        [/#if]
                    [/#list]
                    [#list character.abilities as ability]
                        [#if ability.hasExtension("Activity")]
                            <div class="page-row action">
                                <div class="action-name">${ability.name} ([#switch ability.getExtensionByName("Activity").cost]
                    [#case "Free"]F[#break]
                    [#case "Reaction"]R[#assign reaction=true][#break]
                    [#case "One"]1[#break]
                    [#case "Two"]2[#break]
                    [#case "Three"]3[#break]
                [/#switch])</div>
                                <div>[#if ability.description?length > 45]${ability.description[0..!45]}[#else]${ability.description}[/#if]</div>
                            </div>
                        [/#if]
                    [/#list]
                    [#list character.spells.spellLists as listName, spellList]
                        [#if spellList.casterType == "Prepared"]
                            <div class="separator"></div><div class="page-row spells">
                            <b>Prepared ${spellList.tradition} ${listName} Spells (Attack ${character.attributes.get(spellList.spellAttacksAttribute?lower_case, listName).total?string.@s}, DC ${(10 + character.attributes.get(spellList.spellDCsAttribute?lower_case, listName).total)?string}) &#91;${spellList.castingability}&#93;</b>
                            [#list spellList.spellsKnown?reverse as levelSpells]
                                [#if levelSpells?size > 0]
                                    <br>
                                    [#assign level=spellList.spellsKnown?size - levelSpells?index - 1]
                                    <b>Level ${level} (${spellList.spellSlots[level]}/Day)</b>: [#list levelSpells as spell]
                                        ${spell.name}[#sep], [/#sep]
                                    [/#list]
                                [/#if]
                            [/#list]
                            </div>
                        [#elseif spellList.casterType == "Spontaneous"]
                                        <div class="separator"></div><div class="page-row spells">
                            <b>Spontaneous ${spellList.tradition} ${listName} Spells (Attack ${character.attributes.get(spellList.spellAttacksAttribute?lower_case, listName).total?string.@s}, DC ${(10 + character.attributes.get(spellList.spellDCsAttribute?lower_case, listName).total)?string}) &#91;${spellList.castingability}&#93;</b>
                            [#list spellList.spellsKnown?reverse as levelSpells]
                                [#if levelSpells?size > 0]
                                    <br>
                                    [#assign level=spellList.spellsKnown?size - levelSpells?index - 1]
                                    <b>Level ${level} (${spellList.spellSlots[level]}/Day)</b>: [#list levelSpells as spell]
                                        ${spell.name}[#sep], [/#sep]
                                    [/#list]
                                [/#if]
                            [/#list]
                            </div>
                        [/#if]
                    [/#list]
                    [#if character.spells.focusPointCount > 0]
                        <div class="separator"></div><div class="page-row spells">
                        <b>Focus Spells (${character.spells.focusPointCount} Points):</b>
                            [#list character.spells.spellLists as listName, spellList]
                                [#list spellList.focusSpells as spell]
                                    ${spell.name}[#sep], [/#sep]
                                [/#list]
                            [/#list]
                        </div>
                    [/#if]
                </div>
            </div>
        </div>
    </body>
</html>