<%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/13
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<<<<<< HEAD
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>皮皮手机销售平台</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/index.css" />
</head>
<body>
<header id="header">
    <%@include file="head.txt"%>
</header>
<div id="body">
    <div class="picture">
        <div id="myCarousel" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active" style="background:#223240">
                    <img src="images/slide1.png" alt="第一张">
                </div>
                <div class="item" style="background:#F5E4DC;">
                    <img src="images/slide2.png" alt="第二张">
                </div>
                <div class="item" style="background:#DE2A2D;">
                    <img src="images/slide3.png" alt="第三张">
                </div>
            </div>
            <a href="#myCarousel" data-slide="prev" class="carousel-control left">&lsaquo;</a>
            <a href="#myCarousel" data-slide="next" class="carousel-control right">&rsaquo;</a>
        </div>


        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function () {

                //轮播自动播放
                $('#myCarousel').carousel({
                    //自动2秒播放
                    interval : 3000,
                });

                //设置垂直居中
                $('.carousel-control').css('line-height', $('.carousel-inner img').height() + 'px');
                $(window).resize(function () {
                    var $height = $('.carousel-inner img').eq(0).height() ||
                        $('.carousel-inner img').eq(1).height() ||
                        $('.carousel-inner img').eq(2).height();
                    $('.carousel-control').css('line-height', $height + 'px');
                });

            });
        </script>

    </div>
    <div id="information">
        <section>
            <h2>手机信息</h2>
            <hr/>
        </section>
        <figure>
            <img src="images/p1.jpg" alt=""/>
            <figcaption>
                <stong class="title">&lt;iphone 5s&gt;</stong>
                苹果iPhone 5s延续了上一代iPhone5的经典设计。但为了形成差异化，Home键的部位，去掉了中间的小方块，整个样子非常平整，材质也采用了坚固的蓝宝石玻璃设计。Home键的外侧拥有一圈感应光环，可以用来唤醒指纹识别。iPhone 5s还提供了深空灰色、银色、香槟金版本机身。
                <div class="info">
                    <em class="sat">好评率 97%</em>
                    <span class="price">￥<strong>2864</strong>起</span>
                </div>
            </figcaption>
        </figure>
        <figure>
            <img src="images/p2.jpg" alt=""/>
            <figcaption>
                <stong class="title">&lt;vivo x18&gt;</stong>
                vivo为一个专注于智能手机领域的手机品牌，vivo和追求乐趣、充满活力、年轻时尚的群体一起打造拥有卓越外观、专业级音质、极致影像、愉悦体验的智能产品，并将敢于追求极致、持续创造惊喜作为vivo的坚定追求。
                <div class="info">
                    <em class="sat">好评率 96%</em>
                    <span class="price">￥<strong>3459</strong>起</span>
                </div>
            </figcaption>
        </figure>

        <figure>
            <img src="images/p7.jpg" alt=""/>
            <figcaption>
                <stong class="title">&lt;Surface Phone&gt;</stong>
                媒体分析称，这款新机或为传闻中的“高端机型”，根据此前的传闻，其定价或将超过 iPhone。更让人惊艳的是，来自 Windows Central 的消息暗示，该机或将直接采用 Windows 10 平台，而非 Windows 10 Mobile，也就是说，该机或将以某些方式直接支持 Win32 应用。
                <div class="info">
                    <em class="sat">好评率 93%</em>
                    <span class="price">￥<strong>4905</strong>起</span>
                </div>
            </figcaption>
        </figure>
        <figure>
            <img src="images/p4.jpg" alt=""/>
            <figcaption>
                <stong class="title">&lt;Best Sonny&gt;</stong>
                Best Sonny，是联络科技致力于打造自己特色的一个手机品牌。2008年10月成功上市，签约古天乐。2009年正式与中国移动合作，开发出3G产品。
                <div class="info">
                    <em class="sat">好评率 94%</em>
                    <span class="price">￥<strong>3456</strong>起</span>
                </div>
            </figcaption>
        </figure>
    </div>
</div>
<hr/>
<div id="footer">
    <div class="top">
        <div class="block left">
            <h2>合作伙伴</h2>
            <hr/>
            <ul>
                <li>淘宝网</li>
                <li>驴妈妈旅游网</li>
                <li>携程旅游</li>
                <li>阿里巴巴</li>
            </ul>
        </div>
        <div class="block center">
            <h2>顾客反馈</h2>
            <hr/>
            <ul>
                <li>反馈方式？</li>
                <li>商品定价？</li>
                <li>商品质量？</li>
                <li>商品具体信息？</li>
            </ul>
        </div>
        <div class="block right">
            <h2>联系方式</h2>
            <hr/>
            <ul>
                <li>微博：pipitaobao.com</li>
                <li>邮件：pipitaobao@qq.com</li>
                <li>地址：安徽省滁州市安徽科技学院东十#424</li>
            </ul>
        </div>
    </div>
    <div class="bottom">Copyright ©  皮皮手机网| 皖ICP 备120110119 号| 经营许可证：L-YC-BK12345</div>
</div>
=======
<html>
<head>
    <title>智能手机购物网站</title>
</head>
<body>
<%@ include file="head.txt" %>
>>>>>>> 745c1e38ee76aa8ef22bc5416e03d6060497dc19
</body>
</html>
