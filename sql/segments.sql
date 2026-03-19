USE latest;

LOAD spatial;

CREATE OR REPLACE
TABLE segments as
SELECT
	*
FROM
	segment_vw
WHERE
	bbox.xmin BETWEEN -89.57122 AND -81.96479
	AND bbox.ymin BETWEEN 36.49706 AND 39.14774
	AND ST_Intersects(geometry,
(SELECT geometry FROM kybnd));