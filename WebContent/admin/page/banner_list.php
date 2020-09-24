<?session_start();
@ob_start();

include "../include/header_admin.php";
?>
<!-- //end header -->

    
<header>
    <h1>ADMIN</h1>
    <div class="location">
        <span>홈</span>
        <span>배너</span>
    </div>
</header>

<section class="section_admin">
    <nav>
        <ul>
            <li><a href="./write_buy.php">상호</a></li>
            <li><a href="./category.php">카테고리</a></li>
            <li><a href="../page/list_sell.php" target="_blank">팝니다 제품</a></li>
            <li><a href="../page/list_buy.php" target="_blank">삽니다 제품</a></li>
            <li><a href="./member_list.php">회원</a></li>
            <li><a href="./banner_list.php" class="active">배너</a></li>
            <li><a href="./setting_user.php">접속자설정</a></li>
            <li><a href="./setting_goods.php">메인상품설정</a></li>
            <li><a href="./qna_list.php">Q&A</a></li>
        </ul>
    </nav>

    <div class="content_admin">
        <h2>배너</h2>
        <div class="tableCommon list">
            <table>
                <colgroup>
                    <col style="width:80px;">
                    <col style="width:100px;">
                    <col style="width:;">
                    <col style="width:200px;">
                    <col style="width:100px;">
                    <col style="width:100px;">
                </colgroup>
                <tr>
                    <th>번호</th>
                    <th>이미지</th>
                    <th>배너명</th>
                    <th>링크</th>
                    <th>등록일</th>
                    <th>위치</th>
                </tr>
                <tr>
                    <td>11</td>
                    <td><img src="../images/img_sample.png" alt=""></td>
                    <td>배너명배너명배너명</td>
                    <td><a href="javascript:;">http://www.asdfas.asdf</a></td>
                    <td>20-05-10</td>
                    <td>왼쪽</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td><img src="../images/img_sample.png" alt=""></td>
                    <td>배너명배너명배너명</td>
                    <td><a href="javascript:;">http://www.asdfas.asdf</a></td>
                    <td>20-05-10</td>
                    <td>왼쪽</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td><img src="../images/img_sample.png" alt=""></td>
                    <td>배너명배너명배너명</td>
                    <td><a href="javascript:;">http://www.asdfas.asdf</a></td>
                    <td>20-05-10</td>
                    <td>왼쪽</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td><img src="../images/img_sample.png" alt=""></td>
                    <td>배너명배너명배너명</td>
                    <td><a href="javascript:;">http://www.asdfas.asdf</a></td>
                    <td>20-05-10</td>
                    <td>왼쪽</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td><img src="../images/img_sample.png" alt=""></td>
                    <td>배너명배너명배너명</td>
                    <td><a href="javascript:;">http://www.asdfas.asdf</a></td>
                    <td>20-05-10</td>
                    <td>왼쪽</td>
                </tr>
            </table>
        </div>

        <div class="btnBox txt_right">
            <a href="javascript:;" class="btn2 bg_blue">추가</a>
        </div>
    </div>
    
</section> <!-- //header 파일에 있음 -->

<!-- footer -->
<?include "../include/oldie.php";?>

<!-- footer -->
<?include "../include/footer_admin.php";?>