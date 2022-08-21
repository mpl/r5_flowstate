global function InitFRChallengesSettings
global function OpenFRChallengesSettings
global function CloseFRChallengesSettings

struct
{
	var menu
	bool wpnselectorToggle = false
} file

void function OpenFRChallengesSettings()
{
	CloseAllMenus()
	EmitUISound("UI_Menu_SelectMode_Extend")
	AdvanceMenu( file.menu )	
}

void function CloseFRChallengesSettings()
{
	CloseAllMenus()
}

void function InitFRChallengesSettings( var newMenuArg )
{
	var menu = GetMenu( "FRChallengesSettings" )
	file.menu = menu
	
    AddMenuEventHandler( menu, eUIEvent.MENU_SHOW, OnR5RSB_Show )
	AddMenuEventHandler( menu, eUIEvent.MENU_OPEN, OnR5RSB_Open )
	AddMenuEventHandler( menu, eUIEvent.MENU_CLOSE, OnR5RSB_Close )
	AddMenuEventHandler( menu, eUIEvent.MENU_NAVIGATE_BACK, OnR5RSB_NavigateBack )
	
	AddEventHandlerToButton( menu, "Challenges", UIE_CLICK, ChallengesButtonFunct )
	AddEventHandlerToButton( menu, "WeaponSelector", UIE_CLICK, WeaponSelectorOpenMenu )
	
	//RuiSetString( Hud_GetRui( Hud_GetChild( file.menu, "StatusDetails" ) ), "details", "Test" )
	Hud_SetText( Hud_GetChild( file.menu, "DurationText" ), "60" )
	AddButtonEventHandler( Hud_GetChild( file.menu, "ShieldSelectorButton"), UIE_CHANGE, ShieldSelectorButton )
	AddButtonEventHandler( Hud_GetChild( file.menu, "InmortalTargetsButton"), UIE_CHANGE, InmortalTargetsButton )
	AddButtonEventHandler( Hud_GetChild( file.menu, "InfiniteAmmoButton"), UIE_CHANGE, InfiniteAmmoButton )
	AddButtonEventHandler( Hud_GetChild( file.menu, "RGBHudButton"), UIE_CHANGE, RGBHudButton )
	AddButtonEventHandler( Hud_GetChild( file.menu, "InfiniteTrainingButton"), UIE_CHANGE, InfiniteTrainingButton )
	AddButtonEventHandler( Hud_GetChild( file.menu, "UseDummyModelButton"), UIE_CHANGE, UseDummyModelButton)
	AddButtonEventHandler( Hud_GetChild( file.menu, "DurationText"), UIE_CHANGE, UpdateChallengeDuration )
}

void function ShieldSelectorButton(var button)
{
	int desiredVar = GetConVarInt("hud_setting_minimapRotate")
	RunClientScript("ChangeAimTrainer_AI_SHIELDS_LEVELClient", desiredVar.tostring())
}

void function InmortalTargetsButton(var button)
{
	int desiredVar = GetConVarInt("hud_setting_streamerMode")
	RunClientScript("ChangeAimTrainer_INMORTAL_TARGETSClient", desiredVar.tostring())
}

void function InfiniteAmmoButton(var button)
{
	int desiredVar = GetConVarInt("hud_setting_showTips")
	RunClientScript("ChangeAimTrainer_INFINITE_AMMOClient", desiredVar.tostring())
}

void function RGBHudButton(var button)
{
	int desiredVar = GetConVarInt("hud_setting_showMeter")
	RunClientScript("ChangeRGB_HUDClient", desiredVar.tostring())
}

void function InfiniteTrainingButton(var button)
{
	int desiredVar = GetConVarInt("hud_setting_showMedals")
	RunClientScript("ChangeAimTrainer_INFINITE_CHALLENGEClient", desiredVar.tostring())
}

void function UseDummyModelButton(var button)
{
	int desiredVar = GetConVarInt("hud_setting_showLevelUp")
	RunClientScript("ChangeAimTrainer_USER_WANNA_BE_A_DUMMYClient", desiredVar.tostring())
}

void function WeaponSelectorOpenMenu(var button)
{
	RunClientScript("OpenFRChallengesSettingsWpnSelector")
}

void function UpdateChallengeDuration(var button)
{
	string desiredTime = Hud_GetUTF8Text( Hud_GetChild( file.menu, "DurationText" ) )
	RunClientScript("ChangeChallengeDurationClient", desiredTime)
}

void function ChallengesButtonFunct(var button)
{
	CloseAllMenus()
	RunClientScript("ServerCallback_OpenFRChallengesMainMenu", PlayerKillsForChallengesUI)
}

void function OnR5RSB_Show()
{
    //
}

void function OnR5RSB_Open()
{
	//
}


void function OnR5RSB_Close()
{
	//
}

void function OnR5RSB_NavigateBack()
{
	CloseAllMenus()
	RunClientScript("ServerCallback_OpenFRChallengesMainMenu", PlayerKillsForChallengesUI)	
}