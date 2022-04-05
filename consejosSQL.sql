SELECT
  ctime AS "time",
  value
FROM data_bin
WHERE
  $__unixEpochFilter(ctime) AND
  id_metric = 1
ORDER BY ctime

SELECT `host_name`, `service_description`, `metric_name`, `metricas_host`.`metric_id`,value
FROM (select `index_data`.`host_name` AS `host_name`,`index_data`.`service_description` AS `service_description`,`metrics`.`metric_name` AS `metric_name`,`metrics`.`metric_id` AS `metric_id`
    from (`index_data` left join `metrics` on((`index_data`.`id` = `metrics`.`index_id`)))
    where (`metrics`.`metric_id` is not null) AND service_description = 'Ping') as metricas_host, data_bin
WHERE `metricas_host`.`metric_id` = data_bin.id_metric
