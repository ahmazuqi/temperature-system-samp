Sistem temperatur untuk SA-MP yang mendeteksi suhu pemain berdasarkan wilayah dan kondisi cuaca server secara real-time.

Script ini akan menyesuaikan temperatur berdasarkan lokasi pemain di map San Andreas seperti Los Santos, San Fierro, Las Venturas, Desert, dan Countryside, lalu menggabungkannya dengan weather global server untuk menghasilkan suhu yang lebih realistis.

## Features

- Deteksi wilayah pemain secara otomatis
- Temperatur berbeda di setiap area
- Integrasi dengan cuaca server (`WorldWeather`) //WorldWeather diganti dengan variabel cuaca atau status cuaca di server saat ini
- Macam2 status cuaca:
  - Cerah
  - Mendung
  - Hujan
  - Berkabut
  - Gelombang Panas
- Temperatur berkisar (`15°C - 38°C`)

## Region Temperature

|    Region    |   Temperature   |
|--------------|-----------------|
| Los Santos   |   26°C - 33°C   |
| San Fierro   |   18°C - 25°C   |
| Las Venturas |   29°C - 36°C   |
| Desert       |   30°C - 38°C   |
| Countryside  |   22°C - 29°C   |

## Weather Effects

|     Weather     |  Effect  |
|-----------------|----------|
| Mendung         |   -2°C   |
| Hujan           |   -4°C   |
| Berkabut        |   -3°C   |
| Gelombang Panas |   +2°C   |
| Cerah           |  Normal  |

## Command

```pawn
/getplayertemp
```

Output example:

```text
Temperature: 31°C, Weather: Cerah, Location: Los Santos
```

## Installation

Masukkan script ke gamemode atau filterscript SA-MP kamu.

Pastikan variable berikut sudah tersedia atau gunakan variabel cuaca yang ada pada script anda(jika ada):

```pawn
WorldWeather
```

Lalu compile seperti biasa.

## Functions

### `GetPlayerRegion(playerid)`
Mendeteksi lokasi pemain berdasarkan koordinat map.

### `UpdateTemperature(playerid)`
Menghitung temperatur berdasarkan region dan cuaca aktif.

## Dependencies

- SA-MP Server
- Pawn Compiler
- ZCMD (untuk command)

## Author

Created by **Noroshii**
