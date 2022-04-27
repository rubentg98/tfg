SELECT
  ctime AS "time",
  value
FROM data_bin
WHERE
  $__unixEpochFilter(ctime) AND
  id_metric = 1
ORDER BY ctime


SELECT `host_name`, `service_description`, `metric_name`, `metricas_host`.`metric_id`,value
FROM (select `index_data`.`host_name` AS `host_name`,`index_data`.`service_description` AS `service_description`,
          `metrics`.`metric_name` AS `metric_name`,`metrics`.`metric_id` AS `metric_id`
       from (`index_data` left join `metrics` on((`index_data`.`id` = `metrics`.`index_id`)))
    where (`metrics`.`metric_id` is not null) AND service_description = 'Ping') as metricas_host, data_bin
WHERE `metricas_host`.`metric_id` = data_bin.id_metric


SELECT distinct `host_name`, `service_description`, `metric_name`, `metricas_host`.`metric_id`
FROM (select `index_data`.`host_name` AS `host_name`,`index_data`.`service_description` AS `service_description`,
          `metrics`.`metric_name` AS `metric_name`,`metrics`.`metric_id` AS `metric_id`
       from (`index_data` left join `metrics` on((`index_data`.`id` = `metrics`.`index_id`)))
    where (`metrics`.`metric_id` is not null) AND service_description = 'Ping') as metricas_host, data_bin
WHERE `metricas_host`.`metric_id` = data_bin.id_metric







select host_id,description,service_id from services;

select h.name,s.description,s.service_id from services s,hosts h;

select host_name,service_description from index_data;





select d.value, d.ctime as time 
from data_bin d,metrics m, index_data i, hosts h, services s
where d.id_metric = (select metric_id from metrics m left join index_data i on m.index_id = i.id 
                        where i.host_id = 17 and m.metric_name = 'rta');
and 
ORDER BY ctime

select d.value, d.ctime as time  from data_bin d,metrics m, index_data i, hosts h, services s where d.id_metric = (select metric_id from metrics m left join index_data i on m.index_id = i.id                          
where i.host_id = 17 and m.metric_name = 'rta') group by d.ctime order by d.ctime limit 10;


select metric_id from metrics m, index_data i where metric_name = 'rta' and 
  m.index_id = (select i.id from index_data i where host_id = 17 and service_description regexp 'ping')


select metric_id, metric_name from metrics m left join index_data i on m.index_id = i.id 
  where i.host_id = 17 and m.metric_name = 'rta';



  LA BUENA ES ESTA!!!!!!!!!!

select d.value as value, d.ctime as time  from data_bin d,metrics m, index_data i, hosts h, services s 
where d.id_metric = (select metric_id from metrics m left join index_data i on m.index_id = i.id                          
where i.host_id = 15 and m.metric_name = 'rta')
group by d.ctime 
order by d.ctime;


PARA VER LOS ID DE LAS METRICAS DE UN HOST 

select metric_id, metric_name from metrics m left join index_data i on m.index_id = i.id
     where i.host_id = 17;