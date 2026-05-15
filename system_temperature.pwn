enum E_WEATHER_DATA
{
    pTemperature,
    pAreaName[32],
    pWeatherName[32]
};

new PlayerWeather[MAX_PLAYERS][E_WEATHER_DATA];

stock GetPlayerRegion(playerid)
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    // Los Santos
    if(x >= 44.0 && x <= 2997.0 &&
       y >= -2892.0 && y <= -768.0)
    {
        format(PlayerWeather[playerid][pAreaName], 32, "Los Santos");
        return 1;
    }

    // San Fierro
    if(x >= -2997.0 && x <= -1213.0 &&
       y >= -1115.0 && y <= 1659.0)
    {
        format(PlayerWeather[playerid][pAreaName], 32, "San Fierro");
        return 2;
    }

    // Las Venturas
    if(x >= 869.0 && x <= 2997.0 &&
       y >= 596.0 && y <= 2993.0)
    {
        format(PlayerWeather[playerid][pAreaName], 32, "Las Venturas");
        return 3;
    }

    // Desert
    if(x >= -500.0 && x <= 2997.0 &&
       y >= 596.0 && y <= 2993.0)
    {
        format(PlayerWeather[playerid][pAreaName], 32, "Desert");
        return 4;
    }

    // Default
    format(PlayerWeather[playerid][pAreaName], 32, "Countryside");
    return 5;
}


stock UpdateTemperature(playerid)
{
    new region = GetPlayerRegion(playerid);
    new weatherid = WorldWeather;
    new temp;

    switch(region)
    {
        case 1:
        {
            temp = random(8) + 26; // 26-33
        }
        case 2:
        {
            temp = random(8) + 18; // 18-25
        }
        case 3:
        {
            temp = random(8) + 29; // 29-36
        }
        case 4:
        {
            temp = random(9) + 30; // 30-38
        }
        case 5:
        {
            temp = random(8) + 22; // 22-29
        }
    }

    switch(weatherid)
    {
        case 4, 7, 12, 15: // mendung
        {
            temp -= 2;
            format(PlayerWeather[playerid][pWeatherName], 32, "Mendung");
        }

        case 8, 16: // hujan
        {
            temp -= 4;
            format(PlayerWeather[playerid][pWeatherName], 32, "Hujan");
        }

        case 9, 20: // kabut
        {
            temp -= 3;
            format(PlayerWeather[playerid][pWeatherName], 32, "Berkabut");
        }

        case 11, 17: // panas ekstrem
        {
            temp += 2;
            format(PlayerWeather[playerid][pWeatherName], 32, "Gelombang Panas");
        }
        default:
        {
            format(PlayerWeather[playerid][pWeatherName], 32, "Cerah");
        }
    }
    if(temp < 15) temp = 15;
    if(temp > 38) temp = 38;

    PlayerWeather[playerid][pTemperature] = temp;
    return 1;
}


CMD:getplayertemp(playerid, params[])
{
    new string[128];
    if(UpdateTemperature(playerid))
    {
        format(string, 128, "Temperature: %d°C, Weather: %s, Location: %s", PlayerWeather[playerid][pTemperature], PlayerWeather[playerid][pWeatherName], PlayerWeather[playerid][pAreaName]);
        SendClientMessage(playerid, 0xFFFFFFFF, string);
    }
    return 1;
}