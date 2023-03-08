# frozen_string_literal: true

Category.create(title: 'Evening dress')
Category.create(title: 'Casual dress')
Category.create(title: 'Strict dress')
Category.create(title: 'Warm dress')
Category.create(title: 'Summer dress')

Product.create(name: 'Веселка',
               description: 'Правильно обрана сукня жіноча підіймає настрій на цілий день!
    Модель зшита з крепу має квітковий принт. Сукня має круглий виріз горловини, довгі рукави та довжину міді.Силует напівприталений, злегка розширений. Талію підкреслює знімний пасок. Ви завжди можете купити сукню через інтернет у нас на сайті з доставленням по Україні.',
              #  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiCDX0u3s73X00azNLyjcXRjBAv9Jp2lFmoDyVSkIn&s',
               price: 1200,
               category_id: 1)

Product.create(name: 'Ко-ко',
               description: 'Елегантна сукня глибокого сірого кольору – чудове рішення для робочих буднів! В міру щільна та фактурна тканина вигідно виглядає з мінімум деталями. Сукня вище колін, з довгими вшивними рукавами. Шию та зону декольте гарно обрамлює V-подібний виріз горловини. Силует прямий, у бокових швах заховані невеликі кишені. Ця сукня жіноча завжди виручить у прохолодні дні!',
              #  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQUnNZd56k_ioVETr1-PfKLsukkFxyEHJ0QKV0zaIg&s',
               price: 1400,
               category_id: 4)

Product.create(name: 'Агата',
               description: 'Придивіться до цієї жіночої трикотажної сукні та уявіть її у своєму гардеробі. Впевнені майже на 100%, що у вас є речі та аксесуари, які до неї пасуватимуть. Річ в тім, що саме такий крій стильної сукні до коліна для жінок є найуніверсальнішим – вона може бути константою образу або його вагомою частиною: зі шкірянкою та кросівками, із черевичками на підборах і кардиганом, із масивними чи елегантними чоботами тощо.',
              #  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXXNIecS4VTAg4dS6zRCeHx1SK9i7JhPwRs5m2TaxT&s',
               price: 1000,
               category_id: 3)

Product.create(name: 'Роза',
               description: 'Полюбляючи зручні речі й не надаючи перевагу естетиці без комфорту, сучасні жінки радо наповнюють гардероб саме такими сукнями, як ця! Неймовірно жіночна, зі зручною довжиною до коліна та з елегантною горловиною-човником, яка трішки відкриває ключиці, вона не сковує рухів і в одну мить стає стильною частиною повсякденного образу. Бежевий колір з тендітним принтом прикрашений вставками з екошкіри по плечах. Довгий спущений рукав і пояс, який за потреби можна одягати, а можна й залишити вдома.',
              #  image: 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR7X7v8GB08eJWVv2cphBFzFvYcXzzVDPFIt-lHprVxREdHDH8ucrHoZ1mwbobrNj6hveLu8tzpO3qRKsCuKc9cGjJTRnIottNwXfTiyGSN6vFM6666L7QNTA&usqp=CAE',
               price: 1500,
               category_id: 2)

Product.create(name: 'Краса',
               description: 'Полюбляючи зручні речі й не надаючи перевагу естетиці без комфорту, сучасні жінки радо наповнюють гардероб саме такими сукнями, як ця! Неймовірно жіночна, зі зручною довжиною до коліна та з елегантною горловиною-човником, яка трішки відкриває ключиці, вона не сковує рухів і в одну мить стає стильною частиною повсякденного образу. Бежевий колір з тендітним принтом прикрашений вставками з екошкіри по плечах. Довгий спущений рукав і пояс, який за потреби можна одягати, а можна й залишити вдома.',
              #  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTobvLgaJvXHLToCzZlu39XR9z_n-bV1Ub8jR6J-wgc&s',
               price: 1500,
               category_id: 2)

Product.create(name: 'Отава',
               description: 'Мода – циклічна, і ця стильна сукня з інтернет-магазину якнайкраще демонструє торжество крою з 80-х! Модель, представлена на сайті жіночого одягу, пошита з костюмного кріплення в приталеному силуеті з обємними рукавами, прилаштованими по окату. А ніжний, небесно-блакитний відтінок і круглий виріз горловини підкреслюють, наскільки це гарна сукня з жіночним підтекстом.',
              #  image: 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSSYEENaCxaeAPDLnWNPONidxzGrtGIpFNihBzkKu1tAZxFKGfxmUnh1t1WiuYUSCs-unHivLCPDLfcxspuKowQNLHtR2RAuZs8foqlswzmmGPmTswsZoyE&usqp=CAE',
               price: 1500,
               category_id: 1)

Product.create(name: 'Донна',
               description: 'Одна стильна сукня, як ця модель, може кардинально зміни дівчину, зробивши образ більш спокусливим! Ніжна тканина гарно струмує, повторюючи контури тіла. Бретелі регулюються по висоті, на груді є легке драпірування. Силует модної сукні напівприталений. Кокетливий розріз збоку вигідно підкреслює стрункі ніжки. Замовляйте цю модель та інші сукні онлайн на нашому сайті!',
              #  image: 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTx37X0AuFNLK6BuGIpnFuoX0wQK_-FW5Ocz0PDhTsvrwMS6TNCQWWVaPEPQXTO8-I5x6qcf1cQDVYIyodzU4fXHRGa2oZ8&usqp=CAE',
               price: 1400,
               category_id: 5)

Product.create(name: 'Марта',
               description: 'Модну сукню з трикотажу у горизонтальну смужку оцінять любителі вільного крою! Модель-трапеція з оригінальним чорно-білим принтом. Відмінна риса сукні – широкі та короткі цільнокроєні рукави з чорною окантовкою. Довжина сукні вище колін. У бокових швах заховані зручні кишені. Обирайте стильний жіночий одяг у нас на сайті, та зустрічайте новий сезон з модними луками!',
              #  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkCZXVpwTX4jlePT7dP1nEzM9mmhUiXt8n29xEAXzq_sxjl2qzE0A59jsRp6apauhyYUY&usqp=CAU',
               price: 1100,
               category_id: 4)

Product.create(name: 'Конна',
               description: 'Жіноча сукня-сорочка довжиною міді – справжня знахідка для кожної дівчини! Вільний крій у вигляді трапеції зробить образ довершеним, а силует – гармонійним. Довгий вшивний рукав на манжеті добре поєднується з комірцем-стійкою та планкою попереду. Родзинка стильної сукні – косі клинця по боках, які створюю ефект повітряної тканини. Обирайте модний жіночий одяг у нас на сайті для створення гарних образів!',
              #  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlUwI6ReLgLwU_0XO8_QcONlynKlwHh_-xBw&usqp=CAU',
               price: 1400,
               category_id: 3)

Product.create(name: 'Пава',
               description: 'Якщо взяти за базу маленьку чорну сукню, яка панує в жіночих гардеробах вже декілька століть, і зробити її максимально універсальною – вийде саме така модель. Ця трикотажна сукня чорного кольору крою, який ладно облягає фігуру, здатна трансформуватись під ваш настрій. Сьогодні вона – стримано романтична, завтра – по-діловому сучасна, післязавтра – пасує до джинсової куртки та кросівок. І, звичайно, в ній є цікавинка від дизайнерів – декоративні шви з імітацією майки.',
              #  image: 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTL1fXh-pVVOpHZM5_XbZ5NOTi12SJYVIpU8EkceDR0zGRfql4R4ggvG0tcMcqt28lnxgnSuJN3jxaxxSwc1575k2iNGkwE&usqp=CAE',
               price: 1200,
               category_id: 5)

User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
