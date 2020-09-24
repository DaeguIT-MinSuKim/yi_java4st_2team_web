<?session_start();
@ob_start();

include "../include/header_admin.php";
?>
<!-- //end header -->
<header>
    <h1>ADMIN</h1>
    <div class="location">
        <span>홈</span>
        <span>카테고리</span>
    </div>
</header>

<section class="section_admin">
    <nav>
        <ul>
            <li><a href="./write_buy.php" class="active">상호</a></li>
            <li><a href="./category.php">카테고리</a></li>
            <li><a href="../page/list_sell.php" target="_blank">팝니다 제품</a></li>
            <li><a href="../page/list_buy.php" target="_blank">삽니다 제품</a></li>
            <li><a href="./member_list.php">회원</a></li>
            <li><a href="./banner_list.php">배너</a></li>
            <li><a href="./setting_user.php">접속자설정</a></li>
            <li><a href="./setting_goods.php">메인상품설정</a></li>
            <li><a href="./qna_list.php">Q&A</a></li>
        </ul>
    </nav>

    <div class="content_admin">
        <h2>상호등록</h2>
        <div class="tableCommon">
            <table>
                <tr>
                    <th>상호</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>사업자번호</th>
                    <td><input type="number"></td>
                </tr>
                <tr>
                    <th>대표자명</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="number"></td>
                </tr>
                <tr>
                    <th>팩스</th>
                    <td><input type="number"></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>도메인</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>로고</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>은행입금배너</th>
                    <td><input type="text"></td>
                </tr>
            </table>
        </div>

        <div class="btnBox txt_right">
            <a href="javascript:;" class="btn2 bg_blue">등록</a>
        </div>
    </div>
    
</section> <!-- //header 파일에 있음 -->

<!-- footer -->
<?include "../include/oldie.php";?>

<!-- footer -->
<?include "../include/footer_admin.php";?>