-- Metadata
SELECT * FROM sensors ORDER BY id;

-- Sample readings
SELECT * FROM sensor_data ORDER BY time DESC LIMIT 8;

-- Hypertable check
SELECT hypertable_name, num_chunks
FROM timescaledb_information.hypertables
WHERE hypertable_name = 'sensor_data';

-- 30-minute averages
SELECT
  time_bucket('30 minutes', time) AS period,
  AVG(temperature) AS avg_temp,
  AVG(cpu) AS avg_cpu
FROM sensor_data
GROUP BY period
ORDER BY period DESC
LIMIT 5;

-- Join metadata: avg/last temp and avg CPU by location
SELECT
  sensors.location,
  time_bucket('30 minutes', time) AS period,
  AVG(temperature) AS avg_temp,
  last(temperature, time) AS last_temp,
  AVG(cpu) AS avg_cpu
FROM sensor_data
JOIN sensors ON sensor_data.sensor_id = sensors.id
GROUP BY period, sensors.location
ORDER BY period DESC, sensors.location
LIMIT 8;
