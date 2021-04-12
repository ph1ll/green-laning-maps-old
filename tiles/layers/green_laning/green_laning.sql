CREATE OR REPLACE FUNCTION layer_green_laning(bbox geometry, zoom_level int)
RETURNS TABLE(
    geometry geometry, 
    name text, 
    surface text, 
    smoothness text,
    access text, 
    vehicle text, 
    motor_vehicle text
) AS $$
    SELECT 
        geometry, 
        name, 
        surface, 
        smoothness,
        access, 
        vehicle,
        motor_vehicle
    FROM osm_green_laning_linestring
    WHERE geometry && bbox;
$$ LANGUAGE SQL IMMUTABLE;