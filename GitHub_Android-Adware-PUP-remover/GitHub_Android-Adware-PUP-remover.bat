@echo off
echo.
echo.	This script try to reset and uninstall common Android adware or unwanted app
echo.	Debug mode (ADB) must be enabled and allowed
echo.	
echo.	This script work in NON administrator mode!
echo.
PAUSE
cls
echo.
echo.	
echo.	this script will automatically start optimization
echo.	when the device will be in ADB authorized mode
echo.
echo.
PAUSE
echo.
set M=.
SET /P M=Continue? Y/N  
IF /I %M%==Y GOTO INITIAL
echo.
echo.
echo GOODBYE!
timeout 3
exit

:INITIAL
cls
set devicestatus=
set devicestatus1=
adb get-state > "%temp%/exportDB.txt" && SET /P devicestatus=<"%temp%/exportDB.txt"
fastboot devices > "%temp%/exportDB.txt" && SET /P devicestatus1=<"%temp%/exportDB.txt"
IF /I "%devicestatus1%" NEQ "" (
	SET devicestatus=fastboot
		)
IF /I "%devicestatus%" EQU "device" (
		echo.
		echo OK! 
		echo.
		color 1f
		timeout 3
		GOTO REMOVER
		)
IF /I "%devicestatus%" EQU "fastboot" (
		echo.
		echo DEVICE IN BOOTLOADER MODE!
		echo.
		fastboot reboot
		timeout 40
		GOTO INITIAL
		)
IF /I "%devicestatus%" EQU "" (
		echo.
		echo NO DEVICE FOUND!
		echo make sure Debug USB is active and allowed
		echo.
		timeout 3
		GOTO INITIAL
		)

		
:REMOVER
echo.
echo. 	WORK IN PROGRESS....
echo.
adb shell pm list packages | sort > %temp%\lista_ottimizzazione.txt
for %%X in (

::Gruppo_Microsoft
com.microsoft.office.excel
com.microsoft.office.onenote
com.microsoft.office.powerpoint
com.microsoft.office.word
com.microsoft.skydrive

::Gruppo_APP_TIM
it.telecomitalia.biblet
it.telecomitalia.calcio
it.telecomitalia.centoottantasette
it.telecomitalia.cubogiochi
it.telecomitalia.cubovision
it.telecomitalia.selectedbytim
com.telecomitalia.cubomusica
it.telecomitalia.timmobility
it.telecomitalia.audiolibri
it.telecomitalia.timinternet
it.telecomitalia.timcloud
it.telecomitalia.launcher
it.telecomitalia.wallet
it.sogetel.timwidget
it.telecomitalia.timmagicbox
it.telecomitalia.TIMNavigator
it.telecomitalia.timsocial
it.telecomitalia.timstore
it.telecomitalia.tuutuutim
it.telecomitalit.timcafe
it.telecomitalia.la7tg

::Gruppo_APP_TRE
com.twitter.android
h3g.it.all_inmovie
it.h3g.allingames
it.h3g.allinmusic
it.h3g.areaclienti3
it.h3g.myphone
it.h3g.myshoppinglist
it.h3g.news.affariitaliani
it.h3g.sport.calcio.dilettanti
it.h3g.sport.diretta.serieaeb
air.it.h3g.games.bimbi
com.buongiorno.widget.it_chefbook
com.buongiorno.widget.it_cinemapp
com.buongiorno.widget.it_goldstarsecret
com.buongiorno.widget.it_iloveshopping
it.h3g.appbox.nerostark.com

::Gruppo_APP_VODAFONE
com.vodafone.addressbook
com.vodafone.android.featurewidget
com.vodafone.android.myweb.launcher
com.vodafone.cloud
it.vodafone.calcio
com.vodafone.smhs

::Gruppo_CLEANER/ANTIVIRUS
com.cleanmaster.mguard
com.cleanmaster.security
com.cmsecurity.wifisecurity
com.qihoo.security
com.antivirus
com.lionmobi.powerclean
com.guardian.security.pri
com.apusapps.tools.booster
com.ehawk.antivirus.applock.wifi
com.zrgiu.antivirus
com.appall.TrashForApps
com.jb.security
com.antivirusvip.antivirusstock
com.stranger.maxboost
com.lm.powersecurity
com.phoenix.clean
com.hermes.superb.booster
mac.clean.security.memory.booster.battery
com.turboc.cleaner
com.clean.speed.cleaner.booster.master.device
com.free.antiviruspro.rinix
com.powerd.cleaner
com.dianxinos.optimizer.duplay
com.nitro.underground
com.qihoo.security.lite
com.prosec.vaccine
memory.clean.booster.security.junkremoval

::Gruppo_ADAWARE/PUP
com.messengerfortango.freetangovideocallsapptips
com.sgiggle.production
messenger.messenger.messenger.messenger
messenger.social.chat.apps
com.facebook.appmanager
com.cmcm.locker
com.ijinshan.kbatterydoctor_en
carbonfibre.wallpaperguru
com.happyhollow.flash.torchlight
com.ksmobile.launcher
com.surpax.ledflashlight.panel
uk.amazon.mShop.android
com.lionmobi.netmaster
org.wahtod.wififixer
com.qrcode.reader.gcb
abs.workout.fitness.tabata.hiit.stomach
com.fasttrack.security
com.sweet.emoticon.love.screen
com.lionmobi.battery
com.link.messages.sms
com.fotoable.snapfilters
com.honeycomb.launcher
browser4g.fast.internetwebexplorer
com.peel.app
com.kaweapp.webexplorer
com.narkira.compassmilitary
com.starxmedia.map.compass.free
com.whatsapp.messenger.videocall.update.status
com.marcuselldev.updaterforwhatsapp
com.apusapps.emo_launcher
com.xpro.camera.lite
com.emoticon.screen.home.launcher
messenger.social.chat.apps
com.fulminesoftware.batteryindicator
com.flashlight.brightest.beacon.torch
walking.pedometer.fit.stepcounter
com.robincleaner.lite
step.tracker.stepcounter.walking
homeworkout.homeworkouts.noequipment


::Gruppo_APP_OBSOLETE
com.sec.chaton
com.dropbox.android
com.sec.android.cloudagent.dropboxoobe
com.blurb.checkout
com.expo2015.officialguide
com.gameloft.android.GloftANIF
com.gameloft.android.GloftDMKF
com.gameloft.android.GloftSCCA
com.gameloft.android.GloftSMIF
com.gameloft.android.GloftCRSM
com.gameloft.android.GloftDBMF
com.gameloft.android.GloftPDMF
com.gameloft.android.GloftPZOR
com.gameloft.android.GloftRF15
com.gameloft.android.GloftSMIM
com.gameloft.android.GloftJDMP
com.gameloft.android.GloftBBPM
com.gameloft.android.GloftAGMP
com.mobilesrepublic.appy
com.huawei.gamebox.global
com.phonegap.demo
cn.wps.moffice_eng
com.bitcasa.android.drive
com.applift.huaweihub
com.zinio.mobile.android.reader
com.zinio.android.settings
com.youthhr.phonto
com.zentertain.videoflip
com.Slide.Show.Maker.With.Music
com.cyberlink.youcammakeup
com.rhmsoft.fm.hd
com.samsung.videohub
com.sec.android.app.gamehub
com.sec.readershub
com.sec.readershub2.store
com.sec.msc.learninghub
com.bloomberg.bbwa

::Gruppo_TASTIERE
com.jb.emoji.gokeyboard
com.fancy.neon.keyboard
panda.keyboard.emoji.theme
com.riffsy.FBMGIFApp
com.smartkeyboard.emoji
com.wavemining.emoji.elite
com.emoji.input.gif.theme.keyboard
com.keyboard.font.theme.emoji
com.ikeyboard.emoji.emojione
com.qisiemoji.inputmethod
jellybeankeyboard.f.g
com.huawei.inputmethod.language.spanish
com.huawei.inputmethod.language.portuguese
com.huawei.inputmethod.language.german
com.huawei.inputmethod.language.french
com.huawei.inputmethod.language.dutch
com.cootek.smartinputv5.language.arabic
com.cootek.smartinputv5.language.burmese
com.cootek.smartinputv5.language.cht
com.cootek.smartinputv5.language.czech
com.cootek.smartinputv5.language.danish
com.cootek.smartinputv5.language.dutch
com.cootek.smartinputv5.language.englishus
com.cootek.smartinputv5.language.finnish
com.cootek.smartinputv5.language.french
com.cootek.smartinputv5.language.german
com.cootek.smartinputv5.language.hungarian
com.cootek.smartinputv5.language.indonesian
com.cootek.smartinputv5.language.korean
com.cootek.smartinputv5.language.laotian
com.cootek.smartinputv5.language.malayan
com.cootek.smartinputv5.language.norwegian
com.cootek.smartinputv5.language.persian
com.cootek.smartinputv5.language.polish
com.cootek.smartinputv5.language.portuguesebr
com.cootek.smartinputv5.language.portuguesept
com.cootek.smartinputv5.language.russian
com.cootek.smartinputv5.language.slovak
com.cootek.smartinputv5.language.spanish
com.cootek.smartinputv5.language.swedish
com.cootek.smartinputv5.language.thai
com.cootek.smartinputv5.language.ukrainian
com.cootek.smartinputv5.language.vietnam
com.cootek.smartinputv5.language.zawgyi
com.cootek.smartinputv5.skin.keyboard_theme_navy_tinge
com.cootek.smartinputv5.skin.theme_free_ios7

) do (
	findstr "%%X" "%temp%\lista_ottimizzazione.txt" > nul && ( 
		adb shell pm clear %%X > nul
		adb uninstall %%X > nul
		echo REMOVED %%X
		echo REMOVED %%X >> %temp%\LOG_rimosse.txt
			)
)

:AUTOUNINSTALL_exit 
start notepad "%temp%\LOG_rimosse.txt"
timeout 2
del "%temp%\LOG_rimosse.txt"
del "%temp%\lista_ottimizzazione.txt"
GOTO END


:END
color 20
echo.   
echo.	DONE!
echo.
PAUSE