CREATE MATERIALIZED VIEW samples_nyctaxi_trips_pipeline AS
SELECT
    fare_amount,
    pickup_zip
FROM samples.nyctaxi.trips
WHERE
    pickup_zip IS NOT NULL;

CREATE MATERIALIZED VIEW samples_nyctaxi_trips_pipeline_agg AS
SELECT
    SUM(fare_amount) AS total_fare,
    pickup_zip
FROM samples_nyctaxi_trips_pipeline
GROUP BY pickup_zip;
