use BatDongSan
create table [Tòa Nhà](
[id] int primary key,
[tên] varchar(50),
[Thông tin thêm] varchar(max),
[id nhân viên quản lý] int 
)

create table [Nhân Viên](
[id] int primary key,
[tên] varchar(50),
[Thông tin thêm] varchar(max),
[id tòa nhà đang phục vụ] int foreign key references [Tòa Nhà](id)
)

alter table [Tòa Nhà] 
add foreign key ([id nhân viên quản lý]) references [Nhân Viên](id)

create table [Phòng Thuê](
[id] int primary key,
[Mã phòng] varchar(10),
[Trống hay Không] bit,
[id tòa nhà chứa] int foreign key references [Tòa Nhà](id)
)

create table [Khách Hàng](
[id] int primary key,
[Mã phòng] varchar(10),
[Trống hay Không] bit,
[id tòa nhà chứa] int foreign key references [Tòa Nhà](id)
)

create table [Phiên chăm sóc khách hàng](
[id] int primary key,
[id khách hàng được chăm sóc] int foreign key references [Khách Hàng](id),
[id nhân viên chăm sóc] int foreign key references [Nhân Viên](id),
[Ngày giờ của phiên chăm sóc] datetime,
[Phân loại chăm sóc] varchar(15)
)

