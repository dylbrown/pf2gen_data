[#ftl]
[#assign creature=creatures[0]]
<!DOCTYPE html>
<html>
    <head>
        <title>PF2 Index Card</title>
        <style>
            [#include "index_card_style.css" /]
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="page">
            <div class="page-padding">
                <div class="page-col main">
                    <div class="page-row info">
                        <div id="name">${creature.name}</div>
                        <div id="abc">${creature.family} ${creature.level}
                            ${r"["}[#list creature.traits as trait]${trait}[#sep], [/#sep][/#list]${r"]"}
                        </div>
                    </div>
                    <div class="page-row stats" style="width: 60%;">
                        <div class="labelled-box">
                            <div>${creature.hp}</div>
                            <div>HP</div>
                        </div>
                        <div class="labelled-box">
                            <div>${creature.ac}</div>
                            <div>AC</div>
                        </div>
                        <div class="labelled-box">
                            <div>${creature.modifiers.perception?string.@s}</div>
                            <div>Spot</div>
                        </div>
                        <div class="pipe"></div>
                        <div class="labelled-box">
                            <div>${creature.modifiers.fortitude?string.@s}</div>
                            <div>Fort</div>
                        </div>
                        <div class="labelled-box">
                            <div>${creature.modifiers.reflex?string.@s}</div>
                            <div>Ref</div>
                        </div>
                        <div class="labelled-box">
                            <div>${creature.modifiers.will?string.@s}</div>
                            <div>Will</div>
                        </div>
                        <div class="pipe"></div>
                        <div></div>
                    </div>
                    <div class="page-col" id="skills">
                        <div class="page-row">
                            [#list 0..5 as i]
                            [#if i gte creature.skilllist?size]
                                [#break]
                            [/#if]
                            <div class="labelled-box">
                                <div>${creature.skilllist[i].value?string.@s}</div>
                                [#assign name=creature.skilllist[i].name]
                                <div>${name[0..((name?length < 5)?then(name?length-1,4))]}</div>
                            </div>
                            [/#list]
                        </div>
                        [#if creature.skilllist?size gt 6]
                        <div class="page-row">
                            [#list 6..11 as i]
                            [#if i gte creature.skilllist?size]
                            [#break]
                            [/#if]
                            <div class="labelled-box">
                                <div>${creature.skilllist[i].value?string.@s}</div>
                                [#assign name=creature.skilllist[i].name]
                                <div>${name[0..((name?length < 5)?then(name?length-1,4))]}</div>
                            </div>
                            [/#list]
                        </div>
                        [#if creature.skilllist?size gt 12]
                        <div class="page-row">
                            [#list 12..17 as i]
                            [#if i gte creature.skilllist?size]
                            [#break]
                            [/#if]
                            <div class="labelled-box">
                                <div>${creature.skilllist[i].value?string.@s}</div>
                                [#assign name=creature.skilllist[i].name]
                                <div>${name[0..((name?length < 5)?then(name?length-1,4))]}</div>
                            </div>
                            [/#list]
                        </div>
                        [/#if]
                        [/#if]
                        [#if creature.acmods?length > 0]
                        <div class="page-row">
                            <div style="font-size:.7em">AC ${creature.acmods}</div>
                        </div>
                        [/#if]
                    </div>
                    [#macro attackBlock attack]
                    <div class="page-row attack">
                        <div class="attack-name">${attack.name}</div>
                        <div>${attack.modifier?string.@s}</div>
                        <div>${attack.damage}</div>
                        <div class="attack-traits">
                            [#list attack.traits as trait]
                            <div>${trait}</div>
                            [/#list]
                        </div>
                    </div>
                    [/#macro]
                    [#list creature.attacks as attack]
                        [@attackBlock attack=attack /]
                    [/#list]
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function align(){
                const statsTop = $(".stats").first().position().top;
                let skills = $("#skills").first();
                let spells = $(".spells").first();
                skills.css("top", statsTop);
                const gap = spells.position().top - skills.position().top;
                skills.css("min-height", "calc("+gap+"px - .05in)");
                spells.css("top", Math.max(skills.height() - gap, 0))
            }
            $('document').ready(align);
            $('document').resize(align);
        </script>
    </body>
</html>