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

::Malware
com.sparkle.flashlight
com.mobilebt.snakefight
com.mobilebt.mathsolver
com.mobilebt.shapesorter
com.takatrip.android
com.magnifeye.android
com.pesrepi.joinup
com.pesrepi.zombiekiller
com.pesrepi.spacerocket
com.pesrepi.neonpong
app.mobile.justflashlight
com.mobile.tablesoccer
com.mobile.cliffdiver
com.mobile.boxstack
net.kanmobi.jellyslice
com.maragona.akblackjack
com.maragona.colortiles
com.beacon.animalmatch
com.beacon.roulettemania
com.atry.hexafall
com.atry.hexablocks
com.atry.pairzap
com.heavy.excavator.simulator.driveandtransport
com.hoverboard.racing.speed.simulator
com.zg.real.tractor.farming.simulator.game
com.ambulancerescue.driving.simulator
com.heavymountain.bus2018simulator
com.firetruckemergency.driver
com.farming.tractor.realharvest.simulator
com.carparking.challenge.parksimulator
com.speedboat.jetski.racing.simulator
com.watersurfing.carstunt.racing.simulator
com.offroad.woodtransport.truckdriver
com.volumen.booster.equalizer
com.ks.prado.Car.parking.race.drive.apps
com.zg.offroad.Oil.tanker.transporter.truck.cargo.simulator
com.monstertruck.demolition
com.hummerlimotaxi.simulator.driving
com.excavator.wreckingball.demolition.simulator
com.offroad.gold.transport.truck
com.sea.animals.trucktransport.simulator
com.water.surfingrace.motorbike.stunt
com.policechase.thiefpersecution
com.police.plane.transporter.game
com.ambulance.driver.extreme.rescue.simulator
com.hovercraftracer.speedracing.boat
com.cars.transport.truckdriver.simulator
com.motorbike.pizza.delivery.drivesimulator
com.heavy.excavator.stonecutter.simulator
com.bottle.shoot.archery.game
com.offroadbuggy.car.racingsimulator
com.garbagetruck.city.trash.cleaningsimulator
com.tanks.attack.simulator.war.attack
com.dinosaurpark.trainrescue
com.pirateshipboat.racing3d.simulator
com.flyingtaxi.simulator.race
com.jetpackinwater.racersimualtor.danger
com.boostervolumen.amplifiersoundandvolumen
com.farmgames.animal.farming.simulator
com.monstertruck.racing.competition.simulator
com.simulator.offroadjeep.car.racing
com.simulator.flyingcar.stunt.extremetracks.racing
com.simulator.tractorfarming.driving
com.impossible.farming.transport.simulator
com.volumenbooster.equalizerboost
com.mustang.rally.championship.racingsimulator
com.deleted.photo.recovery
com.race.boat.speedy
com.cycle.bike.racing.game
com.write.name.live.wallpaper.hd
com.maginal.unicorn.game
com.grafton.cycle.jungle.rider.race
com.lovecallingapps.lovecaller.Screen
com.city.car.funny.racing.stunt.game.pro
com.citycar.funny.racinggame.stunt.simulator
com.urban.Limo.taxi.simulation.games
com.cg.heavy.tractor.simulator.game
com.campervan.drivingsimulator.caravan
com.bootleshoot.sniper
com.globalcoporation.fullscreenincomingcaller.app
com.mustache.beard.editor
com.volumenbooster.increaservolumen
com.photoeditor.girlfriend.addgirlstophoto.pic
com.tracker.location.number.free.spy
com.garden.editor.app
com.fortunewheel.game
com.farming.transport.tractor.simulator
com.offroad.tractor.transport.drivingsimulator
com.customwallpaper.mynameonlivewallpaper
com.flying.ambulance.emergency.rescue.simulator
com.mustang.driving.car.race
com.waterpark.carracing.simulator
com.impossibletrucks.extremetrucks.simulator
com.extreme.flying.motorbike.stuntsimulator
com.emergency.firetruck.rescue.drivingsimulator
com.snowplow.simulator.heavysnow.excavator
com.waterskiing.simulator.games
com.photomaker.editor.women.makeupandhairstyle
com.fortune.mountain
com.vanpizza.truckdelivery.simulator
com.truck.simulator.transportandparking
com.hoverboard.racing.spider.attacksimulator
com.moto.sport.championship.racingsimulator
com.demolitionderby.simulator
com.lovecaller.free.loveringtones
com.house.transport.truck.movingvan.simulator
com.heavy.excavator.simulator.stonedriller
com.cycle.downhill.game
com.extreme.rallychampionship.race
com.missileattack.army.truck
com.mobile.caller.location.tracker.freecall
com.mobilenumberlocator.tracker
com.mynameonlivewallpaper.animated.hd
com.spk.coach.offroad.School.bus.mountain.free
com.fullscreen.incomingcaller.app
com.allsuit.man.casualshirt.photo.editor
com.americanmuscle.car.race
com.offroad.nuclearwastetransport.truckdriver
com.madcars.fury.racing.driving.simulator
com.high.wheeler.speed.race.championship
com.colorbynumber.number.coloring.paint.game
com.campervan.race.driving.simulator.game
com.unicornfloat.speedrace.simulator
com.dualscreenbrowser
com.harvest.timber.simulatorandtransport
com.racingsimulator.hot.micro.racers
com.lara.unicorn.dash.magical.raider.race
com.wingsuit.simulator.extreme
com.foodtruck.driving.simulator
com.dograce.competition
com.suvcar.parking.simulator.game
com.clap.phonefinder.locator
com.phonenumerlocator.findphonenumbers
com.whatsapplock.gallerylock.ninexsoftech.lock
com.secret.screenrecorder.screenshotrecord
com.facebeauty.makeup
com.write.your.christmas.letter.santa.threewisemen
com.deletedfiles.photo.audio.video.recovery
com.screndualbrowserdouble.app.android
com.crack.mobile.screen.prank
photoeditor.Garden.photoframe
com.modiphotoframe.editor
com.callerscreen.lovecaller
com.antitheftalarm.fullbatteryalarm.sound
com.lovecaller.screen.custom
com.sms.message.voice.reading
com.photo.text.editor.nameonpic
com.mtsfreegames.Speedboatracing
com.simulator.traindriving
com.grafton.Cycle.jungle.rider
com.gl.racinghorse.competition
moveapptosd.tosdcard.freeapp
com.avatarmaker.poptoy.creator
com.myphoto.live.wallpaper.editor
com.messenger2.play.game.Unicorndashk
com.truck.wheelofdeath
com.livetranslator.translateinlive
com.volumecontrol.widget.volumebooster
com.worldcup2018football.shirt.maker.photoeditor
com.girlfriendphotoeditor.girlsinyourphoto
com.myphoto.on.musicplayer.free
com.taxidriving.simulatorgame.race
com.garden.photoeditor.photoframe
com.fortunewheel.deluxe
com.motorcycle.extremeracing.simulator
com.offroad.snow.bike.christmas.racing
com.Droidhermes.bottleninja
com.Hadiikhiya.photochangebackground
com.offroad.christmas.treetransport.truck.driversimulator
com.tank.transport.armytruck.simulator
com.flagteams.facepaint.editor.world2018cup
com.russianworld2018cup.livewallpaper.flagsteam
com.editor.selfie.camera.photo
com.desirepk.Offroad.transport.simulator.apps
massimo.Vidlan.maxplayer
com.flashalerts.callandsms
com.photovideo.maker.withmusic
com.braingames.iqtest.skills
com.mix.audio.and.video
com.poptoy.creator.edityourpoptoy
com.flashalert.callandsms
com.photoframe.of.heart
com.shayari.hindi.status.photo.text
com.happy.photo.birthday.cake
com.photoeditor.nature.photoframes
com.photoframe.calendar2018editor
com.christmas.truck.transportsimulator.game
com.christmas.vandrive.modern.santa
com.anbrothers.voicechanger.app
com.monsters.vs.water.duel
com.flowers.editor.photo.frame
videoeditor.musicvideo.Phototovideomaker.videoeditor
com.racing.games.toiletpaper.race
com.Zv.puppiesdog.racegame
com.luxury.photo.frame.photo.editor
com.bike.wheelofdeath
com.qbesoft.worldfamousphotoframes.app
com.heavysnowexcavator.christmas.rescue
com.syor.deleted.photo.recovery.video.restore
com.footballanalyzer.resultsandstats
com.photoframe.cube3d.live.wallpaper.hd
com.photoframe.geenhill
com.christmas.magnetic.magicboard.drawandwrite
com.animalspart.photo.editor
com.camera.blur.photoeffects
com.quick.photo.frame.carphotoframe
com.game.handsslap.manitascalientes.redhands
com.maa.durga.live.wallpaper
com.photomontage.men.sweatshirt.editor
com.wordsgame.connectletters
lanas.recover.deleted.pictures.photos
com.customized.radio.alarm.clock
com.antispamcalls.blockspamcaller
com.compatibilitytest.friends.couples
com.dualscreen.android.app.double
com.magic.glow.livewallpaper.animatedwallpaper
com.game.virtualpet.porgy
com.explosiongame.taptheball
com.analog.digital.clock.live.wallpaper
com.royalestas.information
com.editor.firetext.photo.frame
editor.card.greetings.christmas.com.christmasgreetingscard
com.bestappsco.bestapplock.free
com.DJ.photoframe.editor
com.autocall.redial.automatic.recall
com.picquiz.guess.picture.game
com.professionalrecorder.audio.call.record

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