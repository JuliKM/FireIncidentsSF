CREATE DATABASE IF NOT EXISTS fire_incidents_norm;
USE fire_incidents_norm;

CREATE TABLE IF NOT EXISTS incidents (  
id INT PRIMARY KEY,  
exposure_number INT,
incident_number INT,
address VARCHAR (255),
incident_date TIMESTAMP,
call_number INT,
arrival_dttm TIMESTAMP,
close_dttm TIMESTAMP
);
CREATE TABLE IF NOT EXISTS cities(
id_city INT PRIMARY KEY,
city VARCHAR (255)
);

CREATE TABLE IF NOT EXISTS zipcode (
id_zipcode INT PRIMARY KEY,
zipcode INT,
id_city  INT
);

CREATE TABLE IF NOT EXISTS battalion (
id_battalion INT PRIMARY KEY,
battalion_code VARCHAR (5),
id_zipcode INT,
FOREIGN KEY (id_zipcode) references zipcode(id_zipcode)
);

CREATE TABLE IF NOT EXISTS station_area(
id_station_area INT PRIMARY KEY,
station_area VARCHAR (5)
);

CREATE TABLE IF NOT EXISTS battalion_station(
id_bat_stat INT PRIMARY KEY,
id_battalion int,
id_station_area INT,
FOREIGN KEY (id_battalion) REFERENCES battalion(id_battalion),
FOREIGN KEY (id_station_area) REFERENCES station_area(id_station_area)
);


CREATE TABLE IF NOT EXISTS primary_situations(
id_primary_situation INT PRIMARY KEY,
id_primary_situation_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS action_taken( 
id_action_taken INT PRIMARY KEY,
id_action_taken_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS property_use(
property_use_id INT PRIMARY KEY,
property_use_id_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS neighborhood_district(
neighborhood_district_id INT PRIMARY KEY,
neighborhood_district_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS are_of_fire_origin(
are_of_fire_origin_id INT PRIMARY KEY,
are_of_fire_origin_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ignition_cause(
ignition_cause_id INT PRIMARY KEY,
ignition_cause_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ignition_factor(
ignition_factor_id INT PRIMARY KEY,
ignition_factor_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS heat_source(
heat_source_id INT PRIMARY KEY,
heat_source_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS item_first_ignited(
item_first_ignited_id INT PRIMARY KEY,
item_first_ignited_desc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS human_factors_associates_with_ignition(
human_factors_associates_with_ignition_id INT PRIMARY KEY,
human_factors_associates_with_ignition_desc VARCHAR(255)
); 

DROP TABLE IF EXISTS incident_details ;
CREATE TABLE IF NOT EXISTS incident_details ( 
inc_det_id INT ,
suppression_units INT,
suppression_personnel INT,
ems_units  INT,
ems_person INT,
other_units INT,
other_personnel INT,
first_unit_on_scene VARCHAR (255), 
fire_fatalities INT, 
fire_injuries INT, 
civilian_fatalities INT, 
civilian_injuries INT, 
number_of_alarms INT,
id_primary_situation INT,
mutual_aid VARCHAR (255),
id_action_taken INT,
action_taken_secondary VARCHAR (255), 
action_taken_other VARCHAR (255),
detector_alerted_occupants VARCHAR (255),
property_use_id INT,
supervisor_district INT,
neighborhood_district_id INT,
point_coordinates VARCHAR(255),
estimated_contents_loss INT,
are_of_fire_origin_id INT,
ignition_cause_id INT,
ignition_factor_id INT,
ignition_factory_secondary VARCHAR (255),
heat_source_id INT,
item_first_ignited_id INT,
human_factors_associates_with_ignition_id INT,
structure_type VARCHAR (255),
structure_status VARCHAR (255),
floor_of_fire_origin VARCHAR (255),
fire_spread VARCHAR (255),
no_flame_spead VARCHAR (255),
number_of_floors_with_minimum_damage INT,
number_of_floors_with_significant_damage INT,
number_of_floors_with_heavy_damage INT,
number_of_floors_with_extreme_damage INT,
detectors_present INT,
detector_type VARCHAR (255),
detector_operation VARCHAR (255),
detector_effectiveness VARCHAR (255),
detector_failure_reason VARCHAR (255),
automatic_extinguishing_system_present VARCHAR (255),
automatic_extinguishing_system_type VARCHAR (255),
automatic_extinguishing_system_performance VARCHAR (255),
automatic_extinguishing_system_failure_reason VARCHAR (255),
number_of_sprinkler_heads_operating INT,
box VARCHAR (255),
PRIMARY KEY (inc_det_id),
FOREIGN KEY  (id_primary_situation) REFERENCES primary_situations(id_primary_situation),
FOREIGN KEY  (id_action_taken) REFERENCES action_taken(id_action_taken),
FOREIGN KEY  (neighborhood_district_id) REFERENCES neighborhood_district(neighborhood_district_id) ,
FOREIGN KEY  (are_of_fire_origin_id) REFERENCES are_of_fire_origin(are_of_fire_origin_id), 
FOREIGN KEY  (ignition_cause_id) REFERENCES ignition_cause(ignition_cause_id), 
FOREIGN KEY  (ignition_factor_id) REFERENCES ignition_factor(ignition_factor_id ), 
FOREIGN KEY  (heat_source_id) REFERENCES heat_source(heat_source_id),
FOREIGN KEY  (item_first_ignited_id ) REFERENCES item_first_ignited(item_first_ignited_id ), 
FOREIGN KEY  (human_factors_associates_with_ignition_id ) REFERENCES human_factors_associates_with_ignition(human_factors_associates_with_ignition_id)
);