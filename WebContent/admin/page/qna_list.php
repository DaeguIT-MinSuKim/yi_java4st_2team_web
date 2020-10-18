<?session_start();
@ob_start();

include "../include/header_admin.php";
?>
<!-- //end header -->
<header>
    <h1>ADMIN</h1>
    <div class="location">
        <span>홈</span>
        <span>Q&A</span>
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
            <li><a href="./banner_list.php">배너</a></li>
            <li><a href="./setting_user.php">접속자설정</a></li>
            <li><a href="./setting_goods.php">메인상품설정</a></li>
            <li><a href="./qna_list.php" class="active">Q&A</a></li>
        </ul>
    </nav>

    <div class="content_admin">
        <h2>Q&A</h2>
        <div class="tableCommon list">
            <table>
                <colgroup>
                    <col style="width:130px;">
                    <col style="width:130px;">
                    <col style="width:;">
                    <col style="width:130px;">
                    <col style="width:130px;">
                </colgroup>
                <tr>
                    <th>번호</th>
                    <th>회원 ID</th>
                    <th>제목</th>
                    <th>전화번호</th>
                    <th>등록일</th>
                </tr>
                <tr>
                    <td>12</td> 
                    <td>asdf</td>
                    <td><a href="javascript:;">제목제목제목</a></td>
                    <td>010-1234-5678</td>
                    <td>20-10-12</td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>asdf</td>
                    <td><a href="javascript:;">제목제목제목</a></td>
                    <td>010-1234-5678</td>
                    <td>20-10-12</td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>asdf</td>
                    <td><a href="javascript:;">제목제목제목</a></td>
                    <td>010-1234-5678</td>
                    <td>20-10-12</td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>asdf</td>
                    <td><a href="javascript:;">제목제목제목</a></td>
                    <td>010-1234-5678</td>
                    <td>20-10-12</td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>asdf</td>
                    <td><a href="javascript:;">제목제목제목</a></td>
                    <td>010-1234-5678</td>
                    <td>20-10-12</td>
                </tr>
            </table>
        </div>
    </div>
    
</section> <!-- //header 파일에 있음 -->

<!-- footer -->
<?include "../include/oldie.php";?>

<!-- footer -->
<?include "../include/footer_admin.php";?>