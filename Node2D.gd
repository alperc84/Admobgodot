extends Node2D



var admob = null
var real_ads = false
var banner_top = false
var ad_banner_id = "ca-app-pub-3940256099942544/6300978111"
var ad_interstitial_id = "ca-app-pub-3940256099942544/1033173712"
var ad_rewarded_id = "ca-app-pub-3940256099942544/5224354917"

func _ready():
	initialize_admob()
	initialize_banner()
	initialize_interstitial()
	initialize_rewarded()
	pass 



######################################
func initialize_admob():
	if Engine.has_singleton("AdMob"):
		admob = Engine.get_singleton("AdMob")
		admob.init(real_ads,get_instance_id())


func initialize_banner():
	if admob:
		admob.loadBanner(ad_banner_id, banner_top)

func initialize_interstitial():
	if admob:
		admob.loadInterstitial(ad_interstitial_id)

func initialize_rewarded():
	if admob:
		admob.loadRewardedVideo(ad_rewarded_id)
#####################################################

func show_ad_banner():
	if admob:
		admob.showBanner()

func show_ad_interstitial():
	if admob:
		admob.showInterstitial()

func show_ad_rewarded():
	if admob:
		admob.showRewardedVideo()


func _on_admob_network_error():
	print("Network Error")

func _on_admob_ad_loaded():
	if admob != null:
		print("Ad loaded success")


func _on_interstitial_not_loaded():
	print("Interstitial not loaded")

func _on_interstitial_loaded():
	print("Interstitial loaded")

func _on_interstitial_close():
	print("Interstitial closed")
	initialize_interstitial()

func _on_rewarded_video_ad_loaded():
	print("Rewarded loaded success")
	
func _on_rewarded_video_ad_closed():
	print("Rewarded closed")
	initialize_rewarded()
	
func _on_rewarded(currency, amount):
	print("rewarded")
	


# Resize the banner
func _on_screen_resized():
	if admob != null:
		admob.resize()


func _on_Banner_pressed():
	show_ad_banner()
	pass # Replace with function body.


func _on_Intertitial_pressed():
	show_ad_interstitial()
	pass # Replace with function body.


func _on_Reward_pressed():
	show_ad_rewarded()
	pass # Replace with function body.
