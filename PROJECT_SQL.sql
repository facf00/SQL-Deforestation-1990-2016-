DROP VIEW IF EXISTS forestation;

CREATE VIEW forestation
AS
  SELECT r.country_name,
         f.year,
         r.income_group,
         r.region,
         l.total_area_sq_mi,
         f.forest_area_sqkm,
         ( ( Sum(forest_area_sqkm) / Sum(total_area_sq_mi * 2.59) ) * 100 )
         percentage_forest
  FROM   forest_area f
         JOIN land_area l
           ON f.country_code = l.country_code
              AND f.year = l.year
         JOIN regions r
           ON r.country_code = f.country_code
  GROUP  BY r.country_name,
            f.year,
            r.income_group,
            r.region,
            l.total_area_sq_mi,
            f.forest_area_sqkm

1A)
