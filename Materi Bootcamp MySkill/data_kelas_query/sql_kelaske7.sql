SELECT * from `Tokopaedi.Orders` ;
SELECT DISTINCT subcategory
from `Tokopaedi.Orders`     ;
-- distinct yaitu memilih data berbeda 

-- ada kategori apa saja ?
SELECT
	DISTINCT category
from `Tokopaedi.Orders`;

-- ada sub kategooti apa aja ?
SELECT DISTINCT subcategory
from `Tokopaedi.Orders`;

-- ada ship mode apa saja ? 
SELECT
	DISTINCT ship_mode
 from `Tokopaedi.Orders`;
 
 SELECT DISTINCT category, subcategory, ship_mode from `Tokopaedi.Orders`;
 -- akan menampilkan kombinasi 3 row berbeda
 
 -- pilih semua transaksi data di seluruh kota los angles 
SELECT 	* 
from `Tokopaedi.Orders`
WHERE city = 'Los Angeles';
    
 -- Kutip 1 untuk teks dan literal 
 -- Kutip 2 untuk kolom
 
 -- transaksi sales di atas 100 $ 
 
 SELECT * from `Tokopaedi.Orders` WHERE sales > 100 ;
 
 -- pilih semua transaksi yang merugikan di kota los angeles dari segment Consumer
 
 SELECT * FROM `Tokopaedi.Orders` WHERE profit < 0 AND city = 'Los Angeles' and segment = 'Consumer';
 
 -- memfilter dengan banyak kondisi and , or , not, in
 
 -- menampilkan segment customer atau korporate
 
 SELECT * from `Tokopaedi.Orders` WHERE segment = 'Consumer' or segment= 'Corporate';
 
 -- tampilkan hanya transksi los angeles , houston and henderson

 SELECT * FROM `Tokopaedi.Orders`
 WHERE city = 'Los Angeles' or city = 'Houston' or city = 'Henderson';
 
 
 -- IN untuk menyederhanakan OR berantai 
 
 SELECT * from `Tokopaedi.Orders`
 WHERE city in ('Los Angeles' , 'Houston' , 'Henderson') and profit < 0;
 
 -- transaksi meruginkan di ke tiga kota tersebut 
 
 -- NOT --> negasi 
 
 -- menampilkan semua transkasi setelah 1 maret 2019
 
 SELECT * from `Tokopaedi.Orders`
 WHERE order_date > '2019-03-01';

 -- menampilkan segment consemer pernah membeli meja 
 SELECT customer_name, segment, subcategory from `Tokopaedi.Orders`
 WHERE segment = 'Consumer' and (subcategory = 'Tables');
 
 -- 
select customer_name , segment , city , order_date
from `Tokopaedi.Orders` 
where segment in ('Corporate', 'Home Office') and city = 'Los Angeles' and order_date > '2018-01-01' ;
 
 
 select * from `Tokopaedi.Orders` 
where segment IN ('Corporate', 'Home Office') 
	and city = 'Los Angeles'
    and order_date >= '2018-01-01' and order_date <'2019-01-01';
    
SELECT customer_name, segment, city, order_date
FROM orders
WHERE segment IN ('Corporate', 'Home Office')
  AND city = 'Los Angeles'
  AND EXTRACT(YEAR FROM order_date) = 2018;
  
-- Kamu sekarang memiliki tabel transaksi dari customer yang bertransaksi di Tokopaedi. Selanjutnya kamu diminta untuk

--Tampilkan nama-nama konsumen segment Consumer yang pernah membeli meja
select customer_name from `Tokopaedi.Orders` where subcategory = 'Tables';
--Tampilkan nama-nama konsumen dari segment Corporate dan Home Office yang berasal dari kota Los Angeles dan bertransaksi selama tahun 2018.
select customer_name , order_date , segment , city from `Tokopaedi.Orders` where segment in ('Corporate', 'Home Office') and city = 'Los Angeles' and extract(YEAR FROM  order_date ) = 2018;


