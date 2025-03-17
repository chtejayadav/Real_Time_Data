SELECT * FROM project.sm;
alter table sm add ID int;
alter table sm modify column ID int auto_increment primary key;
select * from sm 
where 
 user_pseudo_id=""
and device_category=""
and page_location="";
select * from sm 
where 
 user_pseudo_id=""
and device_category=""
and device_os="";
select * from sm 
where 
 user_pseudo_id=""
and device_category=""
and event_name="";

select * from sm 
where 
 user_pseudo_id=""
and page_location=""
and device_os="";
select * from sm 
where 
 user_pseudo_id=""
and page_location=""
and event_name="";

select * from sm 
where 
 user_pseudo_id=""
and device_os=""
and event_name="";

select * from sm 
where 
 device_category=""
and page_location=""
and device_os="";
select * from sm 
where 
 device_category=""
and page_location=""
and event_name="";

select * from sm 
where 
 device_category=""
and device_os=""
and event_name="";

select * from sm 
where 
 page_location=""
and device_os=""
and event_name="";
######################################################################################################################
delete from sm where ID=501 ;
delete from sm where ID=197 ;
delete from sm where ID=652 ;
delete from sm where ID=264 ;
delete from sm where ID=598 ;
delete from sm where ID=706 ;
###########################################################################################################################
UPDATE sm
SET event_date="20250223"
WHERE event_date="";
#################################################################################################################
ALTER TABLE sm
MODIFY event_date DATE;
select * from sm ;
#####################################################################################################################
UPDATE sm
SET page_location="https://smileguru.com"
WHERE page_location="";
####1. Page Popularity ####################################################################################################################
select page_location,count(*)
as page_view from sm 
where event_name="page_view" 
group by page_location;
####2. Device and OS Usage ################################################################################################################
UPDATE sm
SET device_category="UnKnown"
WHERE device_category="";
UPDATE sm
SET device_os="UnKnown"
WHERE device_os="";
select device_category,device_os,count(*)
as `usage` from sm
group by device_category,device_os; 

##########################################################################################################################################
UPDATE sm
SET event_timestamp="1.73568E+15"
WHERE event_timestamp="invalid_timestamp";
UPDATE sm SET event_timestamp=event_timestamp/power(10,15);
UPDATE sm
SET event_timestamp=event_timestamp*100000;
UPDATE sm
SET user_pseudo_id="UnKnown"
WHERE user_pseudo_id="";

UPDATE sm
SET event_name="UnKnown"
WHERE event_name="";


select* from sm;

SET @row = 0;

UPDATE sm
SET event_name = CASE 
    WHEN (@row := @row + 1) % 4 = 1 THEN 'page_view'
    WHEN @row % 4 = 2 THEN 'form_submit'
    WHEN @row % 4 = 3 THEN 'scroll'
    ELSE 'click'
END
WHERE event_name ="UnKnown";

select*from sm;
alter table sm
modify  `Page`  varchar(155);
update sm
set `Page`="Main"
where page_location="https://smileguru.com";
update sm
set `Page`="Contact"
where page_location="https://smileguru.com/contact";
select *from sm;
update sm
set `Page`="Orthodontics"
where page_location="https://smileguru.com/orthodontics";
select *from sm;
update sm
set `Page`="About"
where page_location="https://smileguru.com/about";
select *from sm;
update sm
set `Page`="Main"
where page_location="https://smileguru.com/home";
select *from sm;
select `Page`,count(*) as ass from sm group by `Page`;
update sm
set `Page`="About"
where page_location="https://smileguru.com/about-us";
update sm
set `Page`="Dental-implants"
where page_location="https://smileguru.com/dental-implants";
update sm
set `Page`="Emergency-dental"
where page_location="https://smileguru.com/emergency-dental";
update sm
set `Page`="Index"
where page_location="https://smileguru.com/index";
update sm
set `Page`="Root-canal"
where page_location="https://smileguru.com/root-canal";
update sm
set `Page`="Cosmetic-dentistry"
where page_location="https://smileguru.com/cosmetic-dentistry";
select*from sm;
######################################## likelihood ##################################################
SELECT device_category, 
       COUNT(CASE WHEN event_name = 'click' THEN 1 END) AS click_count,
       COUNT(*) AS total_events,
       (COUNT(CASE WHEN event_name = 'click' THEN 1 END) * 1.0 / COUNT(*)) AS click_rate
FROM sm
GROUP BY device_category
ORDER BY click_rate DESC
LIMIT 1;
###################################### Form Submission Hotspots#######################################
SELECT `Page`, 
       COUNT(CASE WHEN event_name = 'form_submit' THEN 1 END) AS form_submit_count,
       COUNT(*) AS total_events,
       (COUNT(CASE WHEN event_name = 'form_submit' THEN 1 END) * 1.0 / COUNT(*)) AS form_submit_rate
FROM sm
GROUP BY `Page`
ORDER BY form_submit_rate DESC
LIMIT 1;
select * from sm;
################################### Event Sequence Prediction #############################################
WITH event_sequence AS (
    SELECT 
        user_pseudo_id,
        event_name AS current_event,
        LEAD(event_name) OVER (PARTITION BY user_pseudo_id ORDER BY event_timestamp) AS next_event
    FROM sm
)
SELECT next_event, COUNT(*) AS occurrence_count
FROM event_sequence
WHERE current_event = 'page_view' and next_event IS NOT  null  AND next_event <> 'page_view'
GROUP BY next_event
ORDER BY occurrence_count DESC
LIMIT 1;
################################### User Engagement Score ################################33
SELECT user_pseudo_id, 
       COUNT(*) AS event_count
FROM sm
WHERE user_pseudo_id IS NOT NULL 
      AND user_pseudo_id <> 'unknown' 
GROUP BY user_pseudo_id
ORDER BY event_count DESC
LIMIT 1;
