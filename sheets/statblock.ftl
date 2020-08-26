[#ftl]
<!DOCTYPE html>
<html>
<head>
    <title>Output</title>
</head>
<style>
    @media screen {
    body {
        padding-right: 10px;
    }
    input {
        color: white;
        min-width: 3em;
        text-align: center;
    }
    }
    @media print {
    input {
        display: none;
    }
    }
</style>
<body style="overflow-y:scroll">
<h3>[#if character.qualities.name?has_content]${character.qualities.name}[#else]Unnamed[/#if]</h3>
    <p>
        <b>${character.pclass.name} ${character.heritage} [#if !character.heritage?ends_with(character.ancestry)]${character.ancestry}[/#if] ${character.level}</b><br />
        <b>Perception</b> ${character.attributes.perception.total?string.@s};
        <b>Languages</b>
        [#list character.qualities.languages as language]${language}[#sep], [/#sep][#else]None[/#list];
        <b>Senses</b>
        [#list character.qualities.senses as sense]
        ${sense}[#sep], [/#sep]
        [#else]None[/#list]
        <br />
        <b>Str</b> ${character.abilityMod.str?string.@s}, <b>Dex</b> ${character.abilityMod.dex?string.@s}, <b>Con</b> ${character.abilityMod.con?string.@s}, <b>Int</b> ${character.abilityMod.int?string.@s}, <b>Wis</b> ${character.abilityMod.wis?string.@s}, <b>Cha</b> ${character.abilityMod.cha?string.@s}<br />
        <b>Skills</b>
        [#list character.skills as skill]
        ${skill.name} ${skill.total?string.@s}[#sep], [/#sep]
        [/#list]
        <br />
        <b>Items</b>
        [#list character.inventory as item]
            ${item.count} ${item.name}[#sep], [/#sep]
        [#else]None[/#list]
        <hr />
        <b>AC</b> ${character.combat.ac}; <b>Fort</b> ${character.attributes.fortitude.total?string.@s}, <b>Ref</b> ${character.attributes.reflex.total?string.@s}, <b>Will</b> ${character.attributes.will.total?string.@s}<br />
<b>HP</b> ${character.hp}&nbsp;&nbsp;<input type="number" min="0" max="${character.hp}" value="${character.hp}"><br />
<b>Speed</b> ${character.speed} feet<br />
[#list character.spells.spellLists as listName, spellList]
    [#if spellList.casterType == "Prepared"]
        <hr />
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
    [#elseif spellList.casterType == "Spontaneous"]
        <hr />
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
    [/#if]
[/#list]

[#if character.spells.focusPointCount > 0]
<hr />
<b>Focus Spells (${character.spells.focusPointCount} Points):</b>
    [#list character.spells.spellLists as listName, spellList]
        [#list spellList.focusSpells as spell]
            ${spell.name}[#sep], [/#sep]
        [/#list]
    [/#list]
[/#if]
    <hr />
	[#assign count=0]
    [#list character.combat.attacks as item]
        [#if item.category == "Weapon" || item.category == "Ranged Weapon"]
			[#assign count++]
            [#if item.category == "Ranged Weapon"]
                <b>① Ranged</b>
            [#else]
                <b>① Melee</b>
            [/#if]
            ${item.name} ${item.attack?string.@s}
            [#list item.traits]([#items as customTrait]${customTrait.name}[#sep], [/#sep][/#items])[/#list]
			, <b>Damage</b>
                        [#list item.damage.asList() as damage]
                            ${damage}[#sep]<br> + [/#sep]
                        [/#list]
			[#sep]<br>[/#sep]
        [/#if]
	[/#list]
    [#list character.inventory as item]
        [#if item.category == "Weapon" || item.category == "Ranged Weapon"]
			[#assign count++]
            [#if item.category == "Ranged Weapon"]
                <b>① Ranged</b>
            [#else]
                <b>① Melee</b>
            [/#if]
            ${item.name} ${item.attack?string.@s}
            [#list item.traits]([#items as customTrait]${customTrait.name}[#sep], [/#sep][/#items])[/#list]
			, <b>Damage</b> 
                        [#list item.damage.asList() as damage]
                            ${damage}[#sep]<br> + [/#sep]
                        [/#list]
			[#sep]<br>[/#sep]
        [/#if]
	[/#list]
	[#if count gt 0]<hr />[/#if]
	[#list character.abilities as ability]
		<p>
		<b>${ability.name}</b><br>
		[#assign reaction=false]
		[#if ability.hasExtension("Activity")]<b>[#switch ability.getExtensionByName("Activity").cost]
			[#case "Free"]Ⓕ [#break]
			[#case "Reaction"]Ⓡ [#assign reaction=true][#break]
			[#case "One"]① [#break]
			[#case "Two"]② [#break]
			[#case "Three"]③ [#break]
		[/#switch] </b> [/#if]${ability.description}
		[#if reaction]
			<br><b>Trigger</b> ${ability.getExtensionByName("Activity").trigger}
		[/#if]
		</p>
	[/#list]
    </p>
</body>
</html>