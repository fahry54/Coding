-- No. 1 , Selama transaksi yag terjadi selama 2021, pada bulan apa total nilai transaksi (after_discount) paling besar? Gunakan is_valid=1 untuk memfilter data transaksi. source table: oder_detail 
SELECT 
    extract(month from order_date) AS month_2021,
    round(SUM(after_discount),0) AS total_sales
FROM
    `Final_project.order_detail`
WHERE
    extract(year from order_date) = 2021 AND is_valid = 1
GROUP BY
    month_2021
ORDER BY
    total_sales DESC;

-- No.2 Selama transaksi pada tahun 2022, kategori apa yang menghasilkan nilai transaksi paling besar? Gunakan is_valid=1 untuk memfilter data transaksi. source table: order_detail, sku_detail

select sd.category  category , sum(od.after_discount)  transaksi
from `Final_project.order_detail`  od
left join `Final_project.sku_detail`    sd on od.sku_id = sd.id
where extract(year from od.order_date) = 2022 and is_valid = 1
group by category 
order by transaksi desc;

--di pilih left join karena sku_id pada data order_detail 

-- No.3 Bandingkan transaksi dasri masing-masing kategori 2021 dengan 2022. Sebutkan kategori apa saja yang mengalami peningkatan dasn kategori apa yang mengalami penurunan nialai transaksi dari tahun 2021 sampai 2022. Gunakan is_valid=1 untuk memfilter data transaksi. Source table: order_detail, sku_detail ???? karena pemahannya kategori 2021 dengan kategori 2022 

SELECT
    sd.category AS kategori,
    SUM(od.after_discount) AS transaksi,
    EXTRACT(YEAR FROM od.order_date) AS year
FROM
    `Final_project.order_detail` AS od
JOIN
    `Final_project.sku_detail` AS sd ON od.sku_id = sd.id
WHERE
    EXTRACT(YEAR FROM od.order_date) IN (2021, 2022) AND is_valid = 1
GROUP BY
    kategori , year
ORDER BY
    year ASC, transaksi DESC
LIMIT 100;

-- 
SELECT
    sd.category AS kategori,
    SUM(CASE WHEN EXTRACT(YEAR FROM od.order_date) = 2021 THEN od.after_discount ELSE 0 END) AS transaksi_2021,
    SUM(CASE WHEN EXTRACT(YEAR FROM od.order_date) = 2022 THEN od.after_discount ELSE 0 END) AS transaksi_2022
FROM
    `Final_project.order_detail` AS od
JOIN
    `Final_project.sku_detail` AS sd ON od.sku_id = sd.id
WHERE
     is_valid = 1
GROUP BY
    kategori
HAVING
    transaksi_2022 > transaksi_2021
    OR transaksi_2022 < transaksi_2021
ORDER BY
    kategori;    
-- case when -> suatu kasus ketika 
--CTE --> tabel  banyak untuk join karena ERD diagram sudah kompleks 
-- cohort analisis -> retensi produk 
with a as (
    SELECT
    sd.category AS kategori,
    SUM(CASE WHEN EXTRACT(YEAR FROM od.order_date) = 2021 THEN od.after_discount ELSE 0 END) AS transaksi_2021,
    SUM(CASE WHEN EXTRACT(YEAR FROM od.order_date) = 2022 THEN od.after_discount ELSE 0 END) AS transaksi_2022
FROM
    `Final_project.order_detail` AS od
JOIN
    `Final_project.sku_detail` AS sd ON od.sku_id = sd.id
WHERE
     is_valid = 1
GROUP BY 1
ORDER BY 2 desc
)

select 
    a.* ,
    transaksi_2022 - transaksi_2021 growth_value 
from a 
order by 1 ;

-- No. 4 Tampilkan top 5 metode pembayaran yang paling populer digunakan selama 2022 (berdasarkan total uniqu order). Gunakan is_valid=1 untuk memfilter data transaksi. Source table: order_detail , payment_detail

select
    pd.payment_method as Metode_pembayaran, 
    count(od.id) as total_unique_order
from 
    `Final_project.order_detail` as od 
    join
    `Final_project.payment_detail`as pd 
    on od.payment_id = pd.id
where 
    extract( year from od.order_date) = 2022 and is_valid = 1
group by
    Metode_pembayaran 
order by 
    total_unique_order desc
limit 5;

           

-- No. 5 Urutkan dari ke-5 produk ini berdasarkan nilai transaksi nya. 1.Samsung , 2. Apple, 3.Sony, 4.Huawei, 5.Lenovo . Gunakan is_valid=1 untuk memfilter data transaksi. Source table: oder_detail, sku_detail

-- order  group  sku_name di sku_detail yg ada nama ( %Apple%, %Sony% , % Huawei%, %Lenovo%, %Samsung%) dengan transaksi ( jumlah after_discount)


SELECT
    sd.sku_name,
    SUM(od.after_discount) AS total_sales
FROM 
    `Final_project.order_detail` as od
    join 
    `Final_project.sku_detail` as sd
    on od.sku_id = sd.id
WHERE sd.sku_name LIKE '%Apple%'
OR sd.sku_name LIKE '%Sony%'
OR sd.sku_name LIKE '%Huawei%'
OR sd.sku_name LIKE '%Lenovo%'
OR sd.sku_name LIKE '%Samsung%'
and is_valid=1
GROUP BY sd.sku_name
ORDER BY total_sales DESC;

with a as (
    select
    case 
        when lower (sd.sku_name) like '%samsung%' then 'Samsung'
        when lower (sd.sku_name) like '%apple%' or lower (sd.sku_name) like '%iphone%' then 'Apple'
        when lower (sd.sku_name) like '%sony%' then 'Sony'
        when lower (sd.sku_name) like '%huawwi%' then 'Huawei'
        when lower (sd.sku_name) like '%lenovo%' then 'Lenovo'
        end as product_brand,
        sum(od.after_discount) total_sales
    from `Final_project.order_detail` od
    join `Final_project.sku_detail` sd on od.sku_id = sd.id
    where 
     extract (year from od.order_date) = 2022 and is_valid =1 
    group by 1                                                     
)
select a.*
from a 
where 
    product_brand is not null
order by 2 desc;

--etl, esplor data


