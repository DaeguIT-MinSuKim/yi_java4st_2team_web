<?session_start();
@ob_start();

include "../include/header_admin.php";
?>
<!-- //end header -->
<header>
    <h1>ADMIN</h1>
    <div class="location">
        <span>홈</span>
        <span>메인상품설정</span>
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
            <li><a href="./setting_goods.php" class="active">메인상품설정</a></li>
            <li><a href="./qna_list.php">Q&A</a></li>
        </ul>
    </nav>

    <div class="content_admin">
        <h2>메인상품설정</h2>
        <div class="tableCommon">
            <table>
                <tr>
                    <th>접속시 증가 카운트</th>
                    <td class="labelBox">
                        <label class="radio_label">
                            <input type="radio">
                            <span>일</span>
                        </label>
                        <label class="radio_label">
                            <input type="radio">
                            <span>월</span>
                        </label>
						<label class="radio_label">
                            <input type="radio">
                            <span>화</span>
                        </label>
                        <label class="radio_label">
                            <input type="radio">
                            <span>수</span>
                        </label>
						<label class="radio_label">
                            <input type="radio">
                            <span>목</span>
                        </label>
                        <label class="radio_label">
                            <input type="radio">
                            <span>금</span>
                        </label>
						<label class="radio_label">
                            <input type="radio">
                            <span>토</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>변경타입</th>
                    <td>
						<input type="text" style="min-width:auto; width:80px">
						<span>~</span>
						<input type="text" style="min-width:auto; width:80px">
						<span>(범위안에서 랜덤 적용)</span>
					</td>
                </tr>
				<tr>
                    <th>등록제품</th>
                    <td class="labelBox">
						<label class="radio_label">
                            <input type="checkbox">
                            <span>선택제품우선</span>
                        </label>
						<label class="radio_label">
                            <input type="checkbox">
                            <span>추천, 급매 제품</span>
                        </label>
						<label class="radio_label">
                            <input type="checkbox">
                            <span>랜덤</span>
                        </label>
					</td>
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