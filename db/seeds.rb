# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
   username: 'admin',
   email: 'admin@admin.com',
   password: '123456',
   admin: true
)

5.times do |n|
  User.create!(
    username: "太郎#{n + 1}",
    email: "taro#{n + 1}@taro.com",
    password: "123456",
    admin: false
   )
end

  Food.create!(
    [
      {
        name: 'カップヌードル',
        image: File.open('download-2.jpg'),
        content: '独特のつるみのある麺に、おなじみのオリジナルスープ。具材は味付豚ミンチ、ミンチポーク、エビ、スクランブルエッグ、ネギ。',
        company: '日清食品',
        price: '214',
        taste: 'しょうゆ',
        genre: 'あっさり',
        scores: '0.0'
      },
      {
        name: 'カップヌードルシーフード',
        image: File.open('./app/assets/images/download-3.jpg'),
        content: '独特のつるみのあるめんに、ポークと魚介のコクのあるスープ。具材は、ほぼイカ、イカ、カニ風味カマボコ、スクランブルエッグ、キャベツ、ネギ。',
        company: '日清食品',
        price: '214',
        taste: 'しお',
        genre: 'あっさり',
        scores: '0.0'
      },
      {
        name: 'カップヌードルカレー',
        image: File.open('./app/assets/images/curry.png'),
        content: 'コシのある麺に、野菜の甘味のあるマイルドでとろみのあるカレースープ。具材はポテト、ダイスポーク、ミンチポーク、ニンジン、ネギ。',
        company: '日清食品',
        price: '214',
        taste: 'その他',
        genre: 'コッテリ',
        scores: '0.0'
      },
      {
        name: 'カップヌードルチリトマト',
        image: File.open('./app/assets/images/tomato.png'),
        content: 'ピリッとしたチリの辛さに、トマトの甘みと酸味がマッチしたスープ。具材はトマトキューブ、コーン、キャベツ、インゲンに加え、鶏肉由来の「白い謎肉」を使用。',
        company: '日清食品',
        price: '214',
        taste: 'その他',
        genre: '辛い',
        scores: '0.0'
      },
      {
        name: 'カップヌードルしお',
        image: File.open('./app/assets/images/sio.png'),
        content: 'スープはチキンのうまみにハーブの香り、ブラックペッパーをきかせた洋風しお味。具材には味付鶏ミンチ、キャベツ、フライドポテト、味付卵と赤ピーマンで彩り豊かです。別添で燻製オリーブ風オイル付。',
        company: '日清食品',
        price: '214',
        taste: 'しお',
        genre: 'あっさり',
        scores: '0.0'
      }
    ]
  )
