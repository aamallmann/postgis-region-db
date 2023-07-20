SELECT postgis_full_version(), version();
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS)
SELECT
    pols.pol_id
FROM
    polygons pols
WHERE
    pols.state in (
        SELECT
            s.state
        FROM
            states s
        WHERE
            ST_DWITHIN(
                Geography(ST_Transform(s.geom, 4326)),
                ST_GeographyFromText('POINT(-43.113826 -22.9022)'),
                '15000'
            )
    )
    AND (
        ST_DWithin(
            ST_GeographyFromText('POINT(-43.113826 -22.9022)'),
            Geography(pols.geom),
            '15000'
        )
    )
    AND (
        ST_MaxDistance(
            ST_GeomFromText('POINT(-43.113826 -22.9022)', 4326),
            pols.geom
        ) * 111195
    ) <= '15000';