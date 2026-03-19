USE latest;

LOAD spatial;

CREATE OR REPLACE
TABLE buildings as
SELECT
	id,
		version,
		sources[1].dataset as source,
		names.primary as name,
		level,
		subtype,
		height,

	--		has_parts,
	--		is_underground,
		num_floors,
	--		num_floors_underground,
	--		min_height,
	--		min_floor,
	--		facade_color,
	--		facade_material,
		roof_material,
		roof_shape,
	--		roof_direction,
		roof_color,
		roof_height,
--		bbox,
		geometry
FROM
	building_vw
WHERE
	bbox.xmin BETWEEN -89.57122 AND -81.96479
	AND bbox.ymin BETWEEN 36.49706 AND 39.14774
	AND ST_Intersects(geometry,
    		(SELECT geometry FROM kybnd));