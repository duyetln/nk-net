# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new({:id=>1,:first_name=>"ddd", :last_name=>"nnn", :email=>"abc@domain.com", :password=>"123456",:password_confirmation=>"123456"})
user.status = User::Status[:activated]
user.role = User::Role[:admin]
user.save

user = User.new({:id=>2,:first_name=>"lll", :last_name=>"nnn", :email=>"def@domain.com", :password=>"123456",:password_confirmation=>"123456"})
user.status = User::Status[:activated]
user.role = User::Role[:regular]
user.save

user = User.new({:id=>3,:first_name=>"ccc", :last_name=>"nnn", :email=>"ghi@domain.com", :password=>"123456",:password_confirmation=>"123456"})
user.status = User::Status[:new]
user.role = User::Role[:regular]
user.save

post = Post.new({:id=>1,:content=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus, nunc pharetra consequat sagittis, tellus mi pellentesque mi, ac laoreet tellus ipsum in lorem. Sed eget sem nibh, sit amet vestibulum nisl. Quisque blandit vehicula velit, in pharetra ipsum venenatis nec. Phasellus vehicula erat non magna semper a vehicula tellus dictum. Praesent ut sem nisi. Nunc auctor eleifend mi et laoreet. Integer vitae mi nisl, non consequat turpis. Aenean nibh est, consequat nec feugiat quis, tempus nec nisi. Aliquam venenatis nunc nec risus scelerisque vel accumsan nunc adipiscing. Vivamus sagittis arcu ac metus elementum aliquam. Morbi eu nibh lacus, in lobortis neque."})
post.user_id = 1
post.save

post = Post.new({:id=>2,:content=>"Mauris ac hendrerit massa. Ut in tortor quis felis blandit tincidunt at ac tortor. Vivamus turpis libero, mattis gravida commodo vitae, sodales vitae lacus. Proin massa lorem, laoreet sed semper a, aliquam sed felis. Phasellus porta metus ac arcu vestibulum eu rutrum eros dictum. Maecenas tempus erat eu urna elementum non tempus massa vestibulum. Proin sed ante nunc."})
post.user_id = 1
post.save

post = Post.new({:id=>3,:content=>"Ut gravida tristique lobortis. Duis turpis dui, euismod eget ullamcorper non, porttitor ut metus. Mauris sit amet pellentesque risus. Duis consequat dictum mi, id tincidunt tortor tincidunt nec. Nunc posuere elementum venenatis. Nullam aliquam, augue nec porta volutpat, magna augue mattis orci, vitae volutpat sapien tortor sit amet metus. Fusce neque leo, consequat at venenatis et, pharetra vel libero. Duis sed quam ante. Nulla eu tellus at risus lacinia volutpat at lobortis arcu. Phasellus non urna leo, non egestas metus. Vivamus neque dolor, tempus et ullamcorper a, auctor commodo nisl. Aliquam erat volutpat. Suspendisse sodales, ligula sed viverra fringilla, nisi tellus porttitor sem, ac sagittis felis dolor nec velit. Curabitur tincidunt erat mattis augue semper interdum. Fusce fringilla vulputate magna, et rutrum arcu pretium eget. Ut consequat nisl in sapien tincidunt id faucibus urna consectetur."})
post.user_id = 2
post.save

post = Post.new({:id=>4,:content=>"Nulla nec est lorem, ut malesuada lacus. Nulla tincidunt molestie aliquet. Morbi cursus mauris id ipsum scelerisque eget bibendum sapien volutpat. Nam gravida pretium dolor, eu aliquet turpis gravida a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras leo lacus, adipiscing non lacinia at, elementum fermentum massa. Donec at est at lacus varius convallis ut at sapien. Morbi imperdiet, lorem nec porta ultrices, erat magna hendrerit turpis, non pharetra tortor sem eu tortor. Duis at massa diam. Praesent consequat dignissim lacus, vitae auctor tortor lacinia sit amet. Nam eget nunc sed risus commodo tristique at nec libero."})
post.user_id = 2
post.save

post = Post.new({:id=>5,:content=>"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit."})
post.user_id = 2
post.save

comment = Comment.new({:id=>1,:content=>"Cras leo lacus, adipiscing non lacinia at, elementum fermentum massa. Donec at est at lacus varius convallis ut at sapien."})
comment.user_id = 1
comment.commentable_id = 1
comment.commentable_type = Post.name
comment.save

comment = Comment.new({:id=>2,:content=>"Praesent consequat dignissim lacus, vitae auctor tortor lacinia sit amet."})
comment.user_id = 2
comment.commentable_id = 1
comment.commentable_type = Post.name
comment.save

comment = Comment.new({:id=>3,:content=>"Donec at est at lacus varius convallis ut at sapien. Morbi imperdiet, lorem nec porta ultrices, erat magna hendrerit turpis, non pharetra tortor sem eu tortor. Duis at massa diam."})
comment.user_id = 2
comment.commentable_id = 1
comment.commentable_type = Post.name
comment.save

picture = Picture.new({:id=>1,:description=>"This is a nice cat"})
picture.user_id = 1
picture.item = File.new("test/fixtures/cat.jpg","r")
picture.save

picture = Picture.new({:id=>2,:description=>"This is a nice cave"})
picture.user_id = 1
picture.item = File.new("test/fixtures/cave.jpg","r")
picture.save


picture = Picture.new({:id=>3,:description=>"This is a nice church"})
picture.user_id = 1
picture.item = File.new("test/fixtures/church.jpg","r")
picture.save

picture = Picture.new({:id=>4,:description=>"This is a nice flower"})
picture.user_id = 1
picture.item = File.new("test/fixtures/flower.jpg","r")
picture.save

picture = Picture.new({:id=>5})
picture.user_id = 2
picture.item = File.new("test/fixtures/oldtree.jpg","r")
picture.save

picture = Picture.new({:id=>6})
picture.user_id = 2
picture.item = File.new("test/fixtures/oldwall.jpg","r")
picture.save

picture = Picture.new({:id=>7})
picture.user_id = 2
picture.item = File.new("test/fixtures/sand.jpg","r")
picture.save

picture = Picture.new({:id=>8,:description=>"This is a nice speaker"})
picture.user_id = 2
picture.item = File.new("test/fixtures/speaker.jpg","r")
picture.save

picture = Picture.new({:id=>9,:description=>"This is a nice squirrel"})
picture.user_id = 1
picture.item = File.new("test/fixtures/squirrel.jpg","r")
picture.save

picture = Picture.new({:id=>10})
picture.user_id = 2
picture.item = File.new("test/fixtures/streetart.jpg","r")
picture.save

picture = Picture.new({:id=>11,:description=>"This is a nice tree"})
picture.user_id = 1
picture.item = File.new("test/fixtures/tree.jpg","r")
picture.save

picture = Picture.new({:id=>12})
picture.user_id = 2
picture.item = File.new("test/fixtures/birds.jpg","r")
picture.save

picture = Picture.new({:id=>13})
picture.user_id = 2
picture.item = File.new("test/fixtures/building.jpg","r")
picture.save

picture = Picture.new({:id=>14})
picture.user_id = 2
picture.item = File.new("test/fixtures/coin.jpg","r")
picture.save

picture = Picture.new({:id=>15})
picture.user_id = 2
picture.item = File.new("test/fixtures/leaves.jpg","r")
picture.save

picture = Picture.new({:id=>16})
picture.user_id = 2
picture.item = File.new("test/fixtures/pegion.jpg","r")
picture.save

picture = Picture.new({:id=>17})
picture.user_id = 1
picture.item = File.new("test/fixtures/waterfall.jpg","r")
picture.save

picture = Picture.new({:id=>18})
picture.user_id = 1
picture.item = File.new("test/fixtures/seed.jpg","r")
picture.save

