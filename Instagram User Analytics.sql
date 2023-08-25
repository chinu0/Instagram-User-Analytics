select * from likes;
select * from users;
select * from photos;
select * from comments;
select * from photo_tags;
select * from tags;

select username from users order by created_at limit 5;

select u.username, p.user_id from users u left join photos p on u.id = p.user_id where p.id is null;

select 	p.user_id, u.username, l.photo_id, count(l.user_id) as numberOfLikes from likes l
		join photos p on l.photo_id = p.id
        join users u on u.id = p.user_id
        where l.user_id 
group by l.photo_id 
order by numberOfLikes desc 
limit 1;

select  tag_name, count(tag_name) as most_tagged from tags t
		join photo_tags pt on t.id = pt.tag_id
        group by t.id
        order by most_tagged desc
        limit 5
        ;
 
 select  dayname(created_at) as day, count(*) as total from users
		group by day
        order by total desc
		limit 2;

select count(users.id)  as total_number_of_users, count(photos.user_id) as total_number_of_photos, count(photos.user_id)/count(users.id) as average_user FROM photos
				left join users on users.id = photos.id;

select users.username, likes.user_id , count(likes.created_at) as numberOfPhotosLiked from likes 
			join users on users.id = likes.user_id
            group by likes.user_id
            having numberOfPhotosLiked = 257;



