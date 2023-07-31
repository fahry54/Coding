-- BETWEEN -> di antara
-- query senua transaksi 2018
-- 1 januari 2018 sampai 30 desember 2018
-- penggunaan between : untuk tanggal , range(int) , string(lexicogrammatychal)

select * from `Tokopaedi.Orders`
where 
    order_date between '2018-01-01' and '2018-12-30';

-- Tampilkan transaksi nama orang yang namanya berasal dari A sampai E

select * from `Tokopaedi.Orders`
where customer_name between 'A' and 'E';

-- transaksi yg terjadi selama bulan maret sampai mei 2019 ( 1maret - 31 mei 2019)

select * from `Tokopaedi.Orders`
where order_date between '2019-03-01' and '2019-05-31';

-- extract tanggal , bulan , tahun dengan EXTRACT ( YEAR from DATE)

select order_date , extract( year from order_date) as year 
from `Tokopaedi.Orders` limit 10;

select order_date , extract( month from order_date) as month 
from `Tokopaedi.Orders` limit 10;

select order_date , extract( day from order_date) as day
from `Tokopaedi.Orders` limit 10;

-- ambil semua row dari tahun 2017 hingga 2018

select * from `Tokopaedi.Orders`
where extract(year from order_date) between 2017 and 2018 limit 100;

-- mengurutkan data Order by tanpa di tulis akan asc(naik)

-- urutkan transaksi senhinnga menampilkan barisan paling baru 

select * from `Tokopaedi.Orders`
order by order_date desc limit 100; 

-- urutkan transaksi mulai dari nominal penjualan terbesar 

select * from `Tokopaedi.Orders`
order by sales desc limit 50;

-- 10 baris kerugian terbesar 
select * from `Tokopaedi.Orders`
where profit < 0
order by profit ;

-- PREFIX ( awalan ) --> menunjukkan tabel 
-- ALIAS --> nama samaran ( pengganti nama kolom , subquery, tabel )

select order_date as tanggal_order , extract(year from order_date) as tahun_order from `Tokopaedi.Orders` limit 50;

-- order by --> bisa multiple kolom 

select * from `Tokopaedi.Orders` order by order_date , customer_name limit 50; 

-- minitask : 1. query transaksi yg meruginkan saja tahiun 2018 hingga 2019 di los angeles . di urutkan dari kerugian terbesar 
--            2. query keuntungan saja pada Q1 tahun 2018 kota henderson di urutkan keuntungan terbesar

select * from `Tokopaedi.Orders`
where profit < 0 and extract(year from order_date) between 2018 and 2019 and city = 'Los Angeles'
order by profit asc;

select * from `Tokopaedi.Orders`
where profit > 0 and extract(quarter from order_date) = 1 and extract(year from order_date) = 2018  and city = 'Henderson'
order by profit desc;