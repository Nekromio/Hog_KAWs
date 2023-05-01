#pragma semicolon 1
#pragma newdecls required

#include <hog_core>
#include <knife_arena>

bool
	bDuelPause[MAXPLAYERS+1];

public Plugin myinfo = 
{
	name = "[Hog] Knife Arena Ws",
	author = "Nek.'a 2x2 | ggwp.site ",
	description = "Отключения Кабана в поединке",
	version = "1.0.0",
	url = "https://ggwp.site/"
};

public void OnPluginStart()
{
	KA_HookEvent(view_as<KA_Event>(KA_OnPushFromQueueToArenaPost),	OnPushFromQueueToArenaPost);
	KA_HookEvent(view_as<KA_Event>(KA_OnArenaClientRemoved), OnArenaClientRemoved);
}

public void OnPushFromQueueToArenaPost(int client)
{
	if(HOG_GetStstusHog(client) == 2)
	{
		HOG_TriggerReset(client);
		bDuelPause[client] = true;
	}	
}

public void OnArenaClientRemoved(int client, KA_Reason reason)
{
	if(HOG_GetStstusHog(client) == 2)
		bDuelPause[client] = false;
}