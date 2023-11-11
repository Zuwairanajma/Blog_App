# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

first_user = User.create(name: 'Juwairiyya Sadiq', photo_link: 'https://e0.pxfuel.com/wallpapers/820/800/desktop-wallpaper-cute-black-girls-black-cartoon-characters-thumbnail.jpg', bio: 'Undisputed Queen of DIY', posts_counter: 0)
second_user = User.create(name: 'Aisha Waleesh', photo_link: 'https://costumesheaven.b-cdn.net/wp-content/uploads/2022/05/Judy_is_awesome.PNG.jpg', bio: 'CEO Henna Hub UK', posts_counter: 0)
third_user = User.create(name: 'Nick Wilde', photo_link: 'https://kh.wiki.gallery/images/2/24/Nick_Wilde_KHUX.png', bio: 'Fox con artist from Zootopia', posts_counter: 0)
fourth_user = User.create(name: 'Chief Bogo', photo_link: 'https://static.wikia.nocookie.net/zootopia/images/f/fa/Chief_Bogo.png/revision/latest?cb=20160211180005', bio: 'Police chief from Zootopia', posts_counter: 0)
fifth_user = User.create(name: 'Dawn Bellwether', photo_link: 'https://static.wikia.nocookie.net/disney/images/8/85/Profile_-_Bellwether_.jpeg/revision/latest?cb=20190312051343', bio: 'Sheep mayor from Zootopia', posts_counter: 0)

first_post = Post.create(author_id: first_user.id, title:'How to make a table', text: 'Get wood. Get tools. Build table.', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: second_user.id, title:'How to solve a crime', text: 'Catch the criminal.', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author_id: third_user.id, title:'How to be a con artist', text: 'Con people.', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author_id: fourth_user.id, title:'How to be a police chief', text: 'Be a police chief.', comments_counter: 0, likes_counter: 0)
fifth_post = Post.create(author_id: fifth_user.id, title:'How to be a mayor', text: 'Be a mayor.', comments_counter: 0, likes_counter: 0)

first_comment = Comment.create(user_id: first_user.id, post_id: first_post.id, text: 'Great post!')
second_comment = Comment.create(user_id: second_user.id, post_id: second_post.id, text: 'Good post!')
third_comment = Comment.create(user_id: third_user.id, post_id: third_post.id, text: 'Bad post!')
fourth_comment = Comment.create(user_id: fourth_user.id, post_id: fourth_post.id, text: 'Awesome post!')
fifth_comment = Comment.create(user_id: fifth_user.id, post_id: fifth_post.id, text: 'Wicked post!')
sixth_comment = Comment.create(user_id: first_user.id, post_id: second_post.id, text: 'Cool post!')

first_like = Like.create(user_id: second_user.id, post_id: first_post.id)
second_like = Like.create(user_id: third_user.id, post_id: second_post.id)
third_like = Like.create(user_id: fourth_user.id, post_id: third_post.id)
fourth_like = Like.create(user_id: fifth_user.id, post_id: fourth_post.id)
fifth_like = Like.create(user_id: first_user.id, post_id: fifth_post.id)
