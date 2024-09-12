#> item:beam/loop

# ブロックがあったら破壊
# 壊せないブロックかどうかを判別 -> setblock で破壊
    execute unless block ^1 ^1 ^ #lib:unbreakable run setblock ^1 ^1 ^ air destroy
    execute unless block ^1 ^ ^ #lib:unbreakable run setblock ^1 ^ ^ air destroy
    execute unless block ^1 ^-1 ^ #lib:unbreakable run setblock ^1 ^-1 ^ air destroy
    execute unless block ^ ^1 ^ #lib:unbreakable run setblock ^ ^1 ^ air destroy
    execute unless block ^ ^ ^ #lib:unbreakable run setblock ^ ^ ^ air destroy
    execute unless block ^ ^-1 ^ #lib:unbreakable run setblock ^ ^-1 ^ air destroy
    execute unless block ^-1 ^1 ^ #lib:unbreakable run setblock ^-1 ^1 ^ air destroy
    execute unless block ^-1 ^ ^ #lib:unbreakable run setblock ^-1 ^ ^ air destroy
    execute unless block ^-1 ^-1 ^ #lib:unbreakable run setblock ^-1 ^-1 ^ air destroy
    kill @e[type=item,distance=..3]

# ビームがモブを通ったら爆発させる
# 実行位置を調整 -> 1ブロック範囲内に誰かいるかをチェック -> 実行位置を戻して -> クリーパーが爆発！
    execute positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[type=#lib:living,type=!player,tag=!Bomb,dx=0] positioned ~0.5 ~0.5 ~0.5 run summon tnt ~ ~ ~

# パーティクルを表示
    function particle:end_rod

# 実行者が近くにいればちょっと実行位置を前にずらして再度ループ、ただしいなければループしない
# 実行位置を相対座標で前に0.25ブロックずらす -> プレイヤーがいるかどうか検知 -> ループ
    execute positioned ^ ^ ^0.25 if entity @s[distance=..30] run function item:beam/loop