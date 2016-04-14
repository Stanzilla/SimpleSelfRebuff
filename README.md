SimpleSelfRebuff (SSR) is an addon aimed at easing rebuffing yourself.

# Quick usage

-   Enable or select the buffs you want from the predefined list, using the command line (/ssr), the LibDataBroker object (through some LDB display like Fortress, ButtonBin, Barrel, ...) or the Blizzard addon panel of the interface menu.
-   Use the mousewheel to rebuff when needed.

# Features

-   SSR monitors your own buffs and compares them against your selection. If a buff is missing or about to fade, SSR overrides the mousewheel binding to cast it.
-   If the expected buff is overriden by another buff of the same kind (e.g. having one tracking active whilst you choose another one), SSR keeps the current buff but will not recast it.
-   SSR provides a reminder that can output warning in several ways (Blizzard chat and error, SCT, MikSBT) for missing or next-to-fade buffs.
-   SSR disables the binding override in combat and also disables casting of buffs that would force you to dismount or get out of stealth.
-   SSR automatically handles spell reagents, cooldowns and rage/mana cost : if some resource is missing, the spell is ignored.

# Modules

SSR comes with four built-in modules. They can be disabled individually.

## CastBindings
Handle mouse wheel and key bindings. This module is used to automatically cast the buffs. You could disable it if you wanted only the reminder and cast the spells yourself. Notice the bindings are temporary, so you can bind rebuffing to a key you use frequently.

## Reminder
Remind you of missing or about to expire buffs. Uses LibSink-2.0 so it can send the messages to several displays and provides support for the LibToast library so it can produce pretty popups like this:

![Toast reminders](https://dl.dropbox.com/u/22349357/toast3.fw.png)

## DataObject
Create a LibDataBroker object, that could be displayed by an LibDataBroker display addon (like Fortress, StatBlockCore, ButtonBin, ...). This replaces the old FuBarPlugin module (you can use Broker2FuBar to have LibDataBroker objects displayed in FuBar). This module has no option.

# Using SSR in a macro

With the CastBindings module, SSR can be triggered from a macro using the following line :

`/click SimpleSelfRebuffButton`

It will not do anything when all buff are present.

The following macro will use SSR out of combat but cast Inner fire in combat:

```lua
#showtooltip: Inner Fire
/click SimpleSelfRebuffButton
/cast [combat] Inner Fire
```
