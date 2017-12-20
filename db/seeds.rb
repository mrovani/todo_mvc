# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed my admin account
admin = User.new({
  firstname: "Margarita",
  lastname: "Rovani",
  email: "hello@gmail.com",
  password: "password",
  is_admin: true,
  })
  admin.skip_confirmation!
  admin.save!


# Seed Users
30.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = Faker::Internet.email(firstname + lastname)
  password = "password"
  user = User.new ({
    firstname: firstname,
    lastname: lastname,
    email: email,
    password: password,
    })
    user.skip_confirmation!
    user.save!

    5.times do
      Article.create({
        title: Faker::Dog.meme_phrase,
        content: Faker::Hipster.paragraph,
        user_id: user.id
      })

      list = List.create({
        name: Faker::Food.dish,
        user_id: user.id,
        })

      5.times do
        recipe = rand(2) == 0 ? Faker::Food.ingredient : Faker::Food.spice

        Item.create({
          completed: false,
          list_id: list.id,
          description: "#{Faker::Food.measurement} #{recipe}",
          })
      end
    end
  end


# Saving one article in case of db reset

content = <<DELIMITER
<h1>Here is the first article using <strong>Tiny MCE plugin</strong>.&nbsp;&nbsp;</h1>
<p>This is a paragraph with a <strong>Bold element.</strong></p>
<p>&nbsp;</p>
<p><img src="http://static.pexels.com/photos/257540/pexels-photo-257540.jpeg" width="549" height="366" /></p>
DELIMITER

Article.create({
  title: "First Article Using TinyMCE",
  content: content,
  user_id: admin.id,
  })
