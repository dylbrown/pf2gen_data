<!DOCTYPE html>
<html>
<head>
    <title>Output</title>
</head>
<body>
<h3>${character.name}</h3>
    <p>
        <b>${character.pclass.name} ${character.ancestry.name} ${character.level}</b><br />
        <b>Perception</b> ${character.attributes.perception.total?string.@s}<br />
        <b>Languages</b>
        <#list character.languages as language>
            ${language}<#sep>, </#sep>
        <#else>None</#list>
        <br />
        <b>Skills</b>
        <#list character.skills as skill>
            ${skill.name} ${skill.mod?string.@s}<#sep>, </#sep>
        </#list>
        <br />
        <b>Str</b> ${character.abilityMod.str?string.@s}, <b>Dex</b> ${character.abilityMod.dex?string.@s}, <b>Con</b> ${character.abilityMod.con?string.@s}, <b>Int</b> ${character.abilityMod.int?string.@s}, <b>Wis</b> ${character.abilityMod.wis?string.@s}, <b>Cha</b> ${character.abilityMod.cha?string.@s}<br />
        <b>Items</b>
        <#list character.inventory as item>
            ${item.count} ${item.stats.name}<#sep>, </#sep>
        <#else>None</#list>
        <hr />
        <b>AC</b> ${character.ac}; <b>Fort</b> ${character.attributes.fortitude.total?string.@s}, <b>Ref</b> ${character.attributes.reflex.total?string.@s}, <b>Will</b> ${character.attributes.will.total?string.@s}<br />
        <b>HP</b> ${character.hp}<br />
<b>Speed</b> ${character.speed} feet<br />
        <hr />
	<#assign count=0>
    <#list character.attacks as item>
        <#if Weapon.isInstance(item.stats)>
			<#assign count++>
            <#if item.stats.isRanged()>
                <b>① Ranged</b>
            <#else>
                <b>① Melee</b>
            </#if>
            ${item.stats.name} ${item.attack?string.@s}
            <#list item.stats.traits>(<#items as customTrait>${customTrait.name}<#sep>, </#sep></#items>)</#list>
			, <b>Damage</b> ${item.stats.damage}<#if item.damagemod != 0>${item.damagemod?string.@s}</#if>
			${item.stats.damageType}
			<#sep><br></#sep>
        </#if>
	</#list>
    <#list character.inventory as item>
        <#if Weapon.isInstance(item.stats)>
			<#assign count++>
            <#if item.stats.isRanged()>
                <b>① Ranged</b>
            <#else>
                <b>① Melee</b>
            </#if>
            ${item.stats.name} ${item.attack?string.@s}
            <#list item.stats.traits>(<#items as customTrait>${customTrait.name}<#sep>, </#sep></#items>)</#list>
			, <b>Damage</b> ${item.stats.damage}<#if item.damagemod != 0>${item.damagemod?string.@s}</#if>
			${item.stats.damageType}
			<#sep><br></#sep>
        </#if>
	</#list>
	<#if count gt 0><hr /></#if>
	<#list character.abilities as ability>
		<p>
		<b>${ability.name}</b><br>
		<#assign reaction=false>
		<#if Activity.isInstance(ability)><b><#switch ability.cost>
			<#case "Free">Ⓕ <#break>
			<#case "Reaction">Ⓡ <#assign reaction=true><#break>
			<#case "One">① <#break>
			<#case "Two">② <#break>
			<#case "Three">③ <#break>
		</#switch> </b> </#if>${ability.desc}
		<#if reaction>
			<br><b>Trigger</b> ${ability.trigger}
		</#if>
		</p>
	</#list>
    </p>
</body>
</html>