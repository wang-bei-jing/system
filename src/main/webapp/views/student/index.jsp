<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Sales Admin | CORK - Multipurpose Bootstrap Dashboard Template </title>

    <link href="${pageContext.request.contextPath}/static/corkstatic/assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/corkstatic/assets/js/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/corkstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/corkstatic/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link href="${pageContext.request.contextPath}/static/corkstatic/plugins/apex/apexcharts.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/corkstatic/assets/css/dashboard/dash_1.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
</head>
<body>
<!-- BEGIN LOADER -->
<div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
<!--  END LOADER -->

<!--  BEGIN NAVBAR  -->
<div class="header-container fixed-top">
    <header class="header navbar navbar-expand-sm">

        <ul class="navbar-item theme-brand flex-row  text-center">
            <li class="nav-item theme-logo">
                <a href="index.html">
                    <img src="${pageContext.request.contextPath}/static/corkstatic/assets/img/logo.svg" class="navbar-logo" alt="logo">
                </a>
            </li>
            <li class="nav-item theme-text">
                <a href="index.html" class="nav-link"> 数据库软件综合实训管理系统 </a>
            </li>
        </ul>

        <ul class="navbar-item flex-row ml-md-0 ml-auto">
            <li class="nav-item align-self-center search-animated">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search toggle-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <form class="form-inline search-full form-inline search" role="search">
                    <div class="search-bar">
                        <input type="text" class="form-control search-form-control  ml-lg-auto" placeholder="Search...">
                    </div>
                </form>
            </li>
        </ul>

       <%-- <ul class="navbar-item flex-row ml-md-auto">

            <li class="nav-item dropdown language-dropdown">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle" id="language-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/corkstatic/assets/img/ca.png" class="flag-width" alt="flag">
                </a>
                <div class="dropdown-menu position-absolute" aria-labelledby="language-dropdown">
                    <a class="dropdown-item d-flex" href="javascript:void(0);"><img src="${pageContext.request.contextPath}/corkstatic/assets/img/de.png" class="flag-width" alt="flag"> <span class="align-self-center">&nbsp;German</span></a>
                    <a class="dropdown-item d-flex" href="javascript:void(0);"><img src="${pageContext.request.contextPath}/corkstatic/assets/img/jp.png" class="flag-width" alt="flag"> <span class="align-self-center">&nbsp;Japanese</span></a>
                    <a class="dropdown-item d-flex" href="javascript:void(0);"><img src="${pageContext.request.contextPath}/corkstatic/assets/img/fr.png" class="flag-width" alt="flag"> <span class="align-self-center">&nbsp;French</span></a>
                    <a class="dropdown-item d-flex" href="javascript:void(0);"><img src="${pageContext.request.contextPath}/corkstatic/assets/img/ca.png" class="flag-width" alt="flag"> <span class="align-self-center">&nbsp;English</span></a>
                </div>
            </li>

            <li class="nav-item dropdown message-dropdown">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle" id="messageDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                </a>
                <div class="dropdown-menu p-0 position-absolute" aria-labelledby="messageDropdown">
                    <div class="">
                        <a class="dropdown-item">
                            <div class="">

                                <div class="media">
                                    <div class="user-img">
                                        <img class="usr-img rounded-circle" src="${pageContext.request.contextPath}/corkstatic/assets/img/profile-11.jpeg.jpg" alt="profile">
                                    </div>
                                    <div class="media-body">
                                        <div class="">
                                            <h5 class="usr-name">Kara Young</h5>
                                            <p class="msg-title">ACCOUNT UPDATE</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </a>
                        <a class="dropdown-item">
                            <div class="">

                                <div class="media">
                                    <div class="user-img">
                                        <img class="usr-img rounded-circle" src="${pageContext.request.contextPath}/corkstatic/assets/img/profile-16.jpeg.jpg" alt="profile">
                                    </div>
                                    <div class="media-body">
                                        <div class="">
                                            <h5 class="usr-name">Daisy Anderson</h5>
                                            <p class="msg-title">ACCOUNT UPDATE</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </a>
                        <a class="dropdown-item">
                            <div class="">

                                <div class="media">
                                    <div class="user-img">
                                        <img class="usr-img rounded-circle" src="${pageContext.request.contextPath}/corkstatic/assets/img/profile-34.jpeg.jpg" alt="profile">
                                    </div>
                                    <div class="media-body">
                                        <div class="">
                                            <h5 class="usr-name">Oscar Garner</h5>
                                            <p class="msg-title">ACCOUNT UPDATE</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </a>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown notification-dropdown">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle" id="notificationDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg><span class="badge badge-success"></span>
                </a>
                <div class="dropdown-menu position-absolute" aria-labelledby="notificationDropdown">
                    <div class="notification-scroll">

                        <div class="dropdown-item">
                            <div class="media">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                                <div class="media-body">
                                    <div class="notification-para"><span class="user-name">Shaun Park</span> likes your photo.</div>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown-item">
                            <div class="media">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-share-2"><circle cx="18" cy="5" r="3"></circle><circle cx="6" cy="12" r="3"></circle><circle cx="18" cy="19" r="3"></circle><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line></svg>
                                <div class="media-body">
                                    <div class="notification-para"><span class="user-name">Kelly Young</span> shared your post</div>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown-item">
                            <div class="media">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-tag"><path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"></path><line x1="7" y1="7" x2="7" y2="7"></line></svg>
                                <div class="media-body">
                                    <div class="notification-para"><span class="user-name">Kelly Young</span> mentioned you in comment.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown user-profile-dropdown">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    <img src="${pageContext.request.contextPath}/corkstatic/assets/img/profile-16.jpeg.jpg" alt="avatar">
                </a>
                <div class="dropdown-menu position-absolute" aria-labelledby="userProfileDropdown">
                    <div class="">
                        <div class="dropdown-item">
                            <a class="" href="user_profile.html"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg> My Profile</a>
                        </div>
                        <div class="dropdown-item">
                            <a class="" href="apps_mailbox.html"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-inbox"><polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline><path d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path></svg> Inbox</a>
                        </div>
                        <div class="dropdown-item">
                            <a class="" href="auth_lockscreen.html"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg> Lock Screen</a>
                        </div>
                        <div class="dropdown-item">
                            <a class="" href="auth_login.html"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg> Sign Out</a>
                        </div>
                    </div>
                </div>
            </li>

        </ul>--%>
    </header>
</div>
<!--  END NAVBAR  -->

<!--  BEGIN NAVBAR  -->
<div class="sub-header-container">
    <header class="header navbar navbar-expand-sm">
        <a href="javascript:void(0);" class="sidebarCollapse" data-placement="bottom"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg></a>

        <ul class="navbar-nav flex-row">
            <li>
                <div class="page-header">

                    <nav class="breadcrumb-one" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">学生端</a></li>
                            <li class="breadcrumb-item active" aria-current="page"><span>施昊晨</span></li>
                        </ol>
                    </nav>

                </div>
            </li>
        </ul>
        <%--<ul class="navbar-nav flex-row ml-auto ">
            <li class="nav-item more-dropdown">
                <div class="dropdown  custom-dropdown-icon">
                    <a class="dropdown-toggle btn" href="#" role="button" id="customDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span>Settings</span> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></a>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="customDropdown">
                        <a class="dropdown-item" data-value="Settings" href="javascript:void(0);">Settings</a>
                        <a class="dropdown-item" data-value="Mail" href="javascript:void(0);">Mail</a>
                        <a class="dropdown-item" data-value="Print" href="javascript:void(0);">Print</a>
                        <a class="dropdown-item" data-value="Download" href="javascript:void(0);">Download</a>
                        <a class="dropdown-item" data-value="Share" href="javascript:void(0);">Share</a>
                    </div>
                </div>
            </li>
        </ul>--%>
    </header>
</div>
<!--  END NAVBAR  -->

<!--  BEGIN MAIN CONTAINER  -->
<div class="main-container" id="container">

    <div class="overlay"></div>
    <div class="search-overlay"></div>

    <!--  BEGIN SIDEBAR  -->
    <div class="sidebar-wrapper sidebar-theme">

        <nav id="sidebar">
            <div class="shadow-bottom"></div>
            <ul class="list-unstyled menu-categories" id="accordionExample">



                <li class="menu">
                    <a href="#components" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-box"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
                            <span>课题管理</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled" id="components" data-parent="#accordionExample">
                        <li>
                            <a href="${pageContext.request.contextPath}/TopicSelectAll?sSno=${student.sno}" target="myfrm"> 全部课题 </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/myTopic?sSno=${student.sno}" target="myfrm"> 我的申报课题  </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/myTopicSelect?sSno=${student.sno}" target="myfrm"> 我的实训题目 </a>
                        </li>

                    </ul>
                </li>

                <li class="menu">
                    <a href="#elements" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-zap"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                            <span>文件管理</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled" id="elements" data-parent="#accordionExample">
                        <li>
                            <a href="element_alerts.html"> 周报 </a>
                        </li>
                        <li>
                            <a href="element_avatar.html"> 实训文件 </a>
                        </li>
                    </ul>
                </li>

                <li class="menu">
                    <a href="${pageContext.request.contextPath}/views/student/studentpersonal.jsp" target="myfrm" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-target"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="6"></circle><circle cx="12" cy="12" r="2"></circle></svg>
                            <span>个人信息</span>
                        </div>
                    </a>
                </li>

                <li class="menu">
                    <a href="widgets.html" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-airplay"><path d="M5 17H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-1"></path><polygon points="12 15 17 21 7 21 12 15"></polygon></svg>
                            <span>Widgets</span>
                        </div>
                    </a>
                </li>

                <li class="menu">
                    <a href="table_basic.html" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="3" y1="9" x2="21" y2="9"></line><line x1="9" y1="21" x2="9" y2="9"></line></svg>
                            <span>Tables</span>
                        </div>
                    </a>
                </li>

                <li class="menu">
                    <a href="#datatables" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
                            <span>DataTables</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled" id="datatables" data-parent="#accordionExample">
                        <li>
                            <a href="table_dt_basic.html"> Basic </a>
                        </li>
                        <li>
                            <a href="table_dt_basic-dark.html"> Dark </a>
                        </li>
                        <li>
                            <a href="table_dt_ordering_sorting.html"> Order Sorting </a>
                        </li>
                        <li>
                            <a href="table_dt_multi-column_ordering.html"> Multi-Column </a>
                        </li>
                        <li>
                            <a href="table_dt_multiple_tables.html"> Multiple Tables</a>
                        </li>
                        <li>
                            <a href="table_dt_alternative_pagination.html"> Alt. Pagination</a>
                        </li>
                        <li>
                            <a href="table_dt_custom.html"> Custom </a>
                        </li>
                        <li>
                            <a href="table_dt_range_search.html"> Range Search </a>
                        </li>
                        <li>
                            <a href="table_dt_html5.html"> HTML5 Export </a>
                        </li>
                        <li>
                            <a href="table_dt_live_dom_ordering.html"> Live DOM ordering </a>
                        </li>
                        <li>
                            <a href="table_dt_miscellaneous.html"> Miscellaneous </a>
                        </li>
                    </ul>
                </li>

                <li class="menu">
                    <a href="#forms" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clipboard"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
                            <span>Forms</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled" id="forms" data-parent="#accordionExample">
                        <li>
                            <a href="form_bootstrap_basic.html"> Basic </a>
                        </li>
                        <li>
                            <a href="form_input_group_basic.html"> Input Group </a>
                        </li>
                        <li>
                            <a href="form_layouts.html"> Layouts </a>
                        </li>
                        <li>
                            <a href="form_validation.html"> Validation </a>
                        </li>
                        <li>
                            <a href="form_input_mask.html"> Input Mask </a>
                        </li>
                        <li>
                            <a href="form_bootstrap_select.html"> Bootstrap Select </a>
                        </li>
                        <li>
                            <a href="form_select2.html"> Select2 </a>
                        </li>
                        <li>
                            <a href="form_bootstrap_touchspin.html"> TouchSpin </a>
                        </li>
                        <li>
                            <a href="form_maxlength.html"> Maxlength </a>
                        </li>
                        <li>
                            <a href="form_checkbox_radio.html"> Checkbox &amp; Radio </a>
                        </li>
                        <li>
                            <a href="form_switches.html"> Switches </a>
                        </li>
                        <li>
                            <a href="form_wizard.html"> Wizards </a>
                        </li>
                        <li>
                            <a href="form_fileupload.html"> File Upload </a>
                        </li>
                        <li>
                            <a href="form_quill.html"> Quill Editor </a>
                        </li>
                        <li>
                            <a href="form_markdown.html"> Markdown Editor </a>
                        </li>
                        <li>
                            <a href="form_date_range_picker.html"> Date &amp; Range Picker </a>
                        </li>
                        <li>
                            <a href="form_clipboard.html"> Clipboard </a>
                        </li>
                        <li>
                            <a href="form_typeahead.html"> Typeahead </a>
                        </li>
                    </ul>
                </li>

                <li class="menu">
                    <a href="#users" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            <span>Users</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled" id="users" data-parent="#accordionExample">
                        <li>
                            <a href="user_profile.html"> Profile </a>
                        </li>
                        <li>
                            <a href="user_account_setting.html"> Account Settings </a>
                        </li>
                    </ul>
                </li>

                <li class="menu">
                    <a href="#pages" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
                            <span>Pages</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled" id="pages" data-parent="#accordionExample">
                        <li>
                            <a href="pages_helpdesk.html"> Helpdesk </a>
                        </li>
                        <li>
                            <a href="pages_contact_us.html"> Contact Form </a>
                        </li>
                        <li>
                            <a href="pages_faq.html"> FAQ </a>
                        </li>
                        <li>
                            <a href="pages_faq2.html"> FAQ 2 </a>
                        </li>
                        <li>
                            <a href="pages_privacy.html"> Privacy Policy </a>
                        </li>
                        <li>
                            <a href="pages_coming_soon.html"> Coming Soon </a>
                        </li>
                        <li>
                            <a href="#pages-error" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> Error <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg> </a>
                            <ul class="collapse list-unstyled sub-submenu" id="pages-error" data-parent="#pages">
                                <li>
                                    <a href="pages_error404.html"> 404 </a>
                                </li>
                                <li>
                                    <a href="pages_error500.html"> 500 </a>
                                </li>
                                <li>
                                    <a href="pages_error503.html"> 503 </a>
                                </li>
                                <li>
                                    <a href="pages_maintenence.html"> Maintanence </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

                <li class="menu">
                    <a href="#authentication" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                            <span>Authentication</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled" id="authentication" data-parent="#accordionExample">
                        <li>
                            <a href="auth_login_boxed.html"> Login Boxed </a>
                        </li>
                        <li>
                            <a href="auth_register_boxed.html"> Register Boxed </a>
                        </li>
                        <li>
                            <a href="auth_lockscreen_boxed.html"> Unlock Boxed </a>
                        </li>
                        <li>
                            <a href="auth_pass_recovery_boxed.html"> Recover ID Boxed </a>
                        </li>
                        <li>
                            <a href="auth_login.html"> Login Cover </a>
                        </li>
                        <li>
                            <a href="auth_register.html"> Register Cover </a>
                        </li>
                        <li>
                            <a href="auth_lockscreen.html"> Unlock Cover </a>
                        </li>
                        <li>
                            <a href="auth_pass_recovery.html"> Recover ID Cover </a>
                        </li>
                    </ul>
                </li>

                <li class="menu">
                    <a href="dragndrop_dragula.html" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-move"><polyline points="5 9 2 12 5 15"></polyline><polyline points="9 5 12 2 15 5"></polyline><polyline points="15 19 12 22 9 19"></polyline><polyline points="19 9 22 12 19 15"></polyline><line x1="2" y1="12" x2="22" y2="12"></line><line x1="12" y1="2" x2="12" y2="22"></line></svg>
                            <span>Drag and Drop</span>
                        </div>
                    </a>
                </li>

                <li class="menu">
                    <a href="map_jvector.html" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map"><polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"></polygon><line x1="8" y1="2" x2="8" y2="18"></line><line x1="16" y1="6" x2="16" y2="22"></line></svg>
                            <span>Maps</span>
                        </div>
                    </a>
                </li>

                <li class="menu">
                    <a href="charts_apex.html" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path><path d="M22 12A10 10 0 0 0 12 2v10z"></path></svg>
                            <span>Charts</span>
                        </div>
                    </a>
                </li>

                <li class="menu">
                    <a href="#starter-kit" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-terminal"><polyline points="4 17 10 11 4 5"></polyline><line x1="12" y1="19" x2="20" y2="19"></line></svg>
                            <span>Starter Kit</span>
                        </div>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                    </a>
                    <ul class="collapse submenu list-unstyled" id="starter-kit" data-parent="#accordionExample">
                        <li>
                            <a href="starter_kit_blank_page.html"> Blank Page </a>
                        </li>
                        <li>
                            <a href="starter_kit_breadcrumbs.html"> Breadcrumbs </a>
                        </li>
                        <li>
                            <a href="starter_kit_boxed.html"> Boxed </a>
                        </li>
                        <li>
                            <a href="starter_kit_alt_menu.html"> Alternate Menu </a>
                        </li>
                    </ul>
                </li>

                <li class="menu">
                    <a href="" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                            <span>Documentation</span>
                        </div>
                    </a>
                </li>

            </ul>
            <!-- <div class="shadow-bottom"></div> -->

        </nav>

    </div>
    <!--  END SIDEBAR  -->

    <!--  ————————————————————————————右侧显示区——————————————————————————  -->
    <div id="content" class="main-content">
       <%-- <div class="layout-px-spacing">--%>
            <iframe src="${pageContext.request.contextPath}/myTopic?sSno=${student.sno}" id="myfrm"name="myfrm"  width="100%" height="100%" frameborder=0>


            </iframe>

      <%--  </div>--%>
    </div>
    <!--  END CONTENT AREA  -->

</div>
<!-- END MAIN CONTAINER -->



<!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/corkstatic/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/corkstatic/bootstrap/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/corkstatic/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/corkstatic/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/corkstatic/assets/js/app.js"></script>
<script>
    $(document).ready(function() {
        App.init();
    });
</script>
<script src="${pageContext.request.contextPath}/static/corkstatic/assets/js/custom.js"></script>
<!-- END GLOBAL MANDATORY SCRIPTS -->

<!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/corkstatic/plugins/apex/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/static/corkstatic/assets/js/dashboard/dash_1.js"></script>
<!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->

</body>
</html>
