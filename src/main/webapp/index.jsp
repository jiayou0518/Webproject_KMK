<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Vizew - Blog &amp; Magazine HTML Template</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Top Header Area -->
        <div class="top-header-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12 col-md-6">
                        <!-- Breaking News Widget -->
                        <div class="breaking-news-area d-flex align-items-center">
                            <div class="news-title">
                                <p>Breaking News:</p>
                            </div>
                            <div id="breakingNewsTicker" class="ticker">
                                <ul>
                                    <li><a href="single-post.jsp">10 Things Amazon Echo Can Do</a></li>
                                    <li><a href="single-post.jsp">Welcome to Colorlib Family.</a></li>
                                    <li><a href="single-post.jsp">Boys 'doing well' after Thai</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="top-meta-data d-flex align-items-center justify-content-end">
                            <!-- Top Social Info -->
                            <div class="top-social-info">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
                            <!-- Top Search Area -->
                            <div class="top-search-area">
                                <form action="index.jsp" method="post">
                                    <input type="search" name="top-search" id="topSearch" placeholder="Search...">
                                    <button type="submit" class="btn"><i class="fa fa-search" aria-hidden="true"></i></button>
                                </form>
                            </div>
                            <!-- Login -->
                            <%
							if(session.getAttribute("UserId")==null){
							%>
                            <a href="./login.do" class="login-btn"><i class="fa fa-user" aria-hidden="true"></i></a>
                            <%
                            } else{
                            %>
                            <a href="mypage.jsp" class="login-btn"><i class="fa fa-user" aria-hidden="true"></i></a>
                            <%
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navbar Area -->
        <div class="vizew-main-menu" id="sticker">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">

                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="vizewNav">

                        <!-- Nav brand -->
                        <a href="index.jsp" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li class="active"><a href="index.jsp">Home</a></li>
                                    <li><a href="./fblist.do">FreeBoard</a></li>
                                    <li><a href="./qalist.do">Q&A</a></li>
                                    <li><a href="contact.jsp">DataBoard</a></li>
                                    <li><a href="#">Account</a>
                                        <ul class="dropdown">
											<c:choose>
											<c:when test="${ empty UserId }">
                                            <li><a href="./login.do">- Login</a></li>
                                            <li><a href="./join.do">- Join</a></li>
											</c:when>
                                            <c:otherwise>
                                            <li><a href="./logout.do">- Logout</a></li>
                                            </c:otherwise>
											</c:choose>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <section class="hero--area section-padding-80">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-12 col-md-7 col-lg-8">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="post-1" role="tabpanel" aria-labelledby="post-1-tab">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/7.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="post-2" role="tabpanel" aria-labelledby="post-2-tab">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/8.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="post-3" role="tabpanel" aria-labelledby="post-3-tab">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/9.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="post-4" role="tabpanel" aria-labelledby="post-4-tab">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/10.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="post-5" role="tabpanel" aria-labelledby="post-5-tab">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/7.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="post-6" role="tabpanel" aria-labelledby="post-6-tab">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/10.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="post-7" role="tabpanel" aria-labelledby="post-7-tab">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/7.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-5 col-lg-4">
                    <ul class="nav vizew-nav-tab" role="tablist">

                        <li class="nav-item">
                            <a class="nav-link active" id="post-1-tab" data-toggle="pill" href="#post-1" role="tab" aria-controls="post-1" aria-selected="true">
                                <!-- Single Blog Post -->
                                <div class="single-blog-post style-2 d-flex align-items-center">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/3.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <h6 class="post-title">Boys 'doing well' after Thai cave rescue</h6>
                                        <div class="post-meta d-flex justify-content-between">
                                            <span><i class="fa fa-comments-o" aria-hidden="true"></i> 25</span>
                                            <span><i class="fa fa-eye" aria-hidden="true"></i> 11</span>
                                            <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 19</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="post-2-tab" data-toggle="pill" href="#post-2" role="tab" aria-controls="post-2" aria-selected="false">
                                <!-- Single Blog Post -->
                                <div class="single-blog-post style-2 d-flex align-items-center">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/4.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <h6 class="post-title">Meet the 12 boys rescued from cave</h6>
                                        <div class="post-meta d-flex justify-content-between">
                                            <span><i class="fa fa-comments-o" aria-hidden="true"></i> 14</span>
                                            <span><i class="fa fa-eye" aria-hidden="true"></i> 34</span>
                                            <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="post-3-tab" data-toggle="pill" href="#post-3" role="tab" aria-controls="post-3" aria-selected="false">
                                <!-- Single Blog Post -->
                                <div class="single-blog-post style-2 d-flex align-items-center">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/5.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <h6 class="post-title">Pogba dedicates France win to Thai cave boys</h6>
                                        <div class="post-meta d-flex justify-content-between">
                                            <span><i class="fa fa-comments-o" aria-hidden="true"></i> 14</span>
                                            <span><i class="fa fa-eye" aria-hidden="true"></i> 34</span>
                                            <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="post-4-tab" data-toggle="pill" href="#post-4" role="tab" aria-controls="post-4" aria-selected="false">
                                <!-- Single Blog Post -->
                                <div class="single-blog-post style-2 d-flex align-items-center">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/6.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <h6 class="post-title">How the world reacted to PM's Brexit crisis</h6>
                                        <div class="post-meta d-flex justify-content-between">
                                            <span><i class="fa fa-comments-o" aria-hidden="true"></i> 24</span>
                                            <span><i class="fa fa-eye" aria-hidden="true"></i> 98</span>
                                            <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 63</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="post-5-tab" data-toggle="pill" href="#post-5" role="tab" aria-controls="post-5" aria-selected="false">
                                <!-- Single Blog Post -->
                                <div class="single-blog-post style-2 d-flex align-items-center">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/4.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <h6 class="post-title">Meet the 12 boys rescued from cave</h6>
                                        <div class="post-meta d-flex justify-content-between">
                                            <span><i class="fa fa-comments-o" aria-hidden="true"></i> 14</span>
                                            <span><i class="fa fa-eye" aria-hidden="true"></i> 34</span>
                                            <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="post-6-tab" data-toggle="pill" href="#post-6" role="tab" aria-controls="post-6" aria-selected="false">
                                <!-- Single Blog Post -->
                                <div class="single-blog-post style-2 d-flex align-items-center">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/6.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <h6 class="post-title">How the world reacted to PM's Brexit crisis</h6>
                                        <div class="post-meta d-flex justify-content-between">
                                            <span><i class="fa fa-comments-o" aria-hidden="true"></i> 24</span>
                                            <span><i class="fa fa-eye" aria-hidden="true"></i> 98</span>
                                            <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 63</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="post-7-tab" data-toggle="pill" href="#post-7" role="tab" aria-controls="post-7" aria-selected="false">
                                <!-- Single Blog Post -->
                                <div class="single-blog-post style-2 d-flex align-items-center">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/4.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <h6 class="post-title">Meet the 12 boys rescued from cave</h6>
                                        <div class="post-meta d-flex justify-content-between">
                                            <span><i class="fa fa-comments-o" aria-hidden="true"></i> 14</span>
                                            <span><i class="fa fa-eye" aria-hidden="true"></i> 34</span>
                                            <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Trending Posts Area Start ##### -->
    <section class="trending-posts-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading">
                        <h4>Trending Videos</h4>
                        <div class="line"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Single Blog Post -->
                <div class="col-12 col-md-4">
                    <div class="single-post-area mb-80">
                        <!-- Post Thumbnail -->
                        <div class="post-thumbnail">
                            <img src="img/bg-img/11.jpg" alt="">

                            <!-- Video Duration -->
                            <span class="video-duration">05.03</span>
                        </div>

                        <!-- Post Content -->
                        <div class="post-content">
                            <a href="#" class="post-cata cata-sm cata-success">Sports</a>
                            <a href="single-post.jsp" class="post-title">Warner Bros. Developing ‘The accountant’ Sequel</a>
                            <div class="post-meta d-flex">
                                <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 22</a>
                                <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 16</a>
                                <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 15</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Blog Post -->
                <div class="col-12 col-md-4">
                    <div class="single-post-area mb-80">
                        <!-- Post Thumbnail -->
                        <div class="post-thumbnail">
                            <img src="img/bg-img/12.jpg" alt="">

                            <!-- Video Duration -->
                            <span class="video-duration">05.03</span>
                        </div>

                        <!-- Post Content -->
                        <div class="post-content">
                            <a href="#" class="post-cata cata-sm cata-danger">Game</a>
                            <a href="single-post.jsp" class="post-title">Searching for the 'angel' who held me on Westminste Bridge</a>
                            <div class="post-meta d-flex">
                                <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 28</a>
                                <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 17</a>
                                <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Blog Post -->
                <div class="col-12 col-md-4">
                    <div class="single-post-area mb-80">
                        <!-- Post Thumbnail -->
                        <div class="post-thumbnail">
                            <img src="img/bg-img/13.jpg" alt="">

                            <!-- Video Duration -->
                            <span class="video-duration">05.03</span>
                        </div>

                        <!-- Post Content -->
                        <div class="post-content">
                            <a href="#" class="post-cata cata-sm cata-primary">Business</a>
                            <a href="single-post.jsp" class="post-title">Love Island star's boyfriend found dead after her funeral</a>
                            <div class="post-meta d-flex">
                                <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 38</a>
                                <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Trending Posts Area End ##### -->

    <!-- ##### Vizew Post Area Start ##### -->
    <section class="vizew-post-area mb-50">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-7 col-lg-8">
                    <div class="all-posts-area">
                        <!-- Section Heading -->
                        <div class="section-heading style-2">
                            <h4>Featured Videos</h4>
                            <div class="line"></div>
                        </div>

                        <!-- Featured Post Slides -->
                        <div class="featured-post-slides owl-carousel mb-30">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/14.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>

                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/7.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Single Blog Post -->
                            <div class="col-12 col-md-6">
                                <div class="single-post-area mb-80">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/12.jpg" alt="">

                                        <!-- Video Duration -->
                                        <span class="video-duration">05.03</span>
                                    </div>

                                    <!-- Post Content -->
                                    <div class="post-content">
                                        <a href="#" class="post-cata cata-sm cata-danger">Game</a>
                                        <a href="single-post.jsp" class="post-title">Searching for the 'angel' who held me on Westminste Bridge</a>
                                        <div class="post-meta d-flex">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 28</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 17</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="col-12 col-md-6">
                                <div class="single-post-area mb-80">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/13.jpg" alt="">

                                        <!-- Video Duration -->
                                        <span class="video-duration">05.03</span>
                                    </div>

                                    <!-- Post Content -->
                                    <div class="post-content">
                                        <a href="#" class="post-cata cata-sm cata-primary">Business</a>
                                        <a href="single-post.jsp" class="post-title">Love Island star's boyfriend found dead after her funeral</a>
                                        <div class="post-meta d-flex">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 38</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-lg-6">
                                <!-- Section Heading -->
                                <div class="section-heading style-2">
                                    <h4>Sport Videos</h4>
                                    <div class="line"></div>
                                </div>

                                <!-- Sports Video Slides -->
                                <div class="sport-video-slides owl-carousel mb-50">
                                    <!-- Single Blog Post -->
                                    <div class="single-post-area">
                                        <!-- Post Thumbnail -->
                                        <div class="post-thumbnail">
                                            <img src="img/bg-img/15.jpg" alt="">

                                            <!-- Video Duration -->
                                            <span class="video-duration">05.03</span>
                                        </div>

                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <a href="#" class="post-cata cata-sm cata-success">Sports</a>
                                            <a href="single-post.jsp" class="post-title">Searching for the 'angel' who held me on Westminster Bridge</a>
                                            <div class="post-meta d-flex">
                                                <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                                <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 38</a>
                                                <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Single Blog Post -->
                                    <div class="single-post-area">
                                        <!-- Post Thumbnail -->
                                        <div class="post-thumbnail">
                                            <img src="img/bg-img/13.jpg" alt="">

                                            <!-- Video Duration -->
                                            <span class="video-duration">05.03</span>
                                        </div>

                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <a href="#" class="post-cata cata-sm cata-success">Sports</a>
                                            <a href="single-post.jsp" class="post-title">Searching for the 'angel' who held me on Westminster Bridge</a>
                                            <div class="post-meta d-flex">
                                                <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                                <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 38</a>
                                                <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6">
                                <!-- Section Heading -->
                                <div class="section-heading style-2">
                                    <h4>Business Videos</h4>
                                    <div class="line"></div>
                                </div>

                                <!-- Business Video Slides -->
                                <div class="business-video-slides owl-carousel mb-50">
                                    <!-- Single Blog Post -->
                                    <div class="single-post-area">
                                        <!-- Post Thumbnail -->
                                        <div class="post-thumbnail">
                                            <img src="img/bg-img/17.jpg" alt="">

                                            <!-- Video Duration -->
                                            <span class="video-duration">05.03</span>
                                        </div>

                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <a href="#" class="post-cata cata-sm cata-primary">Business</a>
                                            <a href="single-post.jsp" class="post-title">Full article Prince Charles's 'urgent' global research</a>
                                            <div class="post-meta d-flex">
                                                <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                                <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 38</a>
                                                <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Single Blog Post -->
                                    <div class="single-post-area">
                                        <!-- Post Thumbnail -->
                                        <div class="post-thumbnail">
                                            <img src="img/bg-img/13.jpg" alt="">

                                            <!-- Video Duration -->
                                            <span class="video-duration">05.03</span>
                                        </div>

                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <a href="#" class="post-cata cata-sm cata-primary">Business</a>
                                            <a href="single-post.jsp" class="post-title">Full article Prince Charles's 'urgent' global research</a>
                                            <div class="post-meta d-flex">
                                                <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                                <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 38</a>
                                                <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-30">
                            <!-- Single Blog Post -->
                            <div class="col-12 col-lg-6">
                                <div class="single-blog-post style-3 d-flex mb-50">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/16.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <a href="single-post.jsp" class="post-title">Epileptic boy's cannabis let through border</a>
                                        <div class="post-meta d-flex justify-content-between">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 16</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 26</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 17</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="col-12 col-lg-6">
                                <div class="single-blog-post style-3 d-flex mb-50">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/18.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <a href="single-post.jsp" class="post-title">Paramedics 'drilled into boat death woman'</a>
                                        <div class="post-meta d-flex justify-content-between">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 16</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 26</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 17</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="col-12 col-lg-6">
                                <div class="single-blog-post style-3 d-flex mb-50">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/19.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <a href="single-post.jsp" class="post-title">Tory vice-chairs quit over PM's Brexit plan</a>
                                        <div class="post-meta d-flex justify-content-between">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 16</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 26</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 17</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="col-12 col-lg-6">
                                <div class="single-blog-post style-3 d-flex mb-50">
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/20.jpg" alt="">
                                    </div>
                                    <div class="post-content">
                                        <a href="single-post.jsp" class="post-title">Do This One Simple Action for an Absolutely</a>
                                        <div class="post-meta d-flex justify-content-between">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 16</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 26</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 17</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Section Heading -->
                        <div class="section-heading style-2">
                            <h4>Latest News</h4>
                            <div class="line"></div>
                        </div>

                        <!-- Featured Post Slides -->
                        <div class="featured-post-slides owl-carousel mb-30">
                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/14.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>

                            <!-- Single Feature Post -->
                            <div class="single-feature-post video-post bg-img" style="background-image: url(img/bg-img/7.jpg);">
                                <!-- Play Button -->
                                <a href="video-post.jsp" class="btn play-btn"><i class="fa fa-play" aria-hidden="true"></i></a>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Reunification of migrant toddlers, parents should be completed Thursday</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 25</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 25</a>
                                    </div>
                                </div>

                                <!-- Video Duration -->
                                <span class="video-duration">05.03</span>
                            </div>
                        </div>

                        <!-- Single Post Area -->
                        <div class="single-post-area mb-30">
                            <div class="row align-items-center">
                                <div class="col-12 col-lg-6">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/21.jpg" alt="">

                                        <!-- Video Duration -->
                                        <span class="video-duration">05.03</span>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <!-- Post Content -->
                                    <div class="post-content mt-0">
                                        <a href="#" class="post-cata cata-sm cata-success">Sports</a>
                                        <a href="single-post.jsp" class="post-title mb-2">May fights on after Johnson savages Brexit approach</a>
                                        <div class="post-meta d-flex align-items-center mb-2">
                                            <a href="#" class="post-author">By Jane</a>
                                            <i class="fa fa-circle" aria-hidden="true"></i>
                                            <a href="#" class="post-date">Sep 08, 2018</a>
                                        </div>
                                        <p class="mb-2">Quisque mollis tristique ante. Proin ligula eros, varius id tristique sit amet, rutrum non ligula.</p>
                                        <div class="post-meta d-flex">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 32</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 42</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 7</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Single Post Area -->
                        <div class="single-post-area mb-30">
                            <div class="row align-items-center">
                                <div class="col-12 col-lg-6">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/22.jpg" alt="">

                                        <!-- Video Duration -->
                                        <span class="video-duration">05.03</span>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <!-- Post Content -->
                                    <div class="post-content mt-0">
                                        <a href="#" class="post-cata cata-sm cata-danger">Game</a>
                                        <a href="single-post.jsp" class="post-title mb-2">Thailand cave rescue: Boys 'doing well' after spending night</a>
                                        <div class="post-meta d-flex align-items-center mb-2">
                                            <a href="#" class="post-author">By Jane</a>
                                            <i class="fa fa-circle" aria-hidden="true"></i>
                                            <a href="#" class="post-date">Sep 08, 2018</a>
                                        </div>
                                        <p class="mb-2">Quisque mollis tristique ante. Proin ligula eros, varius id tristique sit amet, rutrum non ligula.</p>
                                        <div class="post-meta d-flex">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 32</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 42</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 7</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Single Post Area -->
                        <div class="single-post-area mb-30">
                            <div class="row align-items-center">
                                <div class="col-12 col-lg-6">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/23.jpg" alt="">

                                        <!-- Video Duration -->
                                        <span class="video-duration">05.03</span>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <!-- Post Content -->
                                    <div class="post-content mt-0">
                                        <a href="#" class="post-cata cata-sm cata-primary">Business</a>
                                        <a href="single-post.jsp" class="post-title mb-2">Theresa May battles Brexiteer backlash amid disquiet</a>
                                        <div class="post-meta d-flex align-items-center mb-2">
                                            <a href="#" class="post-author">By Jane</a>
                                            <i class="fa fa-circle" aria-hidden="true"></i>
                                            <a href="#" class="post-date">Sep 08, 2018</a>
                                        </div>
                                        <p class="mb-2">Quisque mollis tristique ante. Proin ligula eros, varius id tristique sit amet, rutrum non ligula.</p>
                                        <div class="post-meta d-flex">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 32</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 42</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 7</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Single Post Area -->
                        <div class="single-post-area mb-30">
                            <div class="row align-items-center">
                                <div class="col-12 col-lg-6">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail">
                                        <img src="img/bg-img/24.jpg" alt="">

                                        <!-- Video Duration -->
                                        <span class="video-duration">05.03</span>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <!-- Post Content -->
                                    <div class="post-content mt-0">
                                        <a href="#" class="post-cata cata-sm cata-danger">Game</a>
                                        <a href="single-post.jsp" class="post-title mb-2">Theresa May warned Brexit strategy 'risks putting Jeremy Corbyn</a>
                                        <div class="post-meta d-flex align-items-center mb-2">
                                            <a href="#" class="post-author">By Jane</a>
                                            <i class="fa fa-circle" aria-hidden="true"></i>
                                            <a href="#" class="post-date">Sep 08, 2018</a>
                                        </div>
                                        <p class="mb-2">Quisque mollis tristique ante. Proin ligula eros, varius id tristique sit amet, rutrum non ligula.</p>
                                        <div class="post-meta d-flex">
                                            <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 32</a>
                                            <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 42</a>
                                            <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 7</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-12 col-md-5 col-lg-4">
                    <div class="sidebar-area">

                        <!-- ***** Single Widget ***** -->
                        <div class="single-widget followers-widget mb-50">
                            <a href="#" class="facebook"><i class="fa fa-facebook" aria-hidden="true"></i><span class="counter">198</span><span>Fan</span></a>
                            <a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i><span class="counter">220</span><span>Followers</span></a>
                            <a href="#" class="google"><i class="fa fa-google" aria-hidden="true"></i><span class="counter">140</span><span>Subscribe</span></a>
                        </div>

                        <!-- ***** Single Widget ***** -->
                        <div class="single-widget latest-video-widget mb-50">
                            <!-- Section Heading -->
                            <div class="section-heading style-2 mb-30">
                                <h4>Latest Video</h4>
                                <div class="line"></div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-post-area mb-30">
                                <!-- Post Thumbnail -->
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/13.jpg" alt="">

                                    <!-- Video Duration -->
                                    <span class="video-duration">05.03</span>
                                </div>

                                <!-- Post Content -->
                                <div class="post-content">
                                    <a href="#" class="post-cata cata-sm cata-success">Sports</a>
                                    <a href="single-post.jsp" class="post-title">Full article Prince Charles's 'urgent' global research</a>
                                    <div class="post-meta d-flex">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 38</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 22</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-blog-post d-flex">
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/1.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="single-post.jsp" class="post-title">DC Shoes: gymkhana five; the making of</a>
                                    <div class="post-meta d-flex justify-content-between">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 29</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 08</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 23</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-blog-post d-flex">
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/2.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="single-post.jsp" class="post-title">Sweet Yummy Chocolatea Tea</a>
                                    <div class="post-meta d-flex justify-content-between">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 17</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 33</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 26</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-blog-post d-flex">
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/35.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="single-post.jsp" class="post-title">How To Make Orange Chicken Recipe?</a>
                                    <div class="post-meta d-flex justify-content-between">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 11</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 42</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 21</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ***** Single Widget ***** -->
                        <div class="single-widget add-widget mb-50">
                            <a href="#"><img src="img/bg-img/add.png" alt=""></a>
                        </div>

                        <!-- ***** Sidebar Widget ***** -->
                        <div class="single-widget youtube-channel-widget mb-50">
                            <!-- Section Heading -->
                            <div class="section-heading style-2 mb-30">
                                <h4>Hot Channels</h4>
                                <div class="line"></div>
                            </div>

                            <!-- Single YouTube Channel -->
                            <div class="single-youtube-channel d-flex align-items-center">
                                <div class="youtube-channel-thumbnail">
                                    <img src="img/bg-img/25.jpg" alt="">
                                </div>
                                <div class="youtube-channel-content">
                                    <a href="single-post.jsp" class="channel-title">Music Channel</a>
                                    <a href="#" class="btn subscribe-btn"><i class="fa fa-play-circle-o" aria-hidden="true"></i> Subscribe</a>
                                </div>
                            </div>

                            <!-- Single YouTube Channel -->
                            <div class="single-youtube-channel d-flex align-items-center">
                                <div class="youtube-channel-thumbnail">
                                    <img src="img/bg-img/26.jpg" alt="">
                                </div>
                                <div class="youtube-channel-content">
                                    <a href="single-post.jsp" class="channel-title">Trending Channel</a>
                                    <a href="#" class="btn subscribe-btn"><i class="fa fa-play-circle-o" aria-hidden="true"></i> Subscribe</a>
                                </div>
                            </div>

                            <!-- Single YouTube Channel -->
                            <div class="single-youtube-channel d-flex align-items-center">
                                <div class="youtube-channel-thumbnail">
                                    <img src="img/bg-img/27.jpg" alt="">
                                </div>
                                <div class="youtube-channel-content">
                                    <a href="single-post.jsp" class="channel-title">Travel Channel</a>
                                    <a href="#" class="btn subscribe-btn"><i class="fa fa-play-circle-o" aria-hidden="true"></i> Subscribe</a>
                                </div>
                            </div>

                            <!-- Single YouTube Channel -->
                            <div class="single-youtube-channel d-flex align-items-center">
                                <div class="youtube-channel-thumbnail">
                                    <img src="img/bg-img/28.jpg" alt="">
                                </div>
                                <div class="youtube-channel-content">
                                    <a href="single-post.jsp" class="channel-title">Sport Channel</a>
                                    <a href="#" class="btn subscribe-btn"><i class="fa fa-play-circle-o" aria-hidden="true"></i> Subscribe</a>
                                </div>
                            </div>

                            <!-- Single YouTube Channel -->
                            <div class="single-youtube-channel d-flex align-items-center">
                                <div class="youtube-channel-thumbnail">
                                    <img src="img/bg-img/29.jpg" alt="">
                                </div>
                                <div class="youtube-channel-content">
                                    <a href="single-post.jsp" class="channel-title">TV Show Channel</a>
                                    <a href="#" class="btn subscribe-btn"><i class="fa fa-play-circle-o" aria-hidden="true"></i> Subscribe</a>
                                </div>
                            </div>
                        </div>

                        <!-- ***** Single Widget ***** -->
                        <div class="single-widget newsletter-widget mb-50">
                            <!-- Section Heading -->
                            <div class="section-heading style-2 mb-30">
                                <h4>Newsletter</h4>
                                <div class="line"></div>
                            </div>
                            <p>Subscribe our newsletter gor get notification about new updates, information discount, etc.</p>
                            <!-- Newsletter Form -->
                            <div class="newsletter-form">
                                <form action="#" method="post">
                                    <input type="email" name="nl-email" class="form-control mb-15" id="emailnl" placeholder="Enter your email">
                                    <button type="submit" class="btn vizew-btn w-100">Subscribe</button>
                                </form>
                            </div>
                        </div>

                        <!-- ***** Single Widget ***** -->
                        <div class="single-widget mb-50">
                            <!-- Section Heading -->
                            <div class="section-heading style-2 mb-30">
                                <h4>Most Viewed Playlist</h4>
                                <div class="line"></div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-blog-post d-flex">
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/1.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="single-post.jsp" class="post-title">DC Shoes: gymkhana five; the making of</a>
                                    <div class="post-meta d-flex justify-content-between">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 34</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-blog-post d-flex">
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/2.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="single-post.jsp" class="post-title">How To Make Orange Chicken Recipe?</a>
                                    <div class="post-meta d-flex justify-content-between">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 34</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-blog-post d-flex">
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/36.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="single-post.jsp" class="post-title">Sweet Yummy Chocolate in the</a>
                                    <div class="post-meta d-flex justify-content-between">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 34</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-blog-post d-flex">
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/37.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="single-post.jsp" class="post-title">DC Shoes: gymkhana five; the making of</a>
                                    <div class="post-meta d-flex justify-content-between">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 34</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Blog Post -->
                            <div class="single-blog-post d-flex">
                                <div class="post-thumbnail">
                                    <img src="img/bg-img/38.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="single-post.jsp" class="post-title">How To Make Orange Chicken Recipe?</a>
                                    <div class="post-meta d-flex justify-content-between">
                                        <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 34</a>
                                        <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Vizew Psot Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row">
                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <!-- Logo -->
                        <a href="index.jsp" class="foo-logo d-block mb-4"><img src="img/core-img/logo2.png" alt=""></a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>
                        <!-- Footer Newsletter Area -->
                        <div class="footer-nl-area">
                            <form action="#" method="post">
                                <input type="email" name="nl-email" class="form-control" id="nlEmail" placeholder="Your email">
                                <button type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">Latest Twister</h6>
                        <!-- Twitter Slides -->
                        <div class="twitter-slides owl-carousel">

                            <!-- Single Twitter Slide -->
                            <div class="single--twitter-slide">
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i> <span>@Leonard</span> I am so happy because I found this magazine, and it just made Vizeweasier. Thanks for sharing</p>
                                </div>
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i> <span>@Leonard</span> I am so happy because I found this magazine, and it just made Vizeweasier. Thanks for sharing</p>
                                </div>
                            </div>

                            <!-- Single Twitter Slide -->
                            <div class="single--twitter-slide">
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i> <span>@Colorlib</span> I am so happy because I found this magazine, and it just made Vizeweasier. Thanks for sharing</p>
                                </div>
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i> <span>@Colorlib</span> I am so happy because I found this magazine, and it just made Vizeweasier. Thanks for sharing</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">Sport Videos</h6>

                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex">
                            <div class="post-thumbnail">
                                <img src="img/bg-img/1.jpg" alt="">
                            </div>
                            <div class="post-content">
                                <a href="single-post.jsp" class="post-title">DC Shoes: gymkhana the</a>
                                <div class="post-meta d-flex justify-content-between">
                                    <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                    <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 34</a>
                                    <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</a>
                                </div>
                            </div>
                        </div>

                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex">
                            <div class="post-thumbnail">
                                <img src="img/bg-img/2.jpg" alt="">
                            </div>
                            <div class="post-content">
                                <a href="single-post.jsp" class="post-title">Sweet Yummy Chocolatea Tea</a>
                                <div class="post-meta d-flex justify-content-between">
                                    <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i> 14</a>
                                    <a href="#"><i class="fa fa-eye" aria-hidden="true"></i> 34</a>
                                    <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 84</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">Our Address</h6>
                        <!-- Contact Address -->
                        <div class="contact-address">
                            <p>101 E 129th St, East Chicago, <br>IN 46312, US</p>
                            <p>Phone: 001-1234-88888</p>
                            <p>Email: info.colorlib@gmail.com</p>
                        </div>
                        <!-- Footer Social Area -->
                        <div class="footer-social-area">
                            <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                            <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                            <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Copywrite Area -->
        <div class="copywrite-area">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Copywrite Text -->
                    <div class="col-12 col-sm-6">
                        <p class="copywrite-text"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                    <div class="col-12 col-sm-6">
                        <nav class="footer-nav">
                            <ul>
                                <li><a href="#">Advertise</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Disclaimer</a></li>
                                <li><a href="#">Privacy</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>