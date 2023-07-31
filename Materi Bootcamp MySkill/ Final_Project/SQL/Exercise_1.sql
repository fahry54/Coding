-- No. 1 , Selama transaksi yag terjadi selama 2021, pada bulan apa total nilai transaksi (after_discount) paling besar? Gunakan is_valid=1 untuk memfilter data transaksi. source table: oder_detail 
SELECT 
    extract(month from order_date) AS month,
    SUM(after_discount) AS total_after_discount
FROM
    `Final_project.order_detail`
WHERE
    extract(year from order_date) = 2021 AND is_valid = 1
GROUP BY
    month
ORDER BY
    total_after_discount DESC
LIMIT 1;

-- No.2 Selama transaksi pada tahun 2022, kategori apa yang menghasilkan nilai transaksi paling besar? Gunakan is_valid=1 untuk memfilter data transaksi. source table: order_detail, sku_detail

select sd.category as category , sum(od.after_discount) as transaksi
from `Final_project.order_detail` as od
join `Final_project.sku_detail` as sd on od.sku_id = sd.id
where extract(year from od.order_date) = 2022 and is_valid = 1
group by category 
order by transaksi desc
limit 1;

-- No.3 Bandingkan transaksi dasri masing-masing kategori 2021 dengan 2022. Sebutkan kategori apa saja yang mengalami peningkatan dasn kategori apa yang mengalami penurunan nialai transaksi dari tahun 2021 sampai 2022. Gunakan is_valid=1 untuk memfilter data transaksi. Source table: order_detail, sku_detail

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

-- Chat GPT 
SELECT
    sd.category AS kategori,
    SUM(CASE WHEN EXTRACT(YEAR FROM od.order_date) = 2021 THEN od.after_discount ELSE 0 END) AS transaksi_2021,
    SUM(CASE WHEN EXTRACT(YEAR FROM od.order_date) = 2022 THEN od.after_discount ELSE 0 END) AS transaksi_2022
FROM
    `Final_project.order_detail` AS od
JOIN
    `Final_project.sku_detail` AS sd ON od.sku_id = sd.id
WHERE
    EXTRACT(YEAR FROM od.order_date) IN (2021, 2022) AND is_valid = 1
GROUP BY
    kategori
HAVING
    transaksi_2022 > transaksi_2021
    OR transaksi_2022 < transaksi_2021
ORDER BY
    kategori;

-- No. 4 Tampilkan top 5 metode pembayaran yang paling populer digunakan selama 2022 (berdasarkan total uniqu order). Gunakan is_valid=1 untuk memfilter data transaksi. Source table: order_detail , payment_detail

select
    pd.payment_method as Metode_pembayaran, 
    count(pd.payment_method) as total_unique_order
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

-- Chat GPT
SELECT
    pd.payment_method AS Metode_pembayaran,
    COUNT(od.payment_id) AS total_unique_order
FROM
    `Final_project.order_detail` AS od
JOIN
    `Final_project.payment_detail` AS pd ON od.payment_id = pd.id
WHERE
    EXTRACT(YEAR FROM od.order_date) = 2022 AND is_valid = 1
GROUP BY
    pd.payment_method
ORDER BY
    total_unique_order DESC
LIMIT 5;

-- No. 5 Urutkan dari ke-5 produk ini berdasarkan nilai transaksi nya. 1.Samsung , 2. Apple, 3.Sony, 4.Huawei, 5.Lenovo . Gunakan is_valid=1 untuk memfilter data transaksi. Source table: oder_detail, sku_detail

select
    
    sum(od.after_discount) as transaksi
from 
    `Final_project.order_detail` as od
    join 
    `Final_project.sku_detail` as sd
    on od.sku_id = sd.id
where 
    sd.sku_name in ('\bsamsung\b' , '\bapple\b' , '\blenovo\b' , '\bhuawei\b' , '\bsony\b') and is_valid=1
group by 
    sd.sku_name
order by
    transaksi desc;
