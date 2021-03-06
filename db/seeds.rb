require "open-uri"


puts "Destroying..."

Shop.destroy_all
User.destroy_all

puts "Creating Trial Users"

admin = User.new(email: 'admin@hotmail.com', password: '1234567')
admin.save!

puts "Creating Trial Shops"

images = ['https://restaurantengine.com/wp-content/uploads/2015/05/startup-restaurants-typically-overspend.jpg', 'https://www.db-hospitality.com/wp-content/uploads/2017/11/hospitality-consultant.jpg',
          'https://lakespring.halfmoon.jp/wp-content/uploads/2015/07/restaurant-939435_960_720.jpg', 'https://art-view.roppongihills.com/en/cafe-restaurant/img/index_img02_8.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/1200px-Barbieri_-_ViaSophia25668.jpg', 'https://media.timeout.com/images/105239239/image.jpg',
          'https://media-cdn.tripadvisor.com/media/photo-s/0e/cc/0a/dc/restaurant-chocolat.jpg', 'https://media.cntraveler.com/photos/5b22bfdff04a775484b99dfc/master/pass/Alo-Restaurant__2018_Raffi-Photo-2.jpg',
          'https://beta.ctvnews.ca/national/business/2020/8/11/1_5059767/_jcr_content/root/responsivegrid/image.coreimg.jpeg/1597233422297/1-5059774.jpeg', 'http://recipetable.org/wp-content/uploads/2020/07/startup-restaurants-typically-overspend.jpg',
          'https://www.sundayguardianlive.com/wp-content/uploads/2020/07/3-Dib-restaurant-losses-edited.jpg', 'https://restaurants.accor.com/photos/3420_rsr001_00_p_1024x768.jpg',
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/7a/55/c2/louise-restaurant-bar.jpg', 'https://www.koonewyork.com/wp-content/uploads/2021/01/Exceptional-Quality-Customer-Service-A-Restaurant-Must-Have-READ-HERE.jpg',
          'https://media.cntraveler.com/photos/5cacaf106c6a90694611589b/master/pass/Nightshade_2019_Frank-Lee_2018-12-14-NightShade-117.jpg', 'https://s3.us-east-1.amazonaws.com/co-assets/assets/images/restaurant.jpg',
          'https://static3.depositphotos.com/1003631/209/i/600/depositphotos_2099183-stock-photo-fine-table-setting-in-gourmet.jpg', 'https://www.restaurant-hospitality.com/sites/restaurant-hospitality.com/files/1540x800%201.jpg',
          'https://10mag.com/wp-content/uploads/2017/01/cafes-in-seoul-1080x770.jpg', 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Restaurant_Bar.jpg']

name = ['Kollabo', 'Bistro', 'Seijiro', 'Sugita', 'Matsukawa', 'Pellegrino', 'Saito', 'Hoshino', 'Shinogara', 'Sugalabo',
        'Amamoto','Sushinamba', 'Kaoruhiroo', 'Arai', 'Torishiki', 'Mitani', 'Furuta', 'Sawada', 'Takiya', 'Quintessence']

phone_numbers = ['+81-50-5869-4082', '050-5596-7417', '+81-50-5589-4836', '+81-3-3669-3855', '+81-3-6277-7371', '03-6277-4697', '+81-3-3589-4412',
                 '+81-3-6450-1818', '+81-3-6263-0345', '080-4665-6432', '03-6885-2274', '+81-3-6273-3334', '+81-50-5890-0293', '+81-3-6264-5855',
                 '+81-3-5366-0132', '+81-3-3535-5550', '+81-3-3571-4711', '+81-3-6804-1732', '+81-3-6277-0090', '+81-3-6262-5090']

address = ['3-chome-4-18 Ginza Chuo City Tokyo-to', '3-chome-87 Hanasakicho Naka-ku Yokohama Kanagawa', '6-chome-6-1 Ginza Chuo City Tokyo-to', '1-chome-33-6 Nihonbashikakigaracho Chuo City Tokyo-to',
           '1-chome-11-6 Akasaka Minato City Tokyo-to', '2-chome-3-4 Ebisu Shibuya City Tokyo-to', '1-chome-4-5 Roppongi Minato City Tokyo-to', '5-chome-31-3 Shinbashi Minato City Tokyo-to',
           '2-chome-8-17 Ginza Chuo City Tokyo-to', '????????? ?????? ????????? 1-11-10 ????????????1F', '1-chome-7-9 Higashiazabu Minato City Tokyo-to', '1-chome-1-2 Yurakucho Chiyoda City Tokyo-to',
           '????????? ?????? ????????? 4-5-66 2F', '8-chome-10-2 Ginza Chuo City Tokyo-to', '1-chome-1-22 Yotsuya Shinjuku City Tokyo-to', '1-chome-21-14 Ginza Chuo City Tokyo-to', '5-chome-9-19 Ginza Chuo City Tokyo-to',
           '2 Chome-8 Azabujuban Minato City Tokyo', '????????? ????????? ????????? 6-7-29 ??????????????????????????? ????????? 1F', '2-chome-1-1 Nihonbashimuromachi Chuo City Tokyo-to']

websites = ['https://kollabo.co.jp/', 'http://www.dynac-japan.com/shop/la_boucherie/', 'http://sei26.com/', 'https://www.tableall.com/restaurant/203', 'http://www.t-matsukawa.com/', 'http://pellegrino.jp/',
            'https://hitosara.com/0006076487/?cid=gm_yoyaku', 'https://omo-hotels.com/otsuka/', 'https://omakase.in/en/r/sn331262', 'http://sugalabo.com/', 'http://higashiazabuamamoto.com/',
            'https://omakase.in/en/r/nm181004', 'https://foodle.pro/restaurants/tokyo/president-chibo', 'https://www.theworlds50best.com/discovery/Establishments/Japan/Tokyo/Torishiki.html',
            'https://pocket-concierge.jp/en/restaurants/244246', 'https://livejapan.com/en/in-tokyo/in-pref-tokyo/in-tokyo_suburbs/spot-lj0012000/', 'https://omakase.in/en/r/gv412216',
            'https://pocket-concierge.jp/en/restaurants/243933', 'https://www.quintessence.jp/', 'http://aca-kyoto.jp/']


images.each_with_index do |image, idx|

  file = URI.open(image)
  shop = Shop.new(name: name[idx], address: address[idx], phone_number: phone_numbers[idx], website: websites[idx], images: image,user: admin)
  shop.photos.attach(io: file, filename: 'shop.jgp', content_type: 'image/jgp')
  shop.save!
end
puts "Trial Shops created!"
