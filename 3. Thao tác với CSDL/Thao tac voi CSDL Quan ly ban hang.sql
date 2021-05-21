use quanlybanhang;

create table Customer(
	CustomerId int not null primary key, 
    CustomerName varchar(20) not null,
    CustomerAge date null
);

create table Orders(
	OrdersId int not null primary key,
    CustomerId int,
    OrdersDate date not null,
    OrdersTotalPrice float null,
    foreign key (CustomerId) references Customer(CustomerId)
);

create table Product(
	ProductId int not null primary key,
    ProductName varchar(50) not null,
    ProductPrice float not null,
    ProductQuantity int null
);

create table OrderDetail(
	OrdersId int,
    ProductId int,
	OrderProduct int,
    primary key (OrdersId, ProductId)
);

-- Thay đổi kiểu dữ liệu bảng customer, cột customerAge = int
alter table customer
modify column customerAge int;

-- Thêm dữ liệu vào các bảng
insert customer 
values (1, 'Minh Quan', 10),
		(2, 'Ngoc Oanh', 20),
        (3, 'Hong Ha', 30);
   
insert Orders
values (1, 1, '20060321', null),
		(2, 2, '20060323', null),
        (3, 1, '20060316', null);

insert product
values (1, 'May Giat', 3),
		(2, 'Tu Lanh', 5),
        (3, 'Dieu Hoa', 7),
        (4, 'Quat', 1),
        (5, 'Bep Dien', 2);

insert orderdetail
values (1, 1, 3),
	   (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);
       
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select ordersId, ordersDate, ordersTotalPrice
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.customerName,  p.productName
from customer c 
join orders o on o.customerId = c.customerId 
join orderdetail od on od.ordersId = o.ordersId 
join product p on p.productid = od.productId;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.customerName
from customer c join orders o on not o.customerId = c.customerId







