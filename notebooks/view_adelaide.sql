CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `adelaide` AS
    SELECT 
        `d`.`date` AS `Date`,
        `s`.`season` AS `season`,
        `m`.`temperature_avg_C` AS `Avg_Temp`,
        `m`.`temperature_min_C` AS `Min_Temp`,
        `m`.`temperature_max_C` AS `Max_Temp`,
        `m`.`precipitation_mm` AS `Precipitation`,
        `m`.`humidity_avg_%` AS `Avg_Humidity`,
        `m`.`humidity_min_%` AS `Min_Humidity`,
        `m`.`humidity_max_%` AS `Max_Humidity`,
        `m`.`wind_avg_kph` AS `Avg_Wind`,
        `m`.`wind_min_kph` AS `Min_Wind`,
        `m`.`wind_max_kph` AS `Max_Wind`,
        `l`.`city` AS `city`
    FROM
        (((`dates` `d`
        JOIN `measurements` `m` ON ((`d`.`id_date` = `m`.`date_id_date`)))
        JOIN `locations` `l` ON ((`m`.`locations_id_location` = `l`.`id_location`)))
        JOIN `seasons` `s` ON ((`m`.`seasons_id_season` = `s`.`id_season`)))
    WHERE
        (`l`.`city` = 'Adelaide')