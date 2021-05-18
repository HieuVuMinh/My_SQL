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