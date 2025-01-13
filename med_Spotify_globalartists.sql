-- Spotify_med

/*
Assume there are three Spotify tables: artists, songs, and global_song_rank, which contain information about the artists, songs, and music charts, respectively.

Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table. Display the top 5 artist names in ascending order, 
along with their song appearance ranking.

If two or more artists have the same number of song appearances, they should be assigned the same ranking, and the rank numbers should be continuous (i.e. 1, 2, 2, 3, 4, 5). 
If you've never seen a rank order like this before, do the rank window function tutorial.
*/

Select *, dense_rank
SELECT s.artist_id, count(1)  as appearances 
FROM global_song_rank gsk
inner JOIN
songs s
on gsk.song_id = s.song_id
where rank <= 10
group by s.artist_id
order by count(1) desc
;