SELECT * from orders;
SELECT 
	DISTINCT segment
from orders;

-- distinct yaitu memilih data berbeda 

-- ada kategori apa saja ?
SELECT
	DISTINCT category
from orders

-- ada sub kategooti apa aja ?
SELECT
	DISTINCT subcategory
from orders

-- ada ship mode apa saja ? 
SELECT
	DISTINCT ship_mode
 from orders
 
 SELECT DISTINCT category, subcategory, ship_mode from orders
 -- akan menampilkan kombinasi 3 row berbeda
 
 -- pilih semua transaksi data di seluruh kota los angles 
SELECT 	* 
from orders 
WHERE city = 'Los Angeles'
    
 -- Kutip 1 untuk teks dan literal 
 -- Kutip 2 untuk kolom
 
 -- transaksi sales di atas 100 $ 
 
 SELECT * from orders WHERE sales > 100
 
 -- pilih semua transaksi yang merugikan di kota los angeles dari segment Consumer
 
 SELECT * FROM orders WHERE profit < 0 AND city = 'Los Angeles' and segment = 'Consumer'
 
 -- memfilter dengan banyak kondisi and , or , not, in
 
 -- menampilkan segment customer atau korporate
 
 SELECT * from orders WHERE segment = 'Consumer' or segment= 'Corporate'
 
 -- tampilkan hanya transksi los angeles , houston and henderson

 SELECT * FROM orders
 WHERE city = 'Los Angeles' or city = 'Houston' or city = 'Henderson'
 
 
 -- IN untuk menyederhanakan OR berantai 
 
 SELECT * from orders 
 WHERE city in ('Los Angeles' , 'Houston' , 'Henderson') and profit < 0
 
 -- transaksi meruginkan di ke tiga kota tersebut 
 
 -- NOT --> negasi 
 
 -- menampilkan semua transkasi setelah 1 maret 2019
 
 SELECT * from orders 
 WHERE order_date > ''
 
 -- menampilkan segment consemer pernah membeli meja 
 SELECT customer_name, segment, subcategory from orders
 WHERE segment = 'Consumer' and (subcategory = 'Desk' and subcategory = 'Tables')
 
 -- 
select customer_name , segment , city , order_date
from orders 
where segment in ('Corporate', 'Home Office') and city = 'Los Angeles' and order_date = '01/01/2018' 
 
 
 select * from orders 
where segment IN ('Corporate', 'Home Office') 
	and city = 'Los Angeles'
    and order_date >= '1/1/2018' and order_date <'1/1/2019'
    
SELECT customer_name, segment, city, order_date
FROM orders
WHERE segment IN ('Corporate', 'Home Office')
  AND city = 'Los Angeles'
  AND EXTRACT(YEAR FROM order_date) = 2018;
  
-- Kamu sekarang memiliki tabel transaksi dari customer yang bertransaksi di Tokopaedi. Selanjutnya kamu diminta untuk

--Tampilkan nama-nama konsumen segment Consumer yang pernah membeli meja
--Tampilkan nama-nama konsumen dari segment Corporate dan Home Office yang berasal dari kota Los Angeles dan bertransaksi selama tahun 2018.


