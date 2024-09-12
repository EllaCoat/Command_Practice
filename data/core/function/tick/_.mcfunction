#> core:tick/_

# プレイヤーがスニークした時、ビームを発射する
# 実行者をプレイヤーに設定 -> プレディケートでスニークしているかどうかを確認 -> 実行位置を実行者に合わせる -> function起動！
    execute as @a if predicate lib:is_sneaking at @s run function item:beam/tick