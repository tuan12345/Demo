<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
                <!-- /input-group -->
            </li>
            <li>
            <li>
                <a href="#"><i class="fa fa-dashboard fa-fw"></i> Quản Lý Danh Mục</a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="getAllImageLink.htm">Quản Lý Link Ảnh</a>
                    </li>
                    <li>
                        <a href="getAllCatalog.htm">Quản Lý Thương Hiệu</a>
                        <!--<span class="fa arrow"></span>-->
                    </li>
                    <li>
                        <a href="getAllColor.htm">Quản Lý Màu Sắc </a>
                    </li>
                    <li>
                        <a href="getAllPaymentType.htm">Quản Lý PaymentType </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="getAllProduct.htm"><i class="fa fa-bar-chart-o fa-fw"></i> Quản Lý Sản Phẩm</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-table fa-fw"></i> Quản Lý Hóa Đơn</a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="getAllOrder.htm">Quản Lý Đơn Hàng</a>
                    </li>
<!--                    <li>
                        <a href="#">Quản Lý Payment</a>
                    </li>-->
<!--                    <li>
                        <a href="#">Quản Lý Doanh Thu</a>
                    </li>-->
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-edit fa-fw"></i> Quản Lý Tài Khoản</a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="getAllUser.htm">Quản Lý Người Dùng</a>
                    </li>
                    <li>
                        <a href="getAllComment.htm">Quản Lý Comment</a>
                    </li>
                    <li>
                        <a href="getAllGroup.htm">Quản Lý Group</a>
                    </li>
                    <li>
                        <a href="getAllFunction.htm">Quản Lý Chức Năng</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>