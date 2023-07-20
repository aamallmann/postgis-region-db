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
            st_dwithin(
               Geography(s.geom),
               '0101000020E61000009EB7B1D9918E45C082734694F6E636C0',
               15000
            )
    )
    AND (
        st_dwithin(
            '0101000020E61000009EB7B1D9918E45C082734694F6E636C0',
            Geography(pols.geom),
            '15000'
        )
    );