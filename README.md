# Tiger IoT sensor simulation (GHW)

Simulated IoT time-series data on **Tiger Cloud** service `stillbench` (`cygl9rx93h`), following the [Tiger simulate IoT sensor data](https://www.tigerdata.com/docs/learn/tutorials/simulate-iot-sensor-data) tutorial.

## Schema

- `sensors` — relational metadata (`type`, `location`)
- `sensor_data` — hypertable with `temperature`, `cpu`, and 5-minute samples for the last 24 hours (4 sensors)

## Reproduce

```bash
tiger db query stillbench --file setup_iot_sensors.sql
tiger db query stillbench --file verify_queries.sql
```

Or use Tiger MCP `db_query` against service `cygl9rx93h`.

## MLH challenge

[Simulate an IoT sensor dataset with Tiger Cloud](https://www.mlh.com/events/global-hack-week-open-source-90/challenges/01a11b5c-844d-86ce-9146-6afa2915c842/submissions/new) — submit a screenshot and/or link to your Tiger Cloud service.
