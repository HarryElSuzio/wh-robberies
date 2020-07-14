# WH-Robberies

**Dependencies:**
[Mythic_Notify](https://github.com/JayMontana36/mythic_notify) (The script is configured to this version however could easily be changed if you know what to do)

[WH-outlawalert](https://github.com/WindiestHook381/wh_outlawalert) 

**Description**
This is a script I have made to utilise [pd-safe](https://forum.cfx.re/t/release-pd-safe-standalone-lua-safecracking-minigame/1231799) by [MrFrk](https://forum.cfx.re/u/mrfrk/summary). The idea of it is to replace esxholdup with a more interactive method however doesn't conflict with anything in it if you want to use both for whatever reason. It enables you to add spots to the map (Three different types, CashRegister, Safe and Vault) each of them have different random rewards (Which can be configured in config), different cooldowns (Which can be conifgured in config) and different amount of 'pins' to crack (Which can't be configured in config but is easy enough to change). This also currently gives you two ways of notifying police with the requires alerts: Straight up name and location or send an alert saying a camera has been triggered (configured for st-cctv but this is not required as it is a script that has to be purchased) which you can choose from. The script conatins 3 stores each with 2 cash registers and a safe in the backroom. The pacific standard vault is also in there by default too.

To add more cash registers/safes/vaults just add them into the *server.cfg*


(I have included the safe cracking minigame file in this resource for ease of download, I take zero credit for this, as said in a separate readme)

## How the cracking game works
Use **A** and **D** to move side to side, **W** to select current position and **S** to cancel.

Hopefully this explains it better, I can make a video tutorial if you think it would help and be easier than instructions :)

--

**Changelog**

29/06/2020 - Fixed issue with files, the script now works xD

03/07/2020 - README updated an changed the way of controlling minigame.

14/07/2020 - Changed how people get paid removing vulnerabilities by adding checks to see whether they actually have played the minigame. (This means the events can't be exploited!)

**Other Notes**

The cooldown system has been bodged really. It works but not how I would want it to so may come back to it and re do the whole thing now I know what needs to happen and where.
Might add an option so instead of the 3D text to use a specific configurable item nearby to start 'cracking'.

Any other suggestions let me know!

I have a long list of further scripts I would like to make so you will be hearing a lot more from me soon.
If you like my work then you could always support my coffee addiction and keep me going :)

<a href="https://www.buymeacoffee.com/windiesthook381" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>

## Support
I will try and be as active as I can on the FiveM forum however you may get a faster response in my discord or get help from any other developers around https://discord.gg/VXJz2Yw. I will also post all my releases and updates for any scripts there.

## Credits
@Danny3 for the outlaw alert.

@MrFrk for the safe cracking.

# Enjoy!
