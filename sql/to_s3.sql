LOAD spatial;
LOAD httpfs;
LOAD aws;

SET s3_region='us-west-2';
CALL load_aws_credentials();


COPY (
select * 
from infrastructure 
where ST_GeometryType(geometry) = 'POINT'
) TO 's3://kyvector/overture-maps/infrastructure_points.parquet'
WITH (FORMAT 'parquet')
;

COPY (
select * 
from infrastructure 
where ST_GeometryType(geometry) = 'LINESTRING'
) TO 's3://kyvector/overture-maps/infrastructure_lines.parquet'
WITH (FORMAT 'parquet')
;


COPY (
select * 
from infrastructure 
where ST_GeometryType(geometry) = 'POLYGON'
) TO 's3://kyvector/overture-maps/infrastructure_polygons.parquet'
WITH (FORMAT 'parquet')
;

COPY (
select * 
from buildings 
) TO 's3://kyvector/overture-maps/parquet/buildings.parquet'
WITH (FORMAT 'parquet')
;

