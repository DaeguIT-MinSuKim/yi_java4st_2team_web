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
        <h2>배너 등록</h2>
        <div class="tableCommon">
            <table>
                <tr>
                    <th>배너명</th>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>위치</th>
                    <td class="labelBox">
                        <label class="radio_label">
                            <input type="radio">
                            <span>왼쪽</span>
                        </label>
                        <label class="radio_label">
                            <input type="radio">
                            <span>오른쪽</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>링크 방법</th>
                    <td class="labelBox">
                        <label class="radio_label">
                            <input type="radio">
                            <span>새창</span>
                        </label>
                        <label class="radio_label">
                            <input type="radio">
                            <span>현재위치</span>
                        </label>
                        <label class="radio_label">
                            <input type="radio">
                            <span>홈페이지 이미지 page</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>링크주소</th>
                    <td><input type="text" disabled></td>
                </tr>
                <tr>
                    <th>이미지</th>
                    <td><input type="file"></td>
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