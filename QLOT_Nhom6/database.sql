USE [master]
GO
/****** Object:  Database [Nhom6_QLOT]    Script Date: 6/6/2017 8:50:28 PM ******/
CREATE DATABASE [Nhom6_QLOT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nhom6_QLOT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Nhom6_QLOT.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Nhom6_QLOT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Nhom6_QLOT_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Nhom6_QLOT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nhom6_QLOT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nhom6_QLOT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Nhom6_QLOT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nhom6_QLOT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nhom6_QLOT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nhom6_QLOT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nhom6_QLOT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Nhom6_QLOT] SET  MULTI_USER 
GO
ALTER DATABASE [Nhom6_QLOT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nhom6_QLOT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nhom6_QLOT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nhom6_QLOT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Nhom6_QLOT]
GO
/****** Object:  StoredProcedure [dbo].[Catalog_DisplayPageNo]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Catalog_DisplayPageNo]
@CurrentPage int,
@PageSize int,
@table nvarchar(200),
@actionName nvarchar(100),
@sql nvarchar(max) output
as
begin
	-- tạo biến lưu tổng số row trong bảng ghi
	declare @TotalRecord int;
	declare @sqlString nvarchar(200);
	SET @sqlString = N'SELECT @TotalRecord=Count(*) FROM '+@table;
	execute sp_executesql @sqlString,N'@TotalRecord int out',@TotalRecord out; -- lấy biến gán cho totalrecord
	--khai báo và set tổng số bản ghi dựa và tổng bản ghi  và số bản ghi trên 1 trang 
	declare @TotalPage int;
	if @TotalRecord%@PageSize >0
		set @TotalPage = (@TotalRecord/@PageSize)+1;
	else
		set @TotalPage = @TotalPage/@PageSize;
	--nếu trang chuyền vào nhỏ hơn 1 (@CurrentPage) thì gán gtri cho nó bằng 1
	if @CurrentPage <1
		set	@CurrentPage = 1;
	--nếu trang chuyền vào lơn hơn tổng số trang được chia
	if @CurrentPage>@TotalPage
		set @CurrentPage = @TotalPage
	--Set nội dung cho link phân trang
	set @sql = 'Trang : ';
	--nếu trang hiện tại lơn hơn 1
	if @CurrentPage>1
		begin
			set @sql = @sql+N'<a href ="'+@actionName+'?page = 1" title="Trang Đầu ">&lt;&lt</a> ';		
			set @sql = @sql+'<a href="'+@actionName+'?page ='+CAST((@CurrentPage-1) as nvarchar(4))+N'" title="Trang Truoc"> &lt;</a>';
		end
		declare @i int;
		set @i = 1;
		--vong lặp totalpage 
		while(@i<=@TotalPage)
			begin
				-- nếu i bằng currentPage (trang hiện tại)
				if @i = @CurrentPage
					set @sql =@sql+'['+ cast(cast(@i as int) as nvarchar(4)) + ']'
				else
					set @sql = @sql+'<a href ="'+@actionName+'?page='+CAST(@i as nvarchar(4))+'">'+CAST(@i as nvarchar(4))+'</a>'
				set @i = @i+1;	
			end
		if @CurrentPage < @TotalPage
			begin
				set @sql = @sql + '<a  href = "'+@actionName+'?page='+ cast(( @CurrentPage + 1) as nvarchar(4))+N'" title="Trang Sau ">&gt; </a>' ;
				set @sql = @sql + '<a  href = "'+@actionName+'?page='+CAST(@TotalPage as nvarchar(4))+N'" title="Trang Cuoi">&gt;&gt;</a> ';
			end 
		select @sql as Paging
end







GO
/****** Object:  StoredProcedure [dbo].[Catalog_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Catalog_GetByID]
@CatalogID int
as begin
	select *from CATALOG where CatalogID = @CatalogID
end
GO
/****** Object:  StoredProcedure [dbo].[Catalog_GetID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Catalog_GetID]
as begin	
	select CatalogID from CATALOG
end





GO
/****** Object:  StoredProcedure [dbo].[Catalog_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Catalog_Insert]
@CatalogName nvarchar(100),
@Description nvarchar(max),
@Status bit,
@ParentID int ,
@ImageLogo nvarchar(max)
as
begin
	insert into CATALOG values (@CatalogName,@Description,@Status,@ParentID,@ImageLogo)
end





GO
/****** Object:  StoredProcedure [dbo].[Catalog_Paging]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Catalog_Paging]
@CurrentPage int,
@PageSize int,
@table nvarchar(200),
@tableId nvarchar(100)
as
begin
	--tính tổng số bản ghi(row)
	declare @TotalRecord int;
	declare @totalPage int;
	--khai bao cau lenh va thuc thi cau lenh lay tong so ban ghi cua bang can phan trang
	declare @SqlString nvarchar(500);
	declare @SqlString1 nvarchar(500);
	set @SqlString = N'SELECT @TotalRecord=Count(*) FROM '+@table;
	execute sp_executesql @SqlString,N'@TotalRecord int out',@TotalRecord out

	-- tính tổng số trang
	if @TotalRecord%@PageSize >0
		set @totalPage = (@TotalRecord/@PageSize)+1;
	else
		set @totalPage = @TotalRecord/@PageSize;
	-- nếu trang hiện tại >1 thì gán nó bằng 1, nếu nó lớn hơn tống số trang thì gán nó bằng tổng số trang
	if @CurrentPage<1
		set @CurrentPage = 1;
	if @CurrentPage > @totalPage
		set @CurrentPage = @totalPage;
	-- lấy dữ liệu  của trang hiện tại 
	set @SqlString1 = 'Begin with temp as (select row_number() over (order by '+@tableId+') as RowNum,* from '+@table+') select * from temp where RowNum between ('
	+CAST (@CurrentPage	as nvarchar(10))+'-1)*'+CAST(@PageSize as nvarchar(10))+'+1 and '+CAST(@CurrentPage as nvarchar(10))+'*'+CAST(@PageSize as nvarchar(10))+' end;'
	execute sp_executesql @SqlString1

end





GO
/****** Object:  StoredProcedure [dbo].[Catalog_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Catalog_Update]
@CatalogID int,
@CatalogName nvarchar(100),
@Description nvarchar(max),
@Status bit,
@ParentID int,
@ImageLogo nvarchar(max)
as begin
	update CATALOG set CatalogName = @CatalogName,
		Description = @Description,
		Status = @Status,
		ParentID = @ParentID,
		image = @ImageLogo
	where CatalogID = @CatalogID
end





GO
/****** Object:  StoredProcedure [dbo].[Color_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Color_Delete]
@ColorID int
as
begin
	Delete  COLOR where ColorID = @ColorID
end





GO
/****** Object:  StoredProcedure [dbo].[Color_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Color_GetAll]
as
begin
	select * from COLOR
end





GO
/****** Object:  StoredProcedure [dbo].[Color_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Color_GetByID]	
@ColorID int
as
begin
	select * from COLOR where ColorID = @ColorID
end





GO
/****** Object:  StoredProcedure [dbo].[Color_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Color_Insert]
@ColorName varchar(50),
@Status bit
as
begin
	insert into COLOR values (@ColorName,@Status)
end





GO
/****** Object:  StoredProcedure [dbo].[Color_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Color_Update]
@ColorID int,
@ColorName varchar(50),
@Status bit
as
begin
	update COLOR set ColorName = @ColorName,
	Status = @Status
	 where ColorID = @ColorID
end





GO
/****** Object:  StoredProcedure [dbo].[Comment_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Comment_Delete]
@UserID int,
@ProductID nchar(10)
as
begin
	delete COMMENT 
		where UserID = @UserID and 
		ProductID = @ProductID
end





GO
/****** Object:  StoredProcedure [dbo].[Comment_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Comment_GetAll]

as
begin
	select * from COMMENT where status = 0

end



GO
/****** Object:  StoredProcedure [dbo].[Comment_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Comment_GetByID]
@UserID int,
@ProductID nchar(10)
as
begin
	select * from COMMENT
		where UserID = @UserID and 
		ProductID = @ProductID
end





GO
/****** Object:  StoredProcedure [dbo].[Comment_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Comment_Insert]
@UserID int,
@ProductID nchar(10),
@Comment nvarchar(max),
@CommentDate datetime,
@Status bit
as
begin
	insert into COMMENT values (@UserID,@ProductID,@Comment,@CommentDate,@Status)
end





GO
/****** Object:  StoredProcedure [dbo].[Comment_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Comment_Update]
@UserID int,
@ProductID nchar(10)
as
begin
	update COMMENT set
		status = 1
		where UserID = @UserID and 
		ProductID = @ProductID
end




GO
/****** Object:  StoredProcedure [dbo].[Function_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Function_Delete]
@FunctionID int	
as
begin
	DELETE dbo.[FUNCTION]  where FunctionID = @FunctionID
end




GO
/****** Object:  StoredProcedure [dbo].[Function_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Function_GetAll]
as
begin
select * from dbo.[FUNCTION]
end




GO
/****** Object:  StoredProcedure [dbo].[Function_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Function_GetByID]
@FunctionID int	
as
begin
select * from dbo.[FUNCTION] where FunctionID = @FunctionID
end




GO
/****** Object:  StoredProcedure [dbo].[Function_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Function_Insert]
@FunctionName nvarchar(100),
@Status bit 	
as
begin
	insert into dbo.[FUNCTION] values (@FunctionName,@Status)
end




GO
/****** Object:  StoredProcedure [dbo].[Function_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Function_Update]
@FunctionID int,
@FunctionName nvarchar(100),
@Status bit 	
as
begin
	update dbo.[FUNCTION] set FunctionName = @FunctionName,
		Status = @Status
		where FunctionID = @FunctionID
end




GO
/****** Object:  StoredProcedure [dbo].[GetAllCatalog]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllCatalog]
as begin
	select * from CATALOG
end





GO
/****** Object:  StoredProcedure [dbo].[GetAllCatalogByParent]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllCatalogByParent]
@ParentID int
as begin
	select * from CATALOG where ParentID = @ParentID
end





GO
/****** Object:  StoredProcedure [dbo].[Group_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Group_Delete]
@GroupID int
as
begin
	delete dbo.[GROUP] where GroupID  = @GroupID
end





GO
/****** Object:  StoredProcedure [dbo].[Group_DeleteFunctionInGroup]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Group_DeleteFunctionInGroup]
@GroupID int,
@FunctionID int
as begin
	delete GROUP_FUNCTION where GroupID = @GroupID and FunctionID = @FunctionID
end





GO
/****** Object:  StoredProcedure [dbo].[Group_Function_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Group_Function_Delete]
@GroupID int,
@FunctionID int
as
begin
	delete GROUP_FUNCTION
	where GroupID= @GroupID and FunctionID = @FunctionID

end





GO
/****** Object:  StoredProcedure [dbo].[Group_Function_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Group_Function_GetByID]
@GroupID int,
@FunctionID int
as
begin
	select * from GROUP_FUNCTION
	where GroupID= @GroupID and FunctionID = @FunctionID

end





GO
/****** Object:  StoredProcedure [dbo].[Group_Function_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Group_Function_Insert]
@GroupID int,
@FunctionID int,
@Status bit
as
begin
	insert into GROUP_FUNCTION values(@GroupID,@FunctionID,@Status)

end





GO
/****** Object:  StoredProcedure [dbo].[Group_Function_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Group_Function_Update]
@GroupID int,
@FunctionID int,
@Status bit
as
begin
	update GROUP_FUNCTION set
	Status = @Status
	where GroupID= @GroupID and FunctionID = @FunctionID

end





GO
/****** Object:  StoredProcedure [dbo].[Group_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Group_GetAll]
as
begin
	select * from dbo.[GROUP]
end





GO
/****** Object:  StoredProcedure [dbo].[Group_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Group_GetByID]
@GroupID int
as
begin
	select * from dbo.[GROUP] where GroupID = @GroupID
end





GO
/****** Object:  StoredProcedure [dbo].[Group_GetFunctionByGroupID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Group_GetFunctionByGroupID]
@GroupID int
as begin
	select g.GroupID,gf.FunctionID,gf.Status 
	from GROUP_FUNCTION gf 
	inner join dbo.[GROUP] g on g.GroupID = gf.GroupID
	where g.GroupID  = @GroupID
end





GO
/****** Object:  StoredProcedure [dbo].[Group_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Group_Insert]
@GroupName nvarchar(100),
@Status bit
as
begin
	insert into dbo.[GROUP] values (@GroupName,@Status)
end





GO
/****** Object:  StoredProcedure [dbo].[Group_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Group_Update]
@GroupID int,
@GroupName nvarchar(100),
@Status bit
as
begin
	update dbo.[GROUP] set GroupName = @GroupName
		,Status = @Status
		where GroupID  = @GroupID
end





GO
/****** Object:  StoredProcedure [dbo].[Imagelink_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Imagelink_Delete]
@ImageLinkID int
as begin
	delete IMAGELINK where ImageLinkID = @ImageLinkID
end



GO
/****** Object:  StoredProcedure [dbo].[Imagelink_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Imagelink_GetAll]
as
begin
	select il.ImageLinkID, p.ProductID, il.URL_before,il.URL_behind,il.URL_left,il.URL_right,il.Status 
	from PRODUCT p inner join IMAGELINK il on p.ProductID = il.ProductID
end




GO
/****** Object:  StoredProcedure [dbo].[Imagelink_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Imagelink_GetByID]
@ImageLinkID int
as
begin
	select il.ImageLinkID, p.ProductID, il.URL_before,il.URL_behind,il.URL_left,il.URL_right,il.Status 
	from PRODUCT p inner join IMAGELINK il on p.ProductID = il.ProductID where il.ImageLinkID = @ImageLinkID

end



GO
/****** Object:  StoredProcedure [dbo].[Imagelink_GetByProductID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Lay anh theo productID
-- =============================================
CREATE PROCEDURE [dbo].[Imagelink_GetByProductID] 
	@ProductID nchar(10) output
AS
BEGIN
	select iml.URL_before, iml.URL_behind, iml.URL_left, iml.URL_right from [IMAGELINK] iml where iml.ProductID = @ProductID;
END


GO
/****** Object:  StoredProcedure [dbo].[Imagelink_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Imagelink_Insert]
@ProductID nvarchar(50),
@URL_before varchar(100),
@URL_behind varchar(100),
@URL_left varchar(100),
@URL_right varchar(100),
@Status bit
as
begin
	insert into IMAGELINK values (@ProductID,@URL_before,@URL_behind,@URL_left,@URL_right,@Status)
end



GO
/****** Object:  StoredProcedure [dbo].[Imagelink_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Imagelink_Update]
@ImageLinkID int,
@ProductID nvarchar(50),
@URL_before varchar(100),
@URL_behind varchar(100),
@URL_left varchar(100),
@URL_right varchar(100),
@Status bit
as
begin
	update IMAGELINK set
		ProductID = @ProductID,
		URL_before = @URL_before,
		URL_behind = @URL_behind,
		URL_left = @URL_left,
		URL_right = @URL_right,
		Status = @Status
	where ImageLinkID = @ImageLinkID
end



GO
/****** Object:  StoredProcedure [dbo].[Order_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Order_Delete]
@OrderID int
as begin
	delete dbo.[ORDER] where OrderID = @OrderID
end




GO
/****** Object:  StoredProcedure [dbo].[Order_DetailByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Order_DetailByID]
@OrderID int
as begin
	select od.OrderID,od.ProductID,p.ProductName,od.Quantity,od.Amount,od.Status from ORDER_DETAIL od inner join PRODUCT p on od.ProductID = p.ProductID where od.OrderID = @OrderID
end



GO
/****** Object:  StoredProcedure [dbo].[Order_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Order_GetAll]
as begin
	select * from dbo.[ORDER] where Status = 0 order by OrderID DESC
end


GO
/****** Object:  StoredProcedure [dbo].[Order_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Order_GetByID]
@OrderID int
as begin
	select * from dbo.[ORDER] where OrderID = @OrderID and Status = 0
end



GO
/****** Object:  StoredProcedure [dbo].[Order_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Order_Insert]
@TotalAmount float,
@UserID int,
@Phone nvarchar(12),
@Email nvarchar(50),
@Address nvarchar(100) output

as begin
	Declare @OrderNumber int;
	set @OrderNumber = (select max(o.OrderNumber) from [ORDER] o) + 1;
	insert into dbo.[ORDER] values (N'Hoa Don Ban',@OrderNumber,GETDATE(),GETDATE(),@TotalAmount,@UserID,@Phone,@Email,@Address,0)
end




GO
/****** Object:  StoredProcedure [dbo].[Order_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Order_Update]
@OrderID int,
@OrderName nvarchar(100),
@OrderNumber int,
@Create datetime,
@PaymentDate datetime,
@TotalAmount float,
@UserID int,
@Phone nvarchar(12),
@Email nvarchar(50),
@Address nvarchar(100),
@Status bit
as begin
	update dbo.[ORDER] set 
	OrderName = @OrderName,
	OrderNumber = @OrderNumber,
	Created = @Create,
	PaymentDate = @PaymentDate,
	TotalAmount= @TotalAmount,
	UserID = @UserID, 
	Phone = @Phone,
	Email = @Email,
	Address = @Address,
	Status = @Status
	where OrderID =  @OrderID
end




GO
/****** Object:  StoredProcedure [dbo].[Order_Update_Status]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Order_Update_Status]
@OrderID int
as begin
	update dbo.[ORDER] set
	Status = 1
	where OrderID = @OrderID
end


GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Them hoa don chi tiet
-- =============================================
CREATE PROCEDURE [dbo].[OrderDetail_Insert]
	@ProductID nchar(10),
	@PriceImport float,
	@Amount float,
	@Quantity int output
AS
BEGIN
	Declare @OrderID int;
	set @OrderID = (select max(o.OrderID) from [Order] o);
	insert into ORDER_DETAIL values(@OrderID,@ProductID,@PriceImport,@Amount,@Quantity, 1);
END


GO
/****** Object:  StoredProcedure [dbo].[Payment_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Payment_Delete]
@PaymentID int
as begin
	delete PAYMENT where PaymentID = @PaymentID
end




GO
/****** Object:  StoredProcedure [dbo].[Payment_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Payment_GetAll]
as begin
	select * from PAYMENT 
end




GO
/****** Object:  StoredProcedure [dbo].[Payment_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Payment_GetByID]
@PaymentID int
as begin
	select * from PAYMENT where PaymentID = @PaymentID
end




GO
/****** Object:  StoredProcedure [dbo].[Payment_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Payment_Insert]
@OrderID int,
@Created Datetime,
@Status bit,
@PaymentTypeID int
as begin
	insert into PAYMENT values (@OrderID,@Created,@Status,@PaymentTypeID)
end




GO
/****** Object:  StoredProcedure [dbo].[Payment_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Payment_Update]
@PaymentID int,
@OrderID int,
@Created Datetime,
@Status bit,
@PaymentTypeID int
as begin
	update PAYMENT set 
	OrderID = @OrderID,
	 Created = @Created,
	 Status = @Status,
	 PaymentTypeID = @PaymentTypeID
	 where PaymentID = @PaymentID
end




GO
/****** Object:  StoredProcedure [dbo].[PaymentType_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[PaymentType_Delete]
@PaymentTypeID int
as begin
	delete PAYMENTTYPE where   PaymentTypeID = @PaymentTypeID
end




GO
/****** Object:  StoredProcedure [dbo].[PaymentType_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PaymentType_GetAll]
as begin
	select * from PAYMENTTYPE 
end




GO
/****** Object:  StoredProcedure [dbo].[PaymentType_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[PaymentType_GetByID]
@PaymentTypeID int
as begin
	select * from PAYMENTTYPE where   PaymentTypeID = @PaymentTypeID
end




GO
/****** Object:  StoredProcedure [dbo].[PaymentType_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PaymentType_Insert]
@PaymentTypeName nvarchar(100),
@Description nvarchar(100),
@Status bit
as begin
	insert into PAYMENTTYPE values (@PaymentTypeName,@Description,@Status) 
end




GO
/****** Object:  StoredProcedure [dbo].[PaymentType_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PaymentType_Update]
@PaymentTypeID int,
@PaymentTypeName nvarchar(100),
@Description nvarchar(100),
@Status bit
as begin
	update PAYMENTTYPE set 
	PaymentTypeName = @PaymentTypeName,
	Description =  @Description,
	Status =  @Status
	where PaymentTypeID = @PaymentTypeID

end




GO
/****** Object:  StoredProcedure [dbo].[Product_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Product_Delete]
@ProductID nchar(10)
as
begin
	delete PRODUCT where ProductID = @ProductID
end





GO
/****** Object:  StoredProcedure [dbo].[Product_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Product_GetAll]
as
begin
	select * from PRODUCT
end





GO
/****** Object:  StoredProcedure [dbo].[Product_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Product_GetByID]
@ProductID nchar(10)
as
begin
	--Update [PRODUCT] set NumberView = NumberView +1 where ProductID = @ProductID;
	select * from PRODUCT where ProductID = @ProductID
end

GO
/****** Object:  StoredProcedure [dbo].[Product_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Product_Insert]
@ProductID nchar(10),
@productName nvarchar(100),
@ContentDetail nvarchar(max),
@Image nvarchar(100),
@PriceImport float,
@PriceExport float,
@Discount real,
@FromDate date,
@ToDate date,
@Quantity int,
@Status bit,
@CatalogID int,
@NumberOfSeat int,
@CarType bit,
@NumberView int,
@YearOfManufacture int,
@PetrolTankCapacity float,
@TimeSpeed100 float
as
begin
	insert into PRODUCT values (@ProductID,@productName,@ContentDetail,@Image,@PriceImport,@PriceExport,@Discount,@FromDate,@ToDate,@Quantity,@Status,@CatalogID,@NumberOfSeat,@CarType,@NumberView,@YearOfManufacture,@PetrolTankCapacity,@TimeSpeed100)
end





GO
/****** Object:  StoredProcedure [dbo].[Product_InsertView]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Tăng số lượng view
-- =============================================
CREATE PROCEDURE [dbo].[Product_InsertView]
	@ProductID nchar(10)
	output
AS
BEGIN
	Update PRODUCT  set NumberView = NumberView+1 where ProductID = @ProductID;
	select * from PRODUCT where ProductID = @ProductID;
END


GO
/****** Object:  StoredProcedure [dbo].[Product_searchByName]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_searchByName] 
	@productName nvarchar(100)
AS
BEGIN

    -- Insert statements for procedure here
	SELECT * from PRODUCT p where p.ProductName like N'%' + @productName + '%'
	
END

GO
/****** Object:  StoredProcedure [dbo].[Product_TopNew]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: 23/04/2017
-- Description:	lay ra 4 san pham moi nhat
-- =============================================
CREATE PROCEDURE [dbo].[Product_TopNew]
	
AS
BEGIN
	
	select top 4 * from PRODUCT p order by p.YearOfManufacture desc;

END


GO
/****** Object:  StoredProcedure [dbo].[Product_TopView]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: 23/04/2017
-- Description:	lay 6 san pham co view cao nhat
-- =============================================
CREATE PROCEDURE [dbo].[Product_TopView]
	
AS
BEGIN
	
	SELECT TOP 6 * FROM PRODUCT p ORDER BY p.NumberView DESC;
END


GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Product_Update]
@ProductID nchar(10),
@productName nvarchar(100),
@ContentDetail nvarchar(max),
@Image nvarchar(100),
@PriceImport float,
@PriceExport float,
@Discount real,
@FromDate date,
@ToDate date,
@Quantity int,
@Status bit,
@CatalogID int,
@NumberOfSeat int,
@CarType bit,
@NumberView int,
@YearOfManufacture int,
@PetrolTankCapacity float,
@TimeSpeed100 float
as
begin
	update PRODUCT set 
	ProductName= @productName,
	ContentDetail = @ContentDetail,
	Image = @Image,
	PriceImport =  @PriceImport,
	PriceExport =  @PriceExport,
	Discount = @Discount,
	FromDate = @FromDate,
	ToDate = @ToDate,
	Quantity =  @Quantity,
	Status = @Status,
	CatalogID = @CatalogID,
	NumberOfSeat = @NumberOfSeat,
	CarType = @CarType,NumberView = @NumberView,
	YearOfManufacture = @YearOfManufacture,
	PetrolTankCapacity = @PetrolTankCapacity,
	TimeSpeed100 =  @TimeSpeed100
	where ProductID = @ProductID
end





GO
/****** Object:  StoredProcedure [dbo].[User_checkLogin]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Kiem tra tai khoan dang nhap
-- =============================================
CREATE PROCEDURE [dbo].[User_checkLogin] 
	@userName varchar(20),
	@password varchar(30),
	@returnCheck bit output
AS
BEGIN
	declare @cnt int;
	select @cnt=count(u.UserID) from [USER] u where u.UserName=@userName and u.Password = @password;
	if @cnt>0
		set @returnCheck = 1;
	else
		set @returnCheck = 0;
END


GO
/****** Object:  StoredProcedure [dbo].[User_CheckLogin_Admin]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[User_CheckLogin_Admin]
@UserName nvarchar(20),
@Password nvarchar(30)
as
begin
	select * from dbo.[USER] where UserName = @UserName and Password = @Password and GroupID = 3
end

GO
/****** Object:  StoredProcedure [dbo].[User_CheckSignup]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	kiem tra dieu kien dang ky>
-- =============================================
CREATE PROCEDURE [dbo].[User_CheckSignup] 
	@UserName varchar(20),
	@Email varchar(50),
	@check bit output
AS
BEGIN
	Declare @cnt int;
	select @cnt = count(u.UserID) from [User] u where (@UserName != null and @Email != null) and (u.UserName = @UserName or u.Email = @Email);
	if (@cnt > 0)
		set @check = 0;
	else
		set @check = 1;
END


GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_Delete]
@UserID int 
as begin
	delete dbo.[USER] where UserID = @UserID

end




GO
/****** Object:  StoredProcedure [dbo].[User_GetAll]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_GetAll]
as begin
	select * from dbo.[USER] 

end




GO
/****** Object:  StoredProcedure [dbo].[User_GetByID]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_GetByID]
@UserID int 
as begin
	select * from dbo.[USER] where UserID = @UserID

end




GO
/****** Object:  StoredProcedure [dbo].[User_GetByName]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[User_GetByName]
@UserName varchar(20) output 
as begin
	select * from dbo.[USER] where UserName = @UserName

end



GO
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[User_Insert]
@UserName varchar(20),
@Password varchar(30),
@Phone varchar(12),
@Email varchar(50),
@Address nvarchar(100),
@Gender bit,
@Birthday date,
@UserType nvarchar(50),
@GroupID int
as begin
	insert into dbo.[USER] values (@UserName,@Password,@Phone,@Email,@Address,@Gender,@Birthday,@UserType,@GroupID)

end

GO
/****** Object:  StoredProcedure [dbo].[User_Signup]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[User_Signup]
@UserName varchar(20),
@Password varchar(30),
@Phone varchar(12),
@Email varchar(50),
@Address nvarchar(100),
@Gender bit,
@Birthday date output

as begin
		insert into dbo.[USER] values (@UserName,@Password,@Phone,@Email,@Address,@Gender,@Birthday,N'Khách Hàng',4);

end

GO
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[User_Update]
@UserID int ,
@UserName varchar(20),
@Password varchar(30),
@Phone varchar(12),
@Email varchar(50),
@Address nvarchar(100),
@Gender bit,
@Birthday date,
@UserType nvarchar(50),
@GroupID int
as begin
	update dbo.[USER] set
	UserName = @UserName,
	Password =  @Password,
	Phone = @Phone, 
	Email = @Email,
	Address = @Address,
	Gender = @Gender,
	Birthday = @Birthday,
	UserType = @UserType,
	GroupID = @GroupID
	where UserID = @UserID

end



GO
/****** Object:  Table [dbo].[CATALOG]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATALOG](
	[CatalogID] [int] IDENTITY(1,1) NOT NULL,
	[CatalogName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[ParentID] [int] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_CATALOG] PRIMARY KEY CLUSTERED 
(
	[CatalogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COLOR]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLOR](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_COLOR] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMENT](
	[UserID] [int] NOT NULL,
	[ProductID] [nchar](10) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_COMMENT] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FAVORITE]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAVORITE](
	[UserID] [int] NOT NULL,
	[ProcductID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_FAVORITE] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProcductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FUNCTION]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUNCTION](
	[FunctionID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionName] [nvarchar](100) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FUNCTION] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GROUP]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUP](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_GROUP] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GROUP_FUNCTION]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUP_FUNCTION](
	[GroupID] [int] NOT NULL,
	[FunctionID] [int] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_GROUP_FUNCTION] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGELINK]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IMAGELINK](
	[ImageLinkID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nchar](10) NULL,
	[URL_before] [varchar](100) NULL,
	[URL_behind] [varchar](100) NULL,
	[URL_left] [varchar](100) NULL,
	[URL_right] [varchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_IMAGELINK] PRIMARY KEY CLUSTERED 
(
	[ImageLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](100) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[TotalAmount] [float] NOT NULL,
	[UserID] [int] NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER_DETAIL]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_DETAIL](
	[OrderID] [int] NOT NULL,
	[ProductID] [nchar](10) NOT NULL,
	[PriceImport] [float] NULL,
	[Amount] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ORDER_DETAIL] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAYMENT]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[PaymentTypeID] [int] NOT NULL,
 CONSTRAINT [PK_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAYMENTTYPE]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENTTYPE](
	[PaymentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_PAYMENTTYPE] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ProductID] [nchar](10) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ContentDetail] [nvarchar](max) NULL,
	[Image] [varchar](100) NOT NULL,
	[PriceImport] [float] NOT NULL,
	[PriceExport] [float] NOT NULL,
	[Discount] [real] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[Quantity] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CatalogID] [int] NOT NULL,
	[NumberOfSeat] [int] NULL,
	[CarType] [bit] NOT NULL,
	[NumberView] [int] NULL,
	[YearOfManufacture] [int] NOT NULL,
	[PetrolTankCapacity] [float] NOT NULL,
	[TimeSpeed100] [float] NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCT_COLOR]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT_COLOR](
	[ProductID] [nchar](10) NOT NULL,
	[ColorID] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCT_COLOR] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER]    Script Date: 6/6/2017 8:50:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Phone] [varchar](12) NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Gender] [bit] NOT NULL,
	[Birthday] [date] NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CATALOG] ON 

INSERT [dbo].[CATALOG] ([CatalogID], [CatalogName], [Description], [Status], [ParentID], [image]) VALUES (2, N'Infiniti', N'Day la  xe Infiniti', 1, 1, N'logo-infiniti.png')
INSERT [dbo].[CATALOG] ([CatalogID], [CatalogName], [Description], [Status], [ParentID], [image]) VALUES (3, N'Mercedes', N'day la xe Mercedes', 1, 2, N'logo-mercedes.png')
INSERT [dbo].[CATALOG] ([CatalogID], [CatalogName], [Description], [Status], [ParentID], [image]) VALUES (4, N'Audi', N'Day la audi', 1, 1, N'logo-audi.png')
INSERT [dbo].[CATALOG] ([CatalogID], [CatalogName], [Description], [Status], [ParentID], [image]) VALUES (5, N'BMW', N'BMW', 1, 1, N'logo-bmw.png')
INSERT [dbo].[CATALOG] ([CatalogID], [CatalogName], [Description], [Status], [ParentID], [image]) VALUES (12, N'Lexus', N'logo-lexus', 1, 1, N'logo-lexus.png')
SET IDENTITY_INSERT [dbo].[CATALOG] OFF
SET IDENTITY_INSERT [dbo].[COLOR] ON 

INSERT [dbo].[COLOR] ([ColorID], [ColorName], [Status]) VALUES (1, N'Red', 1)
INSERT [dbo].[COLOR] ([ColorID], [ColorName], [Status]) VALUES (2, N'Blue', 1)
INSERT [dbo].[COLOR] ([ColorID], [ColorName], [Status]) VALUES (3, N'Green', 1)
INSERT [dbo].[COLOR] ([ColorID], [ColorName], [Status]) VALUES (4, N'yellow', 1)
INSERT [dbo].[COLOR] ([ColorID], [ColorName], [Status]) VALUES (5, N'Gray', 1)
INSERT [dbo].[COLOR] ([ColorID], [ColorName], [Status]) VALUES (6, N'White', 1)
SET IDENTITY_INSERT [dbo].[COLOR] OFF
INSERT [dbo].[COMMENT] ([UserID], [ProductID], [Comment], [CommentDate], [status]) VALUES (1, N'SP001     ', N'oto dep qua', CAST(N'2017-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[COMMENT] ([UserID], [ProductID], [Comment], [CommentDate], [status]) VALUES (1, N'SP002     ', N'oto gia dat qua', CAST(N'2017-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[COMMENT] ([UserID], [ProductID], [Comment], [CommentDate], [status]) VALUES (2, N'SP001     ', N'Co nhung mau nao vay?', CAST(N'2019-01-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[COMMENT] ([UserID], [ProductID], [Comment], [CommentDate], [status]) VALUES (3, N'SP003     ', N'Tam Thuong', CAST(N'2019-05-05 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[COMMENT] ([UserID], [ProductID], [Comment], [CommentDate], [status]) VALUES (3, N'SP012     ', N'Dep qua', CAST(N'2017-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[COMMENT] ([UserID], [ProductID], [Comment], [CommentDate], [status]) VALUES (9, N'SP012     ', N'Qua Binh Thuong', CAST(N'2017-02-04 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[COMMENT] ([UserID], [ProductID], [Comment], [CommentDate], [status]) VALUES (9, N'SP013     ', N'binh thuong', CAST(N'2017-02-03 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[FAVORITE] ([UserID], [ProcductID]) VALUES (1, N'SP001     ')
INSERT [dbo].[FAVORITE] ([UserID], [ProcductID]) VALUES (1, N'SP002     ')
INSERT [dbo].[FAVORITE] ([UserID], [ProcductID]) VALUES (2, N'SP003     ')
INSERT [dbo].[FAVORITE] ([UserID], [ProcductID]) VALUES (3, N'SP001     ')
INSERT [dbo].[FAVORITE] ([UserID], [ProcductID]) VALUES (3, N'SP002     ')
INSERT [dbo].[FAVORITE] ([UserID], [ProcductID]) VALUES (9, N'SP001     ')
INSERT [dbo].[FAVORITE] ([UserID], [ProcductID]) VALUES (9, N'SP012     ')
INSERT [dbo].[FAVORITE] ([UserID], [ProcductID]) VALUES (9, N'SP013     ')
SET IDENTITY_INSERT [dbo].[FUNCTION] ON 

INSERT [dbo].[FUNCTION] ([FunctionID], [FunctionName], [Status]) VALUES (1, N'Xem Thông Tin Sản Phẩm, Tìm Kiếm', 1)
INSERT [dbo].[FUNCTION] ([FunctionID], [FunctionName], [Status]) VALUES (2, N'Xem Thông Tin Danh Mục', 1)
INSERT [dbo].[FUNCTION] ([FunctionID], [FunctionName], [Status]) VALUES (3, N'Thêm,Sửa,Xóa Thông Tin Sản Phẩm', 1)
INSERT [dbo].[FUNCTION] ([FunctionID], [FunctionName], [Status]) VALUES (4, N'Duyệt Đơn Hàng', 1)
INSERT [dbo].[FUNCTION] ([FunctionID], [FunctionName], [Status]) VALUES (5, N'Duyệt Comment', 1)
SET IDENTITY_INSERT [dbo].[FUNCTION] OFF
SET IDENTITY_INSERT [dbo].[GROUP] ON 

INSERT [dbo].[GROUP] ([GroupID], [GroupName], [Status]) VALUES (1, N'Nhân Viên', 1)
INSERT [dbo].[GROUP] ([GroupID], [GroupName], [Status]) VALUES (2, N'Quản Lý', 1)
INSERT [dbo].[GROUP] ([GroupID], [GroupName], [Status]) VALUES (3, N'Quản Trị', 1)
INSERT [dbo].[GROUP] ([GroupID], [GroupName], [Status]) VALUES (4, N'Khách Hàng', 1)
SET IDENTITY_INSERT [dbo].[GROUP] OFF
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (1, 1, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (2, 3, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (2, 4, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (2, 5, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (3, 1, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (3, 2, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (3, 3, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (3, 4, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (3, 5, 1)
INSERT [dbo].[GROUP_FUNCTION] ([GroupID], [FunctionID], [Status]) VALUES (4, 1, 1)
SET IDENTITY_INSERT [dbo].[IMAGELINK] ON 

INSERT [dbo].[IMAGELINK] ([ImageLinkID], [ProductID], [URL_before], [URL_behind], [URL_left], [URL_right], [Status]) VALUES (1, N'SP001     ', N'A8L-quattro.jpg', N'A8L-quattro-2.jfif', N'A8L-quattro-3.jfif', N'A8L-quattro-4.jfif', 1)
INSERT [dbo].[IMAGELINK] ([ImageLinkID], [ProductID], [URL_before], [URL_behind], [URL_left], [URL_right], [Status]) VALUES (2, N'SP002     ', N'Q7-quattro-white.jfif', N'Q7-quattro-white-2.jfif', N'Q7-quattro-white-3.jfif', N'Q7-quattro-white-4.jfif', 0)
INSERT [dbo].[IMAGELINK] ([ImageLinkID], [ProductID], [URL_before], [URL_behind], [URL_left], [URL_right], [Status]) VALUES (3, N'SP003     ', N'bmw-320i-black.jfif', N'bmw-320i-black-2.jfif', N'bmw-320i-black-3.jfif', N'bmw-320i-black-4.jfif', 1)
INSERT [dbo].[IMAGELINK] ([ImageLinkID], [ProductID], [URL_before], [URL_behind], [URL_left], [URL_right], [Status]) VALUES (4, N'SP010     ', N'bmw-x5-white.jfif', N'bmw-x5-white-2.jfif', N'bmw-x5-white-3.jfif', N'bmw-x5-white-4.jfif', 1)
INSERT [dbo].[IMAGELINK] ([ImageLinkID], [ProductID], [URL_before], [URL_behind], [URL_left], [URL_right], [Status]) VALUES (5, N'SP011     ', N'Accord-gold.jfif', N'Accord-gold-2.jfif', N'Accord-gold-3.jfif', N'Accord-gold-4.jfif', 1)
INSERT [dbo].[IMAGELINK] ([ImageLinkID], [ProductID], [URL_before], [URL_behind], [URL_left], [URL_right], [Status]) VALUES (6, N'SP012     ', N'ODYSSEY-white.jfif', N'ODYSSEY-white-2.jfif', N'ODYSSEY-white-3.jfif', N'ODYSSEY-white-4.jfif', 1)
INSERT [dbo].[IMAGELINK] ([ImageLinkID], [ProductID], [URL_before], [URL_behind], [URL_left], [URL_right], [Status]) VALUES (7, N'SP013     ', N'Grand-i10-black.jfif', N'Grand-i10-black-2.jfif', N'Grand-i10-black-3.jfif', N'Grand-i10-black-4.jpg', 1)
INSERT [dbo].[IMAGELINK] ([ImageLinkID], [ProductID], [URL_before], [URL_behind], [URL_left], [URL_right], [Status]) VALUES (8, N'SP014     ', N'Elantra-white.jfif', N'Elantra-white-2.jfif', N'Elantra-white-3.jfif', N'Elantra-white-4.jpg', 1)
SET IDENTITY_INSERT [dbo].[IMAGELINK] OFF
SET IDENTITY_INSERT [dbo].[ORDER] ON 

INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (1, N'Hoa Don Ban', 1001, CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2017-01-01 01:00:00.000' AS DateTime), 20000, 1, N'0989760107', N'trieukhactu@gmail.com', N'ha noi', 0)
INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (2, N'Hoa Don Ban', 1002, CAST(N'2016-11-01 00:00:00.000' AS DateTime), CAST(N'2017-01-01 00:00:01.000' AS DateTime), 10000, 2, N'0165682992', N'huyen@gmail.com', N'ha noi', 0)
INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (3, N'Hoa Don Ban', 1003, CAST(N'2017-02-04 00:00:00.000' AS DateTime), CAST(N'2017-02-04 00:00:00.000' AS DateTime), 1500, 1, N'0975456433', N'dkjbf@gmail.com', N'ha tay', 1)
INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (5, N'Hoa Don Ban', 1004, CAST(N'2017-06-02 10:04:14.430' AS DateTime), CAST(N'2017-06-02 10:04:14.430' AS DateTime), 6000, 3, N'0999999999', N'admin@gmail.com', N'ha tay', 0)
INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (6, N'Hoa Don Ban', 1005, CAST(N'2017-06-02 10:20:19.940' AS DateTime), CAST(N'2017-06-02 10:20:19.940' AS DateTime), 2000, 3, N'0999999999', N'admin@gmail.com', N'ha tay', 0)
INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (7, N'Hoa Don Ban', 1006, CAST(N'2017-06-02 19:26:46.893' AS DateTime), CAST(N'2017-06-02 19:26:46.893' AS DateTime), 5600000, 3, N'0999999999', N'admin@gmail.com', N'ha tay', 0)
INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (8, N'Hoa Don Ban', 1007, CAST(N'2017-06-03 00:26:10.060' AS DateTime), CAST(N'2017-06-03 00:26:10.060' AS DateTime), 1650000, 9, N'0976410493', N'vanlong2904@gmail.com', N'vinh phuc', 0)
INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (9, N'Hoa Don Ban', 1008, CAST(N'2017-06-03 07:41:58.897' AS DateTime), CAST(N'2017-06-03 07:41:58.897' AS DateTime), 2700000, 9, N'0976410493', N'vanlong2904@gmail.com', N'vinh phuc', 0)
INSERT [dbo].[ORDER] ([OrderID], [OrderName], [OrderNumber], [Created], [PaymentDate], [TotalAmount], [UserID], [Phone], [Email], [Address], [Status]) VALUES (10, N'Hoa Don Ban', 1009, CAST(N'2017-06-03 09:29:43.590' AS DateTime), CAST(N'2017-06-03 09:29:43.590' AS DateTime), 3800000, 9, N'0976410493', N'vanlong2904@gmail.com', N'vinh phuc', 0)
SET IDENTITY_INSERT [dbo].[ORDER] OFF
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (1, N'SP001     ', NULL, 1000, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (1, N'SP002     ', NULL, 2000, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (2, N'SP002     ', NULL, 2000, 2, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (3, N'SP003     ', NULL, 1500, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (5, N'SP002     ', 1000, 2000, 2, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (6, N'SP003     ', 1000, 1000, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (7, N'SP001     ', 2000000, 2000000, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (7, N'SP002     ', 1500000, 3000000, 2, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (8, N'SP011     ', 600000, 1200000, 2, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (8, N'SP013     ', 150000, 150000, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (9, N'SP003     ', 500000, 500000, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (9, N'SP010     ', 1800000, 1800000, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (10, N'SP001     ', 2000000, 2000000, 1, 1)
INSERT [dbo].[ORDER_DETAIL] ([OrderID], [ProductID], [PriceImport], [Amount], [Quantity], [Status]) VALUES (10, N'SP003     ', 500000, 1000000, 2, 1)
SET IDENTITY_INSERT [dbo].[PAYMENT] ON 

INSERT [dbo].[PAYMENT] ([PaymentID], [OrderID], [Created], [Status], [PaymentTypeID]) VALUES (1, 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[PAYMENT] OFF
SET IDENTITY_INSERT [dbo].[PAYMENTTYPE] ON 

INSERT [dbo].[PAYMENTTYPE] ([PaymentTypeID], [PaymentTypeName], [Description], [Status]) VALUES (1, N'payment1', N'abc 1', 1)
INSERT [dbo].[PAYMENTTYPE] ([PaymentTypeID], [PaymentTypeName], [Description], [Status]) VALUES (2, N'payment2', N'abc 2', 1)
INSERT [dbo].[PAYMENTTYPE] ([PaymentTypeID], [PaymentTypeName], [Description], [Status]) VALUES (3, N'payment3', N'abc 33', 1)
SET IDENTITY_INSERT [dbo].[PAYMENTTYPE] OFF
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ContentDetail], [Image], [PriceImport], [PriceExport], [Discount], [FromDate], [ToDate], [Quantity], [Status], [CatalogID], [NumberOfSeat], [CarType], [NumberView], [YearOfManufacture], [PetrolTankCapacity], [TimeSpeed100]) VALUES (N'SP001     ', N'Audi A8L quattro', N'Audi A8L với thiết kế đầy tiện nghi, thư giãn, và thậm chí có thể trở thành một văn phòng làm việc di động. Trang thiết bị đa dạng và nhiều chức năng của Audi A8 L sẽ làm cho bạn thấy thật sự hài lòng. Ngoài ra còn vô số tùy chọn những tính năng hỗ trợ nổi bật khác giúp cho mỗi hành trình trở thành những trải nghiệm không thể nào quên. <hr>

Đèn pha ma trận Audi LED<hr>

Hệ thống đèn pha LED sắp xếp theo dạng ma trận sử dụng các dữ liệu ghi nhận được từ camera, cảm biến và hệ thống định vị nhằm đảm bảo sự chiếu sáng chính xác và có lựa chọn với một vùng rộng xung quanh xe. Các cụm đèn LED có thể tự động bật và tắt chỉ trong một phần nghìn giây và có thể tự động làm mờ. Sự chuyển đổi chế độ chiếu cao hoặc thấp sẽ được tự động điều chỉnh cùng những chức năng tiện lợi như đèn tính hiệu, đèn cho mọi thời tiết, đèn liếc năng động, đèn pha với chức năng chống lóa theo yêu cầu, đèn vào đường giao nhau cũng như các chế độ chiếu sáng đường dài, đường cao tốc và đường thành phố đều tích hợp và sử dụng công nghệ LED. Hệ thống đèn pha mới tương tự như ánh sáng ban ngày, tiết kiệm năng lượng và tuổi thọ tất cao, được đánh giá tích cực từ những người tham gia giao thông khác là những đặc trưng trong công nghệ chiếu sáng của Audi. Hệ thống còn có thiết kế đặc biệt cho các chế độ chiếu sáng ban ngày và ban đêm với những cách thể hiện sinh động cho đèn pha trước và đèn hậu sau xe. Các chức năng thuận tiện của hệ thống hỗ trợ ánh sáng sử dụng dữ liệu vệ tinh GPS để chuyển từ chế độ tay lái thuận sang tay lái nghịch khi bạn đi du lịch qua nhiều quốc gia. <hr>

Chìa khóa thông minh tích hợp chế độ cảm ứng mở nắp cốp sau<hr>

Nắp khoang hành lý hay các cửa xe có thể điều khiển đóng hay mở mà không cần ấn nút trên chìa khóa xe. Chỉ cần chạm nhẹ vào tay nắm cửa hay tay mở cốp sau là chúng có thể tự động mở. Chỉ cần chiếc chìa khóa xe trong túi, nắp khoang hành lý sau có thể mở khi xe bị khóa và đặc biệt nó có thể tự động mở ra khi bạn hua chân dưới ba đờ sốc sau (như tư thế đá chân). Nắp khoang hành lý cũng có thể được mở ra khi xe đang bị khóa. <hr>

Hệ thống hỗ trợ đỗ xe cùng với hệ thống hiển thị xung quanh. <hr>

Audi A8L thế hệ mới có trang bị hệ thống điều khiển vô-lăng tự động khi đổ xe. Các cảm biến siêu âm được lắp kín đáo tại các cản hai bên xe cho phép tìm kiếm những khoang đỗ xe phù hợp trong bãi đỗ xe hay trên lề đường. Hệ thống sẽ tính toán chỗ đỗ xe lý tưởng trong bãi đậu xe hay trên lề đường bao gồm cả khi đỗ và khi ra. Người điều khiển chỉ phải sử dụng chân ga hay chân phanh và quan sát quá trình đưa xe vào vị trí đỗ hay ra khỏi vị trí đỗ. Phụ thuộc vào góc lái, hệ thống sẽ cảnh báo trước cho người lái khi có bất cứ vật cản nào ở hai bên xe. Hệ thống đỗ tự động có thể tùy chọn với option có trang bị camera lùi hay camera 360. <hr>

 

Audi A8L thế hệ mới thể hiện sự đĩnh đạc và mạnh mẽ đầy ấn tượng bên ngoài cùng không gian rộng thoáng bên trong. Chiều dài cơ sở của xe dài hơn 13 cm so với phiên bản Audi A8 giúp không gian trong xe rộng rãi và sang trọng hơn. <hr>

Tùy chọn hệ thống âm thanh cao cấp Bang & Olufsen. <hr>


Hệ thống âm thanh siêu cấp B&O tạo ra âm thanh vòm trung thực, thông qua 19 loa bao gồm cả loa siêu trầm được bố trí kênh âm li kỹ thuật số riêng biệt. Một âm li kỹ thuật số của ICEpower có hiệu suất cao gồm 5 kênh dành riêng cho các loa trầm và siêu trầm, một âm li kỹ thuật số DSP khác với 14 kênh dành cho các loa còn lại. Toàn bộ hệ thống có công suất trên 1.400W và có thể tạo ra âm thanh vòm 5.1. Các mặt loa làm bằng nhôm và sử dụng công nghệ thấu kính âm thanh độc đáo cho phép mở rộng dải phát âm thanh tuyệt hảo tới từng vị trí ngồi trong xe. Ngoài ra, âm lượng của hệ thống có thể còn được điều chỉnh tự động tùy thuộc vào tiếng ồn xung quanh. Sự riêng tư cũng được bảo đảm nhờ áp dụng các loa được bọc kín nhằm giảm thiểu âm thanh thoát ra bên ngoài xe, giúp bạn an tâm thực hiện các cuộc điện thoại rảnh tay ở trong xe. <hr>


Hệ thống đèn nội thất. <hr>


Hệ thống đèn nội thất sử dụng công nghệ LED với tính năng chống chói cho hành khách. Hệ thống đèn nội thất bao gồm dải đèn trên trần và hai bên xe, đèn cho các ngăn đựng đồ trên cửa, chiếu sáng chỗ để chân, tay nắm và đèn ngưỡng cửa, đèn hiệu ứng nổi cho bảng khiển trung tâm. Hệ thống đèn nội thất có thể điều chỉnh riêng biệt 4 vùng tùy chọn 20 mức độ ánh sáng và 3 màu cảm xúc có thể lựa chọn với hệ thống MMI®.

', N'A8L-quattro.jpg', 2000000, 2400000, 10, CAST(N'2017-01-01' AS Date), CAST(N'2017-01-06' AS Date), 10, 1, 4, 4, 0, 56, 2015, 82, 5.9)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ContentDetail], [Image], [PriceImport], [PriceExport], [Discount], [FromDate], [ToDate], [Quantity], [Status], [CatalogID], [NumberOfSeat], [CarType], [NumberView], [YearOfManufacture], [PetrolTankCapacity], [TimeSpeed100]) VALUES (N'SP002     ', N'Audi Q7 quattro', N'Audi Q7 2017 được thiết kế lại hoàn toàn, có thể nói đây là lần cách tân kiểu dáng rõ rệt nhất trên Q7 kể từ khi chiếc SUV này ra đời năm 2007. Chiếc SUV được ra mắt với mục đích thiết lập nên những chuẩn mực mới cho dòng SUV ở đặc tính thể thao và mức nhiên liệu hiệu quả.<hr>
Ngoại thất sắc nét, “điển trai” hơn rất nhiều nhờ một phần ở lưới tản nhiệt góc cạnh cỡ lớn. Bên cạnh đó, nội thất xe cũng rất phong phú từ bài trí cho đến các công nghệ hiện đại như trên chiếc sedan A8 sang trọng. <hr>
Mặc dù được biết đến là chiếc SUV lớn nhất của Audi, Q7 vẫn chứng tỏ không hề kém sức hút khi sở hữu khả năng vận hành, xử lý dễ dàng, mượt mà. <hr>

Dưới mui xe, khối động cơ tăng áp V6 cũng được thay đổi đáng kể, đồng thời trọng lượng thân xe được giảm bớt giúp tiết kiệm nhiên liệu hơn rất nhiều. <hr>
Nhược điểm cần khắc phục nhất của Audi Q7 2017 chính là khả năng vận chuyển đồ đạc, do khoang hành lý khá hạn chế. Trong khi đó, các đối thủ như Mercedes-Benz GLE và Volvo XC90 lại sở hữu không gian chứa đồ rộng rãi. <hr>
Một vài điểm ngoại thất nổi bật<hr>
Audi Q7 thế hệ mới được nhiều tín đồ xe hơi toàn thế giới đánh giá là mẫu SUV hạng sang nổi bật nhất trong phân khúc. Xe được nâng cấp thiết kế tinh tế hơn với nhiều đường nét thể thao xen lẫn sự sang trọng và trẻ trung. <hr>

Sử dụng chung nền tảng khung gầm với Volkswagen Touareg và Porsche Cayenne, Audi Q7 2017 có khả năng off-road ở mức tối ưu nhưng nó cũng đầy sang trọng khi xuống phố mà không tỏ ra quá cồng kềnh. <hr>
Chiếc SUV cỡ lớn của Audi sở hữu ngoại hình thay đổi nhẹ, tăng cảm giác thể thao và dữ dằn với lưới tản nhiệt khung đơn cỡ lớn, có viền bao quanh. <hr>
Vòm bánh xe mạnh mẽ với đường gờ thân xe nhấn mạnh vẻ đẹp các bánh xe, trong khi đó cửa sau được kéo dài vuốt qua trục D. Chúng kết hợp với nhau nhờ các giải pháp mới như các đường gờ và ốp phía dưới các cánh cửa. <hr>
Tổng thể của chiếc SUV hạng sang nhà Audi mang phong cách thể thao, rộng và phẳng hơn nhờ phần đuôi xe có hơi hướng "nở hậu". Ống xả lớn đặt cách xa nhau, cửa sau rộng hơn dễ xếp đồ tạo cảm giác đuôi xe bề thế hơn.
', N'Q7-quattro-white-2.jfif', 1500000, 1600000, 10, CAST(N'2017-01-01' AS Date), CAST(N'2017-01-06' AS Date), 10, 1, 4, 5, 1, 18, 2016, 85, 6.3)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ContentDetail], [Image], [PriceImport], [PriceExport], [Discount], [FromDate], [ToDate], [Quantity], [Status], [CatalogID], [NumberOfSeat], [CarType], [NumberView], [YearOfManufacture], [PetrolTankCapacity], [TimeSpeed100]) VALUES (N'SP003     ', N'BMW 320i', N'Được bán tại hơn 130 quốc gia trên toàn cầu, BMW Series 3 là dòng xe thành công nhất về mặt doanh số trong chuỗi sản phẩm của BMW, liên tục chiếm đến 20% tổng số lượng xe bán ra hàng tháng của BMW trên toàn Thế Giới. BMW Series 3 - mẫu xe tiên phong trong phân khúc sedan thể thao thời thượng và đã được công nhận như một biểu tượng trong suốt 40 năm qua. Trải qua 6 thế hệ từ năm 1975 đến nay, BMW Series 3 đã liên tục thiết lập các tiêu chuẩn mới của sự năng động, vận hành xuất sắc, cũng như tính hiệu quả và nét thiết kế thể thao đậm chất BMW, sự giao thoa giữa trải nghiệm lái rất đặc trưng và khả năng tiện dụng, phù hợp cho việc sử dụng đi lại hàng ngày<hr>
BMW Series 3 phiên bản mới mang thiết kế sắc nét hơn, công nghệ tiên tiến hơn, động cơ ưu việt hơn. Đảm bảo cho dòng xe những ưu thế cạnh tranh độc đáo và sức hấp dẫn khó chối từ. Diện mạo thể thao hơn khi nhìn từ trước và sau với đèn chiếu sáng (full-LED tùy chọn) và cặp đèn hậu mang thiết kế mới nâng tầm đẳng cấp cho chủ nhân. Chất lượng và thiết kế của nội thất hướng đến người lái được với các chất liệu và điểm nhấn được sử dụng tạo nên cảm quan về sự sang trọng đỉnh cao. BMW Series 3 phiên bản mới được phân phối tại Việt Nam với 02 phiên bản động cơ mới: <hr>
BMW 320i Động cơ xăng mới 2.0L, công suất 184 mã lực @ 5.000 vòng/phút. Mô men xoắn cực đại 270 Nm @ 1.250 vòng/ phút. <hr>

NGOẠI THẤT ẤN TƯỢNG<hr>

Ngoại hình bắt mắt của BMW Series 3 phiên bản mới là một lời tuyên bố đầy kiêu hãnh mỗi khi xuất hiện trên đường phố. Những chi tiết thiết kế đặc trưng như một tác phẩm điêu khắc, mang đậm dấu ấn BMW như nắp ca-pô dài, khoang hành khách dời xa về phía sau, cản trước và sau ngắn, trục cơ sở dài tạo ra nên một tỷ lệ vàng hướng đến tính năng động, sự phân bổ trọng lượng hoàn hảo 50:50 ở cầu trước và cầu sau. <hr>
Hệ thống đèn pha kép được thiết kế với độ chính xác và thẫm mỹ cao nhấn mạnh đến chủ nghĩa năng động của BMW Series 3, trong khi phần đuôi xe vuốt xuống đầy mạnh mẽ, tạo nên tổng thể thật hoàn chỉnh, đường nét thân xe mang đến hiệu ứng ánh sáng tuyệt đẹp với các đường gân nổi sắc nét, nhấn mạnh tính thể thao và khơi gợi cảm xúc cho những ai thưởng ngoạn. <hr>
Thiết kế của BMW 3 Series mới thực sự nổi bật vì hướng đến độ sắc sảo và sự cải tiến trong nhiều chi tiết. Ngay phần cản trước, BMW Series 3 phiên bản mới được thiết kế lại hốc lấy gió phía trước, vừa cải thiện thêm tính năng khí động học, và tăng thêm sự mạnh mẽ, trẻ trung từ cái nhìn đầu tiên. Hai dòng xe 320i và 330i sẽ có mặt thị trường Việt Nam được trang bị đèn pha LED với thiết kế mới tăng thêm sự sang trọng và cá tính chủ nhân. Hai đường gân kép nổi bật ở mỗi bên, trên nắp capô tạo nên dạng V-shape mạnh mẽ, thể thao, đồng thời thể hiện thiết kế mang tính khí động học cao, là điểm nhấn nổi bật cho phần đầu xe. Lưới tản nhiệt kép lớn, đậm chất thể thao, với kiểu dáng đặc trưng như nhấn mạnh dáng vẻ của một vận động viên mạnh mẽ và uy dũng. Cản trước kết hợp khéo léo với đèn sương mù công nghệ LED nổi bật sự tinh tế trong thiết kế phần ngoại thất. <hr>
Cụm đèn hậu với thiết kế mới mẻ và đột phá tạo nên nét cá tính độc đáo cho BMW Series 3. Kiểu dáng chữ L được cải tiến lại với đường nét mềm mại và bắt mắt hơn. Công nghệ đèn LED ống đặc trưng với màu nền đỏ sậm cùng phần đèn sương mù phía sau màu trắng đầy sáng tạo điểm nhấn ấn tượng, độc đáo. Cản sau cũng được thiết kế mang hơi hướng 3D hơn, một đường sọc ngang ở cản sau màu đen bóng nhấn mạnh đến độ rộng của xe.


', N'bmw-320i-white.jfif', 500000, 700000, 10, CAST(N'2017-01-01' AS Date), CAST(N'2017-01-01' AS Date), 10, 1, 2, 5, 0, 18, 2016, 60, 7.3)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ContentDetail], [Image], [PriceImport], [PriceExport], [Discount], [FromDate], [ToDate], [Quantity], [Status], [CatalogID], [NumberOfSeat], [CarType], [NumberView], [YearOfManufacture], [PetrolTankCapacity], [TimeSpeed100]) VALUES (N'SP010     ', N'BMW X5', N'BMW là hãng xe đầu tiên định nghĩa dòng xe SAV (Sports Activity Vehicle), một biến thể của dòng xe SUV truyền thống khi kết hợp tính sang trọng của những chiếc sedan và sự thực dụng của xe SUV mà X5 (1999) là kẻ tiên phong trong phân khúc này. Dòng xe này đã giúp BMW "đốn tim" những khách hàng trẻ tuổi đang tìm kiếm một mẫu xe gầm cao đa dụng đáp ứng kiểu dáng thể thao và cảm giác lái "đúng chất". Trải qua 15 năm kể từ khi ra mắt, X5 đã qua 3 thế hệ với hơn 1,3 triệu xe bán ra trên toàn thế giới.<hr>
Thế hệ thứ 3 của BMW X5 ra mắt lần đầu tiên vào tháng 5/2013 và chính thức bán ra thị trường vào tháng 11/2013. Bên cạnh những nét đặc trưng nhất của dòng xe X trong gia đình BMW như kiểu dáng nam tính, động cơ mạnh mẽ, nội thất sang trọng, cảm giác lái thể thao. X5 thế hệ mới còn thỏa mãn những tín đồ của mình với thiết kế hiện đại và cuốn hút hơn cùng khả năng vận hành hiệu quả và tiết kiệm... <hr>
Tại thị trường Việt Nam, BMW X5 thế hệ mới được nhà phân phối Euro Auto giới thiệu đến người tiêu dùng vào giữa tháng 4/2014 với hai phiên bản động cơ xăng. Một phiên bản động cơ Diesel cũng sẽ được giới thiệu tại Việt Nam vào quý 3 năm nay. Ở phiên bản xDrive35i được trang bị động cơ I6 dung tích 3.0L công suất 306 mã lực có giá bán 3,648 tỷ đồng. Phiên bản xDrive50i được trang bị động cơ V8, dung tích 4,4 lít công suất 450 mã lực có giá bán 4,988 tỷ đồng. <hr>
Cả hai phiên bản đều được trang bị hộp số tự động 8 cấp thể thao, hệ dẫn động 4 bánh xDrive danh tiếng và hàng ghế thứ 3 với trang bị tiêu chuẩn. <hr>
Ngoại thất<hr>
Kiểu dáng của BMW X5 hầu như không có sự thay đổi từ khi ra mắt, mẫu xe tiên phong trong gia đình X vẫn giữ những đường cong mạnh mẽ và nam tính. Ở mỗi thế hệ, BMW lại đưa những công nghệ và xu hướng thiết kế của mình lên mẫu xe mới giúp xe hiện đại hơn và tương đồng với những người anh em khác trong gia đình. Những điểm thay đổi tạo nên dáng vẻ thể thao ấn tượng trên BMW X5 2014 bao gồm hệ thống đèn pha 02 vòng tròn kép, cản trước thể thao hơn, các chi tiết hút gió và thoát gió, đuôi xe với cánh gió thể thao cùng cụm đèn hậu LED 3D thu hút . <hr>
Điểm khác nhau trong thiết kế ngoại thất giữa phiên bản là bộ lazang hợp kim nan hình chữ V ở phiên bản xDrive35i và nan hình sao ở phiên bản xDrive50i. Ngoại thất phiên bản xDrive50i còn được trang bị thêm viền crom bên ngoài và gói phụ kiện Pure Experience

', N'bmw-x5-black.jfif', 1800000, 2000000, 10, CAST(N'2017-01-01' AS Date), CAST(N'2017-01-06' AS Date), 10, 1, 5, 5, 1, 16, 2014, 85, 6.5)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ContentDetail], [Image], [PriceImport], [PriceExport], [Discount], [FromDate], [ToDate], [Quantity], [Status], [CatalogID], [NumberOfSeat], [CarType], [NumberView], [YearOfManufacture], [PetrolTankCapacity], [TimeSpeed100]) VALUES (N'SP011     ', N'Accord', N'Ra đời vào năm 1976 tại Nhật, mẫu xe toàn cầu Honda Accord qua 40 năm phát triển đã đạt doanh số cộng dồn lên tới hơn 21 triệu xe tính đến hết tháng 12/2015, trở thành biểu tượng tự hào của Honda về độ bền bỉ, chất lượng và sự tin cậy. <hr>

Chính thức được giới thiệu đến thị trường Việt Nam vào năm 2011, Honda Accord đến nay luôn giữ vị trí là lá cờ đầu, biểu trưng cho các giá trị cốt lõi của các sản phẩm ô tô mang thương hiệu Honda. <hr>

Tháng 6/2014, Công ty Honda Việt Nam (HVN) giới thiệu Honda Accord thế hệ thứ 9 hoàn toàn mới nhập khẩu nguyên chiếc từ Thái Lan. Được cấu thành từ ba đặc tính: Tiên tiến – Chất lượng – Thông minh, Honda Accord thế hệ 9 sở hữu thiết kế ngoại thất hiện đại, nội thất tiên tiến, thông minh cùng trái tim là động cơ áp dụng công nghệ EARTH DREAMS TECHNOLOGY đột phá tối ưu hóa khả năng tiết kiệm nhiên liệu trong khi vẫn duy trì khả năng vận hành mạnh mẽ và êm ái. Chính vì lẽ đó, Honda Accord thế hệ thứ 9 đã đạt mức doanh số tích lũy toàn cầu gần 1.7 triệu xe (tính từ thời điểm ra mắt trên thế giới năm 2012 đến hết T12/2015) cũng như chiếm vị trí hàng đầu trong phân khúc sedan hạng trung ở những thị trường lớn như Mỹ, Thái Lan hay Malaysia. Honda Accord thế hệ 9 cũng nhận được nhiều giải thưởng lớn như: Top 10 xuất sắc nhất do tạp chí Car&Driver (Mỹ) bình chọn năm 2015, An toàn 5 sao cao nhất & Top mẫu xe an toàn nhất thế giới do Cơ quan an toàn giao thông quốc gia Mỹ NHTSA & Viện nghiên cứu an toàn giao thông quốc gia Mỹ IIHS chứng nhận năm 2016…<hr>

Tháng 8/2015, Honda Việt Nam giới thiệu Honda Accord phiên bản 2015 với những nâng cấp tiện ích vượt trội trong phân khúc đã chiếm được cảm tình của ngày càng nhiều khách hàng Việt Nam. Minh chứng là doanh số bán cả năm 2015 tăng trưởng 39% so với năm 2014 và đặc biệt, cao gần gấp 3 lần so với doanh số bán trung bình của các năm trước cộng lại (2011 – 2014). Phân khúc khách hàng mà Honda Accord sở hữu khá chọn lọc, đó là những chủ nhân hướng tới phong cách sang trọng, lịch lãm riêng biệt, không lẫn với đám đông cùng sự bền bỉ và chất lượng tin cậy. Chính vì vậy, việc doanh số ngày càng tăng trưởng qua các năm đã khẳng định và củng cố thêm vị thế riêng cho Honda Accord tại Việt Nam. <hr>

Theo bước những tiến bộ vượt bậc nhằm mang lại cho khách hàng Việt Nam một mẫu sedan với đẳng cấp vượt trội và cá tính riêng biệt, vào ngày 24/5/2016, HVN đã chính thức giới thiệu Honda Accord mới 2016.
', N'Accord-gold.jfif', 600000, 700000, 10, CAST(N'2017-01-01' AS Date), CAST(N'2017-01-06' AS Date), 10, 1, 2, 4, 1, 10, 2016, 60, 8)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ContentDetail], [Image], [PriceImport], [PriceExport], [Discount], [FromDate], [ToDate], [Quantity], [Status], [CatalogID], [NumberOfSeat], [CarType], [NumberView], [YearOfManufacture], [PetrolTankCapacity], [TimeSpeed100]) VALUES (N'SP012     ', N'ODYSSEY', N'Honda Odyssey được giới thiệu lần đầu vào năm 1994 tại Nhật Bản để đáp ứng nhu cầu ngày càng tăng trong việc chuyên chở nhiều người trong gia đình vào thời điểm đó, trái ngược hẳn với khả năng của kiểu xe tải hộp truyền thống. Vì vậy, thế hệ đầu tiên của ODYSSEY bắt đầu với bản RV, và sau đó tiếp tục phát triển lên thành một mẫu xe "sedan” nhưng có khả năng chở nhiều người với khoang xe rộng rãi và sự cân bằng trên mọi khía cạnh như không gian, sức mạnh, khả năng kiểm soát, sự thoải mái khi lái… Với mục đích đó, "chiếc xe tiên phong – ODYSSEY” đã được khai sinh và ngay lập tức tạo nên một xu hướng mới về dòng xe thiết kế dành cho nhiều hành khách.<hr>
Ý tưởng phát triển của ODYSSEY luôn dựa trên sức mạnh vượt trội, cảm giác lái hứng khởi và niềm vui cầm lái đầy phấn khích. Những ý tưởng này đã được thể hiện xuyên suốt trong tất cả những dự án nghiên cứu và phát triển mẫu xe này từ thế hệ thứ 2 đến thế hệ thứ 4. Vì vậy, tất cả các thế hệ của Odyssey đều hướng đến một chiếc xe hoàn hảo và tối ưu cho nhiều hành khách. Hơn thế nữa, với việc theo đuổi ý tưởng "không gian di chuyển thoải mái”, Odyssey có thể thỏa mãn những nhu cầu thiết yếu không ngừng thay đổi của con người và cung cấp những giá trị mới chưa từng có. Đó là những đặc tính không chỉ nằm trong "gen” của Odyssey mà còn là kết quả của một quá trình cải tiến không ngừng. <hr>
Hiện tại đang ở thế hệ thứ 5, Odyssey hoàn toàn mới phô diễn khả năng cân bằng tuyệt vời giữa giá trị tiện ích và giá trị của xe du lịch, đáp ứng được nhu cầu đa dạng của cuộc sống hiện đại. Mẫu xe mang đến chất lượng cao cấp chưa từng có, sự rộng rãi và thoải mái cho hành khách ở cả 3 hàng ghế với khả năng vận hành tuyệt hảo vượt lên trên sự mong đợi của khách hàng. Xây dựng trên ý tưởng thiết kế nguyên bản, Odyssey hoàn toàn mới sử dụng khung xe và hệ thống truyền động hoàn toàn mới. <hr>
Với khả năng vận hành và tiết kiệm nhiên liệu, thiết kế ngoại thất năng động, nội thất rộng rãi, tiện ích và vận hành an toàn, Odyssey hoàn toàn mới đã xuất sắc vượt qua người tiền nhiệm. Đó chính là lý do tại sao Odyssey thế hệ thứ 5 sau khi ra mắt vào tháng 11 năm 2013 tại Nhật Bản đã nhận được sự đánh giá cao của khách hàng từ hơn 20 quốc gia với doanh số bán hàng cộng dồn đạt hơn 130.000 xe (tính tới tháng 8 năm 2015). Đặc biệt, mẫu xe này đã trở thành một trong những chiếc xe đa dụng cao cấp bán chạy nhất tại các thị trường lớn như Nhật Bản, Trung Quốc, Úc… và các nước ASEAN như Philippines, Indonesia, Singapore…

', N'ODYSSEY-white.jfif', 900000, 1000000, 10, CAST(N'2017-01-01' AS Date), CAST(N'2017-06-01' AS Date), 5, 1, 2, 4, 1, 1, 2016, 55, 8)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ContentDetail], [Image], [PriceImport], [PriceExport], [Discount], [FromDate], [ToDate], [Quantity], [Status], [CatalogID], [NumberOfSeat], [CarType], [NumberView], [YearOfManufacture], [PetrolTankCapacity], [TimeSpeed100]) VALUES (N'SP013     ', N'Grand i10', N'Grand i10 được Hyundai Thành Công giới thiệu lần đầu tiên năm 2013, đã nhanh chóng được khách hàng đón nhận và đánh giá cao. Chỉ sau 2 tuần ra mắt, Grand i10 đã đạt doanh số kỉ lục với hơn 1.000 đơn đặt hàng tại Việt Nam. Trên thế giới, Grand i10 cũng rất thành công khi giành được nhiều giải thưởng uy tín như “Xe đô thị tốt nhất” tại Anh (2 năm liên tiếp 2014 và 2015), giải thưởng “Vô lăng vàng” năm 2014 tại Ấn Độ hay “Xe nhỏ của năm” tại Philippines (năm 2014-2015). <hr>
Kế thừa những ưu điểm và thành công của Grand i10, Hyundai đã thiết kế và giới thiệu phiên bản sedan của mẫu xe này. Thiết kế trẻ trung, tính năng trang bị phù hợp cùng giá thành hợp lý đã tạo nên sức hút mạnh mẽ với Grand i10 sedan. Chỉ sau 1 tháng ra mắt, 11,000 đơn đặt hàng đã được ký tại thị trường Ấn Độ. <hr>
Nhằm mang đến thêm sự lựa chọn cho khách hàng doanh nghiệp và những khách hàng cá nhân, gia đình trẻ di chuyển thường xuyên trong đô thị, Hyundai Thành Công chính thức giới đưa vào thêm 2 phiên bản Grand i10 sedan nữa bên cạnh phiên bản tiêu chuẩn đã được giới thiệu từ tháng 1 với giá bán 399,000,000 VNĐ. <hr>
Về tổng thể, Grand i10 sedan có thiết kế không thay đổi nhiều so với hatchback. Áp dụng triết lý thiết kế “Điêu khắc dòng chảy”, Grand i10 sedan có vẻ ngoài hiện đại và thể thao. Lưới tản nhiệt hình lục giác đặc trưng cùng các đường gân dập nổi dọc thân xe mang đến cho Grand i10 sedan sự trẻ trung và cá tính. Kích thước tổng thể hầu như được giữ nguyên, tuy nhiên, chiều dài của phiên bản sedan được kéo dài hơn 230mm so với phiên bản hatchback, mang lại không gian rộng rãi hàng đầu trong phân khúc. <hr>
Triết lý thiết kế “Điêu khắc dòng chảy” tiếp tục được áp dụng bên trong Grand i10 sedan với không gian nội thất rộng rãi và thoáng đãng cho 5 vị trí ngồi. Với việc kéo dài chiều dài xe, chỗ ngồi dành cho người lái và hành khách phía sau được mở rộng đáng kể. Đặc biệt khoang hành lý phía sau được thiết kế lên đến 407 lít (tăng thêm 151 lít so với các phiên bản trước của Grand i10) tạo ra không gian chứa đồ thoải mái hơn cho những chuyến đi xa. <hr>
Là mẫu xe nhỏ và tiết kiệm nhưng Grand i10 sedan trang bị các tính năng cao cấp: Nội thất da cao cấp, hệ thống chìa khóa thông minh, khởi động nút bấm, trợ lực lái điện,vô-lăng bọc da gật gù, gương chiếu hậu chỉnh điện, cửa sổ chỉnh điện, hệ thống âm thanh CD-USB-Bluetooth cùng 4 loa... <hr>
Xe được trang bị hệ thống túi khí đôi, hệ thống chống bó cứng phanh ABS, gương chiếu hậu chống chói tích hợp camera lùi. <hr>
Grand i10 sedan được trang bị động cơ Kappa 1.2 lít Dual CVVT cho công suất cực đại 87 mã lực tại 6.000 vòng/phút, mô-men xoắn 120 Nm tại 4.000 vòng/phút. Động cơ Kappa thế hệ mới mang đến khả năng vận hành êm ái và tiết kiệm nhiên liệu vượt trội so với các đối thủ cùng phân khúc. Xe có 2 lựa chọn hộp số sàn 5 cấp hoặc hộp số tự động 4 cấp với những cải tiến nhằm tăng độ mượt mà, êm ái cũng như độ bền. <hr>
Grand i10 sedan cải tiến thêm về hệ thống treo trước và sau nhằm mang lại sự êm ái hơn nữa cho tất cả các vị trí ngồi. Bên cạnh đó vô lăng trợ lực điện mang lại sự nhẹ nhàng, linh hoạt khi di chuyển trong phố.

', N'Grand-i10-black.jfif', 150000, 250000, 1, CAST(N'2017-01-01' AS Date), CAST(N'2017-03-01' AS Date), 5, 1, 3, 4, 1, 1, 2016, 60, 8)
INSERT [dbo].[PRODUCT] ([ProductID], [ProductName], [ContentDetail], [Image], [PriceImport], [PriceExport], [Discount], [FromDate], [ToDate], [Quantity], [Status], [CatalogID], [NumberOfSeat], [CarType], [NumberView], [YearOfManufacture], [PetrolTankCapacity], [TimeSpeed100]) VALUES (N'SP014     ', N'Elantra', N'Hyundai Thành Công rất đặc biệt khi họ là hãng xe duy nhất tại Việt Nam đã và đang phân phối cùng lúc hai mẫu sedan hạng C – Avante và Elantra. Tìm hiểu sâu xa hơn, Avante thực chất là tên gọi của thế hệ Elantra tiền nhiệm được Hyundai lắp ráp trong nước, trong những năm qua bán song song cùng mẫu Elantra nhập khẩu với tầm giá chỉ ở phân khúc B, mục đích phần nào là tận dụng nguồn lực sẵn có đồng thời hỗ trợ đàn em Accent cạnh tranh với các đối thủ Nhật Bản khác. <hr>
Và nếu Avante phần nào có được đôi chút vị thế riêng trên thị trường thì Elantra 2015 gần như lọt thỏm trước sự bùng nổ của Mazda 3 2015 hay bị chính người họ hàng thân thuộc Kia K3 bỏ lại khá xa, đó là chưa kể đến các đối thủ đình đám như Toyota Altis, Ford Focus và Honda Civic. <hr>
Sau một thời gian dài án binh bất động thì vào đầu tháng 7/2016 vừa qua, Hyundai Thành Công đã chính thức trình làng thế hệ Elantra 2016 hoàn toàn mới. Gần như ngay lập tức ba phiên bản Elantra sản xuất theo dạng CKD tạo được sức hút mạnh mẽ với người tiêu dùng nhờ kiểu dáng bắt mắt, một loạt các nâng cấp về trang bị và nhất là giá bán cạnh tranh. Số tiền cụ thể dành cho Hyundai Elantra 2016 như sau: <hr>
Chắc chắn rằng sự xuất hiện của tân binh Hàn Quốc sẽ khiến cho chặn đua giữa những chiếc sedan cỡ vừa thêm phần gay cấn và khốc liệt. Mazda 3 vẫn giữ vững phong độ dẫn đầu dùng vấp phải nhiều “tiếng la ó từ khan đài”, Kia đưa Cerato 2016 thay thế cho K3 sau ba năm chinh chiến, Toyota và Ford tiếp tục tung ra một loạt chiến thuật để thúc đầy doanh số cho Altis và Focus, trong khi đó Civic 2016 với chất “xe đua đường phố” gần như chắc chắn sẽ gia nhập cuộc chơi vào quý IV – 2016. Liệu Elantra có đủ sức thách thức từng ấy đối thủ và giúp Hyundai gia tăng con số của mình trong chiếc bánh thị phần? <hr>
Mẫu xe mà nhóm danhgiaXe trải nghiệm là chiếc Elantra 2.0 AT với đầy đủ các tính năng tốt nhất từ nhà sản xuất. Trong bài viết, chúng tôi sẽ lồng ghép thông tin về các phiên bản khác để bạn đọc có thể hình dung chi tiết nhất về dòng xe này.

', N'Elantra-gold.jfif', 300000, 350000, 1, CAST(N'2017-01-01' AS Date), CAST(N'2017-04-01' AS Date), 5, 1, 3, 4, 0, 1, 2016, 60, 8)
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([UserID], [UserName], [Password], [Phone], [Email], [Address], [Gender], [Birthday], [UserType], [GroupID]) VALUES (1, N'Hosyhau', N'123456', N'0989760107', N'hosyhau97haui@gmail.com', N'ha noi', 1, CAST(N'1997-10-09' AS Date), N'Nhân Viên', 1)
INSERT [dbo].[USER] ([UserID], [UserName], [Password], [Phone], [Email], [Address], [Gender], [Birthday], [UserType], [GroupID]) VALUES (2, N'stephen', N'123456', N'01656829992', N'hosyhau97itguy@gmail.com', N'ha noi', 0, CAST(N'1997-10-09' AS Date), N'Quản Lý', 2)
INSERT [dbo].[USER] ([UserID], [UserName], [Password], [Phone], [Email], [Address], [Gender], [Birthday], [UserType], [GroupID]) VALUES (3, N'admin', N'123456', N'0999999999', N'admin@gmail.com', N'111', 1, CAST(N'1997-10-09' AS Date), N'Quản trị', 3)
INSERT [dbo].[USER] ([UserID], [UserName], [Password], [Phone], [Email], [Address], [Gender], [Birthday], [UserType], [GroupID]) VALUES (9, N'neo', N'123456', N'0976410493', N'stephen@gmail.com', N'vinh phuc', 1, CAST(N'1997-10-09' AS Date), N'Nhân Viên', 1)
INSERT [dbo].[USER] ([UserID], [UserName], [Password], [Phone], [Email], [Address], [Gender], [Birthday], [UserType], [GroupID]) VALUES (13, N'neojob', N'123456', N'099999934', N'neo@gmail.com', N'Ha tinh', 1, CAST(N'1997-10-09' AS Date), N'Khach', 4)
SET IDENTITY_INSERT [dbo].[USER] OFF
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_PRODUCT] FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK_COMMENT_PRODUCT]
GO
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_COMMENT_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK_COMMENT_USER]
GO
ALTER TABLE [dbo].[FAVORITE]  WITH CHECK ADD  CONSTRAINT [FK_FAVORITE_PRODUCT] FOREIGN KEY([ProcductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
GO
ALTER TABLE [dbo].[FAVORITE] CHECK CONSTRAINT [FK_FAVORITE_PRODUCT]
GO
ALTER TABLE [dbo].[FAVORITE]  WITH CHECK ADD  CONSTRAINT [FK_FAVORITE_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[FAVORITE] CHECK CONSTRAINT [FK_FAVORITE_USER]
GO
ALTER TABLE [dbo].[GROUP_FUNCTION]  WITH CHECK ADD  CONSTRAINT [FK_GROUP_FUNCTION_FUNCTION] FOREIGN KEY([FunctionID])
REFERENCES [dbo].[FUNCTION] ([FunctionID])
GO
ALTER TABLE [dbo].[GROUP_FUNCTION] CHECK CONSTRAINT [FK_GROUP_FUNCTION_FUNCTION]
GO
ALTER TABLE [dbo].[GROUP_FUNCTION]  WITH CHECK ADD  CONSTRAINT [FK_GROUP_FUNCTION_GROUP] FOREIGN KEY([GroupID])
REFERENCES [dbo].[GROUP] ([GroupID])
GO
ALTER TABLE [dbo].[GROUP_FUNCTION] CHECK CONSTRAINT [FK_GROUP_FUNCTION_GROUP]
GO
ALTER TABLE [dbo].[IMAGELINK]  WITH CHECK ADD  CONSTRAINT [FK_IMAGELINK_PRODUCT] FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
GO
ALTER TABLE [dbo].[IMAGELINK] CHECK CONSTRAINT [FK_IMAGELINK_PRODUCT]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_USER]
GO
ALTER TABLE [dbo].[ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAIL_ORDER] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ORDER] ([OrderID])
GO
ALTER TABLE [dbo].[ORDER_DETAIL] CHECK CONSTRAINT [FK_ORDER_DETAIL_ORDER]
GO
ALTER TABLE [dbo].[ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAIL_PRODUCT] FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
GO
ALTER TABLE [dbo].[ORDER_DETAIL] CHECK CONSTRAINT [FK_ORDER_DETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD  CONSTRAINT [FK_PAYMENT_ORDER] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ORDER] ([OrderID])
GO
ALTER TABLE [dbo].[PAYMENT] CHECK CONSTRAINT [FK_PAYMENT_ORDER]
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD  CONSTRAINT [FK_PAYMENT_PAYMENTTYPE] FOREIGN KEY([PaymentTypeID])
REFERENCES [dbo].[PAYMENTTYPE] ([PaymentTypeID])
GO
ALTER TABLE [dbo].[PAYMENT] CHECK CONSTRAINT [FK_PAYMENT_PAYMENTTYPE]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_CATALOG] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[CATALOG] ([CatalogID])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_CATALOG]
GO
ALTER TABLE [dbo].[PRODUCT_COLOR]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_COLOR_COLOR] FOREIGN KEY([ColorID])
REFERENCES [dbo].[COLOR] ([ColorID])
GO
ALTER TABLE [dbo].[PRODUCT_COLOR] CHECK CONSTRAINT [FK_PRODUCT_COLOR_COLOR]
GO
ALTER TABLE [dbo].[PRODUCT_COLOR]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_COLOR_PRODUCT] FOREIGN KEY([ProductID])
REFERENCES [dbo].[PRODUCT] ([ProductID])
GO
ALTER TABLE [dbo].[PRODUCT_COLOR] CHECK CONSTRAINT [FK_PRODUCT_COLOR_PRODUCT]
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD  CONSTRAINT [FK_USER_GROUP] FOREIGN KEY([GroupID])
REFERENCES [dbo].[GROUP] ([GroupID])
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [FK_USER_GROUP]
GO
USE [master]
GO
ALTER DATABASE [Nhom6_QLOT] SET  READ_WRITE 
GO
