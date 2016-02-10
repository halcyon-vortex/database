# database

schema: halcyon

#### Tables
 
halcyon."Test_Hourly_Watches"
* repo_id INTEGER, 
* repo_name TEXT, 
* star_count SMALLINT, 
* date DATE, <sub> (date is of form YYYY-MM-DD)
* hour SMALLINT




halcyon."Test_Repos"
* id INTEGER, 
* repo_name TEXT, <sub> (repo_name is of form login_of_owner/name_of_repository. So owner name can be generated from the field)
* description TEXT, 
* language CHARACTER VARYING(40), 
* num_stars INTEGER, 
* org INTEGER <sub>  (org is 0 if there is no org associated with repo)
   





#### Queries

```SQL
select * from halcyon."Test_Hourly_Watches" limit 5
```
```SQL
select * from halcyon."Test_Repos" limit 5
```
```SQL
select repo_id, repo_name, language, num_stars, count(*) AS stars from halcyon."Test_Hourly_Watches" 
Inner Join halcyon."Test_Repos" On repo_id = id
where num_stars > 0 
  AND date >= current_date - 47
  AND date <=  current_date - 40
group by repo_id, repo_name, language, num_stars order by num_stars desc
```
